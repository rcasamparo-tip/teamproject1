from flask import Flask, request, redirect, url_for, render_template

app = Flask(__name__)

@app.route("/", methods = ['GET','POST'])
def login():
    return render_template("login.html")

@app.route("/reg")
def register():
    return render_template("registration.html")

if __name__ == "__main__":
    app.run(host = "0.0.0.0", port = 8000, debug=True)

