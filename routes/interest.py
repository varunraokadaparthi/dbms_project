from flask import Flask, session, render_template, request, redirect, url_for, Blueprint
from db import db

interest_bp = Blueprint("interest_bp", __name__)

@interest_bp.route("/interest_remove")
def interest_remove():
    user_id = session["user_id"]
    interest_type = request.args.get("interest_type")
    with db.cursor() as cursor:
        # query_remove_interest_for_user = "DELETE FROM user_interest WHERE user_id=%s AND interest_type=%s"
        query_remove_interest_for_user = "CALL RemoveInterestForUser(%s, %s)"
        cursor.execute(query_remove_interest_for_user, (user_id, interest_type))
        db.commit()
    return redirect(url_for("profile_bp.profile"))

@interest_bp.route("/interest_add", methods=["POST"])
def interest_add():
    user_id = session["user_id"]
    interest_type = request.form["interest_type"]
    with db.cursor() as cursor:
        # TODO:
        # query_add_interest = "INSERT INTO user_interest(user_id, interest_type) " \
        #                        "VALUES(%s, %s) "
        query_add_interest = "CALL AddInterest(%s, %s)"
        cursor.execute(query_add_interest, (user_id, interest_type))
        db.commit()
    return redirect(url_for("profile_bp.profile"))