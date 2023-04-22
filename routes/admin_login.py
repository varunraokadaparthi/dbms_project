from flask import Flask, render_template, request, redirect, url_for, Blueprint
from db import db
from flask import session

admin_login_bp = Blueprint("admin_login_bp", __name__)


@admin_login_bp.route("/admin_login")
def admin_login():
    return render_template("admin_login.html")


@admin_login_bp.route("/admin_login_after_submission",methods=["POST"])
def after_submission():
    username = "CS004"
    password = "passwordabc"
    with db.cursor() as cursor:
        # query the database for the username and password
        # query_admin_login = "SELECT * FROM customer_support WHERE emp_id=%s AND emp_password=%s"
        query_admin_login = "CALL admin_login_proc(%s, %s)"
        cursor.execute(query_admin_login, (username, password))
        user = cursor.fetchone()

        if user:
            session["emp_id"] = user.get("emp_id")
            session["work_status"] = user.get("work_status")
            return redirect(url_for("complaints_bp.complaints"))
        else:
            return redirect(url_for("admin_login_bp.admin_login"))