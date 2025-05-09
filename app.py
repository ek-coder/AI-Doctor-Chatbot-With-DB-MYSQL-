from flask import Flask, request, jsonify, render_template
from ai_doctor import process_query  

app = Flask(__name__)

@app.route("/")
def home():
    return render_template("index.html")

@app.route("/ask", methods=["POST"])
def ask():
    data = request.get_json()
    query = data.get("query", "").strip()
    if not query:
        return jsonify({"response": "Please enter some symptoms."})
    # Call into your existing AI+DB logic
    response = process_query(query)
    return jsonify({"response": response})

if __name__ == "__main__":
    # Change port if you need to
    app.run(debug=True, port=5050)
