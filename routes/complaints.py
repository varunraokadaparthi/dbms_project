from flask import render_template, session,request, redirect, url_for, Blueprint
from db import db
complaints_bp = Blueprint("complaints_bp", __name__)


@complaints_bp.route("/complaints")
def complaints():
    with db.cursor() as cursor:
        # get all the complaints
        # query_get_all_complaints = "SELECT * FROM event_issue"
        query_get_all_complaints = "CALL AllComplaints()"
        cursor.execute(query_get_all_complaints)
        user_complaints = cursor.fetchall()
    return render_template("complaints.html", user_complaints=user_complaints)


@complaints_bp.route("/resolved", methods=["POST"])
def resolved():
    with db.cursor() as cursor:
        ticket_id = request.args.get("ticket_id")

        # delete the ticket_id
        # query_delete_ticket = "DELETE FROM event_issue WHERE ticket_id=%s"
        query_delete_ticket = "CALL DeleteComplaint(%s)"
        cursor.execute(query_delete_ticket,ticket_id)

        # get all the complaints
        # query_get_all_complaints = "SELECT * FROM event_issue"
        query_get_all_complaints = "CALL AllComplaints()"
        cursor.execute(query_get_all_complaints)
        user_complaints = cursor.fetchall()


    return render_template("complaints.html", user_complaints=user_complaints)