from flask import Flask, session, render_template, request, redirect, url_for, Blueprint
from db import db

profile_bp = Blueprint("profile_bp", __name__)


@profile_bp.route("/profile")
def profile():
    user_id = session["user_id"]
    with db.cursor() as cursor:
        query_get_profile = "SELECT * FROM nuser WHERE id=%s"
        cursor.execute(query_get_profile, user_id)
        profile = cursor.fetchone()
    return render_template("profile.html",profile=profile)

@profile_bp.route("/update_profile", methods=["POST"])
def update_profile():
    user_id = session["user_id"]
    first_name = request.form["first_name"]
    last_name = request.form["last_name"]
    phone_number = request.form["phone_number"]
    date_of_birth = request.form["date_of_birth"]
    gender = request.form["gender"]
    email_id = request.form["email_id"]
    username = request.form["username"]
    upassword = request.form["upassword"]
    hint = request.form["hint"]
    with db.cursor() as cursor:
        query_update_profile = "UPDATE nuser " \
                            "SET first_name=%s, last_name=%s, phone_number=%s, date_of_birth=%s, gender=%s, email_id=%s, username=%s, upassword=%s, hint=%s " \
                               "WHERE id=%s"
        cursor.execute(query_update_profile, (first_name, last_name, phone_number, date_of_birth, gender, email_id, username, upassword, hint,user_id))
        db.commit()
    return redirect(url_for("profile_bp.profile"))