from flask import Flask, render_template, request, redirect, url_for, Blueprint
from db import db

messaging_bp = Blueprint("messaging_bp", __name__)


@messaging_bp.route("/messaging")
def messaging():
    return render_template("messaging.html")