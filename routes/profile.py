from flask import Flask, render_template, request, redirect, url_for, Blueprint
from db import db, cursor

profile_bp = Blueprint("profile_bp", __name__)


@profile_bp.route("/profile")
def profile():
    user_id = request.args.get("user_id")
    # # insert the new user into the database
    # query = "INSERT INTO NUser (first_name, last_name, phone_number, age, gender, email_id, username, upassword, hint, languages_known) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
    # cursor.execute(query, (first_name, last_name, phone_number, age, gender, email_id, username, upassword, hint, languages_known))
    # db.commit()
    return render_template("profile.html", user_id=user_id)