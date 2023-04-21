from flask import Flask, render_template, request, redirect, url_for, Blueprint
from db import db

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
    date_of_birth = request.form["date_of_birth"]
    gender = request.form["gender"]
    email_id = request.form["email_id"]
    hint = request.form["hint"]

    with db.cursor() as cursor:
        # check if the username already exists
        # TODO:
        query_get_user_by_username = "SELECT * FROM NUser WHERE username=%s"
        cursor.execute(query_get_user_by_username, (username))
        user = cursor.fetchone()

        if user:
            return redirect(url_for("create_account_bp.create_account"))
        else:
            # insert the new user into the database
            # query_add_user = "INSERT INTO NUser (first_name, last_name, phone_number, date_of_birth, gender, email_id, username, upassword, hint) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"
            query_add_user = "CALL sp_AddUser(%s, %s, %s, %s, %s, %s, %s, %s, %s)"
            cursor.execute(query_add_user, (first_name, last_name, phone_number, date_of_birth, gender, email_id, username, upassword, hint))
            db.commit()
            return redirect(url_for("index_bp.index"))