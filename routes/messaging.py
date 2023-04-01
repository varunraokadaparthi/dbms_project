from flask import Flask, render_template, request, redirect, url_for, Blueprint
from db import db, cursor

messaging_bp = Blueprint("messaging_bp", __name__)


@messaging_bp.route("/messaging")
def messaging():
    user_id = request.args.get("user_id")
    return render_template("messaging.html", user_id=user_id)