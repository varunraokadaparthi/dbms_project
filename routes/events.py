from flask import Flask, render_template, request, redirect, url_for, Blueprint
from db import db, cursor

events_bp = Blueprint("events_bp", __name__)


@events_bp.route("/events")
def events():
    user_id = request.args.get("user_id")

    query = "SELECT * FROM NUser WHERE id=%s"
    cursor.execute(query, user_id)
    user = cursor.fetchone()

    return render_template("events.html", name = (user.get("first_name") + " " + user.get("last_name")), user_id = user_id)