#cd /Users/saideepsamineni/Neu/Dbms_Project/Python
#http://127.0.0.1:5000
from routes.index import index_bp
from routes.login import login_bp
from routes.create_account import create_account_bp
from routes.events import events_bp
from routes.carpooling import carpooling_bp
from routes.messaging import messaging_bp
from routes.profile import profile_bp
from flask import Flask, render_template, request, redirect, url_for


app = Flask(__name__)
app.secret_key = 'ajaysaivarun'.encode("utf-8")

app.register_blueprint(index_bp)
app.register_blueprint(login_bp)
app.register_blueprint(create_account_bp)
app.register_blueprint(events_bp)
app.register_blueprint(carpooling_bp)
app.register_blueprint(messaging_bp)
app.register_blueprint(profile_bp)
