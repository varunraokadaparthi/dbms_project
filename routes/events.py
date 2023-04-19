from flask import render_template, session,request, redirect, url_for, Blueprint
from db import db
events_bp = Blueprint("events_bp", __name__)


@events_bp.route("/events")
def events():
    user_id = session["user_id"]
    with db.cursor() as cursor:
        # get the events user is hosting
        query1 = "SELECT * FROM User_Event WHERE user_id=%s"
        cursor.execute(query1, user_id)
        user_events = cursor.fetchall()
        user_hosting_events = []
        for user_event in user_events:
            query2 = "SELECT * FROM UEvent WHERE event_id=%s"
            cursor.execute(query2, user_event.get("event_id"))
            user_hosting_events.append(cursor.fetchone())

        # get the events user is/will be attending
        query3 = "SELECT * FROM attended_by WHERE user_id=%s"
        cursor.execute(query3, user_id)
        user_events = cursor.fetchall()
        user_attending_events = []
        for user_event in user_events:
            query4 = "SELECT * FROM UEvent WHERE event_id=%s"
            cursor.execute(query4, user_event.get("event_id"))
            user_attending_events.append(cursor.fetchone())

        # get all events
        query5 = "SELECT * FROM UEvent"
        cursor.execute(query5)
        all_events = cursor.fetchall()

        return render_template("events.html", all_events=all_events,
                               user_hosting_events=user_hosting_events,
                               user_attending_events=user_attending_events)


@events_bp.route("/event")
def event():
    user_id = session["user_id"]
    event_id = request.args.get("event_id")
    with db.cursor() as cursor:
        query = "SELECT * FROM UEvent WHERE event_id=%s"
        cursor.execute(query, event_id)
        event = cursor.fetchone()

        already_registered = False
        query1 = "SELECT * FROM Attended_by WHERE event_id=%s AND user_id=%s"
        cursor.execute(query1, (event_id, user_id))
        if cursor.rowcount == 1:
            already_registered = True
        query2 = "SELECT * FROM nuser WHERE id=%s"
        cursor.execute(query2, user_id)
        host = cursor.fetchone()
        host_name = host.get("first_name") + " " + host.get("last_name")


    return render_template("event.html", event=event, host_name=host_name,
                           already_registered=already_registered)


@events_bp.route("/event_attended_by")
def event_attendies():
    user_id = session["user_id"]
    event_id = request.args.get("event_id")
    print("event id: " + event_id)
    with db.cursor() as cursor:
        query = "SELECT * FROM Attended_by WHERE event_id=%s AND user_id=%s"
        cursor.execute(query, (event_id, user_id))
        if cursor.rowcount == 1:
            print("Already registered for the event")
        else:
            query_attended = "INSERT INTO Attended_by(event_id, user_id) VALUES(%s, %s)"
            cursor.execute(query_attended, (event_id, user_id))
            db.commit()
            query = "SELECT * FROM UEvent WHERE event_id=%s"
            cursor.execute(query, event_id)
            event = cursor.fetchone()

            already_registered = False
            query1 = "SELECT * FROM Attended_by WHERE event_id=%s AND user_id=%s"
            cursor.execute(query1, (event_id, user_id))
            if cursor.rowcount == 1:
                already_registered = True
            query2 = "SELECT * FROM nuser WHERE id=%s"
            cursor.execute(query2, user_id)
            host = cursor.fetchone()
            host_name = host.get("first_name") + " " + host.get("last_name")
    return render_template("event.html", event=event, host_name=host_name,
                           already_registered=already_registered)


@events_bp.route("/create_event")
def create_event():
    return render_template("create_event.html")

@events_bp.route("/create_event", methods=["POST"])
def create_event_post():
    title = request.form["title"]
    start_time = request.form["start_time"]
    end_time = request.form["end_time"]
    max_people = request.form["max_people"]
    fees = request.form["fees"]
    requirements = request.form["requirements"]
    street = request.form["street"]
    city = request.form["city"]
    zipcode = request.form["zipcode"]
    min_age = request.form["min_age"]
    interest_type = request.form["interest_type"]
    agenda = request.form["agenda"]
    user_id = session["user_id"]
    address_id = 1
    with db.cursor() as cursor:
        # check if the username already exists
        query = "SELECT * FROM uevent WHERE title=%s"
        cursor.execute(query, title)
        event = cursor.fetchone()

        if event:
            return redirect(url_for("events_bp.events"))
        else:
            # insert the new user into the database
            # TODO: When user creates an event, he should be added to attended by
            query = "INSERT INTO uevent (start_time, end_time, max_people, fees, requirements, street_name, city, zip_code, min_age, title, agenda, host_id, interest_type, address_id)" \
                    "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            cursor.execute(query, (start_time, end_time, max_people, fees, requirements, street, city, zipcode, min_age, title, agenda, user_id, interest_type, address_id))
            db.commit()
            return redirect(url_for("events_bp.events"))