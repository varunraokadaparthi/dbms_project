#cd /Users/saideepsamineni/Neu/Dbms_Project/Python
#http://127.0.0.1:5000
from flask import Flask, render_template, request, redirect, url_for
import pymysql
#import mysql.connector

app = Flask(__name__)

# connect to the database
db = pymysql.connect(
  host="localhost",
  user="root",
  password="123!@#asd",
  database="project",
  charset='utf8mb4',
  cursorclass=pymysql.cursors.DictCursor
)

# create a cursor object
cursor = db.cursor()

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/login", methods=["POST"])
def login():
    username = request.form["username"]
    password = request.form["password"]

    # query the database for the username and password
    query = "SELECT * FROM NUser WHERE username=%s AND upassword=%s"
    cursor.execute(query, (username, password))
    user = cursor.fetchone()

    if user:
        return redirect(url_for("events", user_id=user.get("id")))
    else:
        return redirect(url_for("index"))

@app.route("/create_account")
def create_account():
    return render_template("create_account.html")

@app.route("/create_account", methods=["POST"])
def create_account_post():
    username = request.form["username"]
    upassword = request.form["password"]
    first_name = request.form["first_name"]
    last_name = request.form["last_name"]
    phone_number = request.form["phone_number"]
    age = request.form["age"]
    gender = request.form["gender"]
    email_id = request.form["email_id"]
    hint = request.form["hint"]
    languages_known = request.form["languages_known"]


    # check if the username already exists
    query = "SELECT * FROM NUser WHERE username=%s"
    cursor.execute(query, (username))
    user = cursor.fetchone()

    if user:
        return redirect(url_for("create_account"))
    else:
        # insert the new user into the database
        query = "INSERT INTO NUser (first_name, last_name, phone_number, age, gender, email_id, username, upassword, hint, languages_known) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
        cursor.execute(query, (first_name, last_name, phone_number, age, gender, email_id, username, upassword, hint, languages_known))
        db.commit()
        return redirect(url_for("index"))


@app.route("/events")
def events():
    user_id = request.args.get("user_id")

    query = "SELECT * FROM NUser WHERE id=%s"
    cursor.execute(query, (user_id))
    user = cursor.fetchone()

    return render_template("events.html", name = (user.get("first_name") + " "+ user.get("last_name")))

@app.route("/carpooling")
def carpooling():
    user_id = request.args.get("user_id")
    return render_template("carpooling.html", user_id=user_id)

@app.route("/messaging")
def messaging():
    user_id = request.args.get("user_id")
    return render_template("messaging.html", user_id=user_id)

@app.route("/profile")
def profile():
    user_id = request.args.get("user_id")
    # # insert the new user into the database
    # query = "INSERT INTO NUser (first_name, last_name, phone_number, age, gender, email_id, username, upassword, hint, languages_known) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
    # cursor.execute(query, (first_name, last_name, phone_number, age, gender, email_id, username, upassword, hint, languages_known))
    # db.commit()
    return render_template("profile.html", user_id=user_id)

if __name__ == "__main__":
    app.run(debug=True)
