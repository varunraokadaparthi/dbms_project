from flask import Flask, session, render_template, request, redirect, url_for, Blueprint
from db import db

carpooling_bp = Blueprint("carpooling_bp", __name__)


@carpooling_bp.route("/carpooling")
def carpooling():
    return render_template("carpooling.html")

@carpooling_bp.route("/carpooling<event_id>")
def carpooling_event():
    event_id = request.args.get("event_id")
    with db.cursor() as cursor:
        query_carpools_with_event_id = "SELECT * FROM carpool WHERE event_id=%s"
        cursor.execute(query_carpools_with_event_id, event_id)
        carpool_list = cursor.fetchall()
        query_get_user_name = "SELECT first_name, last_name FROM nuser WHERE id=%s"
        cursor.execute(query_get_user_name, session["user_id"])
        user = cursor.fetchone()
        username = user.get("first_name") + " " + user.get("last_name")
        return render_template("carpooling.html", carpool_list=carpool_list,event_id=event_id, username=username)