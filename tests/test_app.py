from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify(message="Welcome to the Home Page"), 200


@app.errorhandler(404)
def page_not_found(e):
    return jsonify(error="Page not found"), 404


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
