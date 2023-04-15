from flask import Flask, session, render_template, request, redirect, url_for, Blueprint
from db import db

carpooling_bp = Blueprint("carpooling_bp", __name__)


@carpooling_bp.route("/carpooling")
def carpooling():
    return render_template("carpooling.html")