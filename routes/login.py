from flask import Flask, render_template, request, redirect, url_for, Blueprint
from db import db, cursor
login_bp = Blueprint("login_bp", __name__)


@login_bp.route("/login", methods=["POST"])
def login():
    # username = request.form["username"]
    # password = request.form["password"]
    # TODO: revert to above
    username = "ajay@1999"
    password = "ajay123"

    # query the database for the username and password
    query = "SELECT * FROM NUser WHERE username=%s AND upassword=%s"
    cursor.execute(query, (username, password))
    user = cursor.fetchone()

    if user:
        return redirect(url_for("events_bp.events", user_id=user.get("id")))
    else:
        return redirect(url_for("index_bp.index"))