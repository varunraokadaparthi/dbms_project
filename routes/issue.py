from flask import render_template, session,request, redirect, url_for, Blueprint
from db import db
from datetime import datetime
issue_bp = Blueprint("issue_bp", __name__)


@issue_bp.route("/issue_event")
def issue_event():
    event_id = request.args.get("event_id")
    user_id = session["user_id"]
    with db.cursor() as cursor:
        # Getting th e
        # query_get_event_title  = "SELECT title FROM uevent WHERE event_id=%s"
        query_get_event_title = "CALL IssueEventTitle(%s)"
        cursor.execute(query_get_event_title, event_id)
        title = cursor.fetchone().get("title")

        # query_get_one_available_emp = "SELECT emp_id FROM customer_support WHERE work_status = %s LIMIT %s;"
        query_get_one_available_emp = "CALL IssueAvailableEmp(%s, %s)"
        cursor.execute(query_get_one_available_emp, ("1",1))
        emp = cursor.fetchone()


    return render_template("event_issue_create.html", user_id=user_id,event_id=event_id, title=title, emp=emp)
@issue_bp.route("/issue_submission", methods=["POST"])
def issue_submission():
    issue_description = request.form["issue_description"]
    issue_time = datetime.now()
    event_id = request.form["event_id"]
    emp_id = request.form["emp_id"]
    user_id = session["user_id"]

    with db.cursor() as cursor:
        # query_create_issue = "INSERT INTO event_issue (issue_description, issue_time, event_id, emp_id, user_id) VALUES (%s, %s, %s, %s, %s)"
        query_create_issue = "CALL CreateIssue(%s, %s, %s, %s, %s)"
        cursor.execute(query_create_issue, (issue_description, issue_time, event_id, emp_id, user_id))
        db.commit()
        return redirect(url_for("events_bp.event", event_id=event_id))




