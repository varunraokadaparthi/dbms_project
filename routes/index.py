from flask import Flask, render_template, request, redirect, url_for, Blueprint

index_bp = Blueprint("index_bp", __name__)


@index_bp.route("/")
def index():
    return render_template("index.html")