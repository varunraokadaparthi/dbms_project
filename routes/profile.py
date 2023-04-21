from flask import Flask, session, render_template, request, redirect, url_for, Blueprint
from db import db

profile_bp = Blueprint("profile_bp", __name__)


@profile_bp.route("/profile")
def profile():
    user_id = session["user_id"]
    with db.cursor() as cursor:
        # query_get_profile = "SELECT * FROM nuser WHERE id=%s"
        query_get_profile = "CALL GetUserProfile(%s)"
        cursor.execute(query_get_profile, user_id)
        profile = cursor.fetchone()

        # query_get_vehicles = "SELECT * FROM vehicle WHERE user_id=%s"
        query_get_vehicles = "CALL GetUserVehicles(%s)"
        cursor.execute(query_get_vehicles, user_id)
        vehicles = cursor.fetchall()

        # query_get_all_vehicle_types = "SELECT * FROM vehicle_type"
        query_get_all_vehicle_types = "CALL GetAllVehicleTypes()"
        cursor.execute(query_get_all_vehicle_types)
        vehicle_types = cursor.fetchall()

        # query_user_interest_types = "SELECT * FROM user_interest WHERE user_id=%s"
        query_user_interest_types = "CALL GetUserInterestTypes(%s)"
        cursor.execute(query_user_interest_types, user_id)
        user_interest_types_list = cursor.fetchall()

        user_interest_list = []
        for interest in user_interest_types_list:
            user_interest_list.append(interest.get("interest_type"))

        # query_all_interest_types = "SELECT * FROM interest"
        query_all_interest_types = "CALL GetAllInterestTypes()"
        cursor.execute(query_all_interest_types)
        all_interest_types_list = cursor.fetchall()

        all_interest_list = []
        for interest in all_interest_types_list:
            all_interest_list.append(interest.get("interest_type"))

        non_interest_list = []
        for interest in all_interest_list:
            if interest not in user_interest_list:
                non_interest_list.append(interest)
    return render_template("profile.html",profile=profile, vehicles=vehicles,
                           vehicle_types=vehicle_types, user_interest_list=user_interest_list,
                           non_interest_list=non_interest_list)

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
        # query_update_profile = "UPDATE nuser " \
        #                     "SET first_name=%s, last_name=%s, phone_number=%s, date_of_birth=%s, gender=%s, email_id=%s, username=%s, upassword=%s, hint=%s " \
        #                        "WHERE id=%s"
        query_update_profile = "CALL sp_UpdateUser(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
        cursor.execute(query_update_profile, (user_id, first_name, last_name, phone_number, date_of_birth, gender, email_id, username, upassword, hint))
        db.commit()
        # query_get_user_details = "SELECT first_name, last_name,username FROM nuser WHERE id=%s"
        query_get_user_details = "CALL GetUserById(%s)"
        cursor.execute(query_get_user_details, user_id)
        user_details = cursor.fetchone()
        session["first_name"] = user_details.get("first_name")
        session["last_name"] = user_details.get("last_name")
        session["username"] = user_details.get("username")
    return redirect(url_for("profile_bp.profile"))