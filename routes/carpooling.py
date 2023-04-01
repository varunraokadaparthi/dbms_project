from flask import Flask, render_template, request, redirect, url_for, Blueprint
from db import db, cursor

carpooling_bp = Blueprint("carpooling_bp", __name__)


@carpooling_bp.route("/carpooling")
def carpooling():
    user_id = request.args.get("user_id")
    return render_template("carpooling.html", user_id=user_id)