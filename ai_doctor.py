import mysql.connector
import re
import os
import google.generativeai as genai

# --- Global variable to track current patient info ---
current_patient = {
    "name": None,
    "age": None,
    "gender": None,
    "is_registered": False,
    "awaiting_location": False
}

# --- Initialize Gemini API ---
def init_gemini():
    api_key = os.getenv("GEMINI_API_KEY") or "AIzaSyC-hZwFe1QlGYzesWSqdX7gxLbrrgpEvNE"
    genai.configure(api_key=api_key)
    return genai

# --- Search medications for single conditions ---
def search_medications(condition):
    try:
        conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='Lakshay@133',
            database='ai_doctor'
        )
        cursor = conn.cursor()
        query = "SELECT name, description, dosage, side_effects FROM medications WHERE `condition` LIKE %s"
        cursor.execute(query, (f"%{condition.lower()}%",))
        results = cursor.fetchall()
        conn.close()
        return results
    except mysql.connector.Error as e:
        print(f"Database error: {e}")
        return []

# --- Search treatments for multiple symptoms ---
def search_multi_symptom_treatments(symptoms):
    try:
        conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='Lakshay@133',
            database='ai_doctor'
        )
        cursor = conn.cursor()
        query = "SELECT symptom_list, likely_disease, description, medications, dosage, side_effects FROM multi_symptom_treatments"
        cursor.execute(query)
        results = cursor.fetchall()
        conn.close()

        input_symptoms_set = set(symptoms)

        for row in results:
            db_symptoms_str, likely_disease, description, medications, dosage, side_effects = row
            db_symptoms_set = set(s.strip() for s in db_symptoms_str.split(","))
            if input_symptoms_set == db_symptoms_set:
                return [(likely_disease, description, medications, dosage, side_effects)]
        return []
    except mysql.connector.Error as e:
        print(f"Database error: {e}")
        return []

# --- Format medication information for display ---
def format_medication_info(medications):
    if not medications:
        return "No specific medications found in our database for this condition."
    name, description, dosage, side_effects = medications[0]
    return f"""
    <div class='med-box'>
        <h3>RECOMMENDED MEDICATION</h3>
        <p><strong>Medicine:</strong> {name}</p>
        <p><strong>Description:</strong> {description}</p>
        <p><strong>Dosage:</strong> {dosage}</p>
        <p><strong>Side Effects:</strong> {side_effects}</p>
    </div>
    """

# --- Format multi-symptom info ---
def format_multi_symptom_info(treatment):
    likely_disease, description, medications, dosage, side_effects = treatment
    return f"""
    <div class='med-box'>
        <p><strong>Disease:</strong> {likely_disease}</p>
        <p><strong>Description:</strong> {description}</p>
        <p><strong>Medications:</strong> {medications}</p>
        <p><strong>Dosage:</strong> {dosage}</p>
        <p><strong>Side Effects:</strong> {side_effects}</p>
    </div>
    """

# --- Search doctors by location ---
def search_doctors_by_location(location):
    try:
        conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='Lakshay@133',
            database='ai_doctor'
        )
        cursor = conn.cursor()
        query = "SELECT name, specialization, contact, availability FROM doctors WHERE location LIKE %s"
        cursor.execute(query, (f"%{location}%",))
        results = cursor.fetchall()
        conn.close()
        return results
    except mysql.connector.Error as e:
        print(f"Database error: {e}")
        return []

# --- Format doctor info ---
def format_doctor_info(doctors, location):
    if not doctors:
        return f"No doctors found near {location.title()}."
    response = f"<div class='doc-box'><h3>Doctors near {location.title()}:</h3>"
    for doc in doctors:
        name, specialization, contact, availability = doc
        response += f"""
            <p><strong>Name:</strong> {name}</p>
            <p><strong>Specialization:</strong> {specialization}</p>
            <p><strong>Contact:</strong> {contact}</p>
            <p><strong>Availability:</strong> {availability}</p>
            <hr/>
        """
    response += "</div>"
    return response

# --- Extract conditions from user query ---
def extract_conditions(query):
    symptom_to_condition = {
        "headache": "headache",
        "fever": "fever",
        "cold": "cold",
        "cough": "cough",
        "sore throat": "sore throat",
        "runny nose": "cold",
        "sneezing": "cold",
        "chills": "fever",
        "body ache": "pain",
        "pain": "pain",
        "stomach ache": "stomach pain",
        "diarrhea": "diarrhea",
        "nausea": "nausea",
        "vomiting": "vomiting",
        "allergy": "allergy",
        "rash": "skin rash",
        "itching": "skin rash",
        "insomnia": "insomnia"
    }
    detected = []
    for symptom, condition in symptom_to_condition.items():
        if symptom in query.lower():
            detected.append(condition)
    return list(set(detected))

# --- Enhance Gemini response with database info ---
def enhance_with_db_info(query, gemini_response, conversation_history, message_count):
    cleaned_conditions = extract_conditions(query)
    if len(cleaned_conditions) == 1:
        condition = cleaned_conditions[0]
        medications = search_medications(condition)
        if medications:
            current_patient["awaiting_location"] = True
            return f"<p>Based on your symptom, I recommend:</p>{format_medication_info(medications)}<p>Would you like to find a doctor near you? (yes/no)</p>"
    elif len(cleaned_conditions) > 1:
        treatments = search_multi_symptom_treatments(cleaned_conditions)
        if treatments:
            current_patient["awaiting_location"] = True
            return f"<p>Based on your symptoms, I suspect:</p>{format_multi_symptom_info(treatments[0])}<p>Would you like to find a doctor near you? (yes/no)</p>"
    return gemini_response

# --- Query Gemini API ---
def query_gemini(client, query, conversation_history, message_count):
    model = client.GenerativeModel("gemini-2.0-flash-lite")
    system_prompt = """
    You are a helpful medical assistant designed to provide brief, conversational guidance.
    1. Identify possible conditions based on symptoms.
    2. Provide short, empathetic responses.
    3. Let the database handle exact medication recommendations.
    """
    chat = model.start_chat(history=[])
    try:
        response = chat.send_message(f"{system_prompt}\n\nUser: {query}\nConversation history: {conversation_history}\nMessage count: {message_count}")
        return response.text
    except Exception as e:
        print(f"Error querying Gemini API: {e}")
        return "I'm having trouble processing your request. Could you please try again?"

# --- Remove unwanted characters ---
def strip_ansi(text):
    ansi_escape = re.compile(r'\x1B[@-_][0-?]*[ -/]*[@-~]')
    return ansi_escape.sub('', text)

# --- Main Chatbot Logic ---
def process_query(query: str) -> str:
    global current_patient

    if not current_patient["name"]:
        if len(query.strip()) < 2 or any(char.isdigit() for char in query):
            return "Please enter a valid name (at least 2 characters, no numbers)."
        current_patient["name"] = query.strip().title()
        return f"Thanks, {current_patient['name']}! What's your age?"

    if not current_patient["age"]:
        if query.strip().isdigit():
            current_patient["age"] = int(query.strip())
            return "Got it! Now, could you please tell me your gender (Male/Female/Other)?"
        else:
            return "Please enter a valid age (a number)."

    if not current_patient["gender"]:
        gender = query.strip().lower()
        if gender in ["male", "female", "other"]:
            current_patient["gender"] = gender.capitalize()
            try:
                conn = mysql.connector.connect(
                    host='localhost',
                    user='root',
                    password='Lakshay@133',
                    database='ai_doctor'
                )
                cursor = conn.cursor()
                cursor.execute(
                    "INSERT INTO patients (name, age, gender) VALUES (%s, %s, %s)",
                    (current_patient["name"], current_patient["age"], current_patient["gender"])
                )
                conn.commit()
                conn.close()
                current_patient["is_registered"] = True
                return f"Thank you, {current_patient['name']}! How can I assist you with your symptoms today?"
            except mysql.connector.Error as e:
                print(f"Error inserting patient: {e}")
                return "Sorry, something went wrong while saving your information. Please try again."
        else:
            return "Please enter a valid gender (Male/Female/Other)."

    # --- Modified handling for doctor location flow ---
    if current_patient.get("awaiting_location"):
        user_input = query.strip().lower()
        if user_input == "yes":
            return "Please enter your location (e.g., Tambaram, Anna Nagar, T Nagar, etc.):"
        elif user_input == "no":
            current_patient["awaiting_location"] = False
            return "Alright! Is there anything else I can help you with?"
        else:
            location = query.strip().title()
            doctors = search_doctors_by_location(location)
            current_patient["awaiting_location"] = False
            return format_doctor_info(doctors, location)

    client = init_gemini()
    history = []
    response = query_gemini(client, query, "", 1)
    enhanced = enhance_with_db_info(query, response, [], 1)
    final_output = enhanced or response
    return strip_ansi(final_output)
