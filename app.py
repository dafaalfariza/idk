from flask import Flask, request, jsonify
from transformers import pipeline

app = Flask(__name__)
generator = pipeline("text-generation", model="sshleifer/tiny-gpt2")

@app.route("/")
def home():
    return "Generative AI Flask API is running!"

@app.route("/generate", methods=["POST"])
def generate_text():
    data = request.get_json()
    prompt = data.get("prompt", "")
    output = generator(prompt, max_length=50, num_return_sequences=1)
    return jsonify(output[0])

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
