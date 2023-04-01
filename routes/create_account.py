from flask import Flask, render_template, request, redirect, url_for, Blueprint
from db import db, cursor

create_account_bp = Blueprint("create_account_bp", __name__)


@create_account_bp.route("/create_account")
def create_account():
    return render_template("create_account.html")

@create_account_bp.route("/create_account", methods=["POST"])
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
        return redirect(url_for("create_account_bp.create_account"))
    else:
        # insert the new user into the database
        query = "INSERT INTO NUser (first_name, last_name, phone_number, age, gender, email_id, username, upassword, hint, languages_known) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
        cursor.execute(query, (first_name, last_name, phone_number, age, gender, email_id, username, upassword, hint, languages_known))
        db.commit()
        return redirect(url_for("index_bp.index"))