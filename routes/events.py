from flask import render_template, session,request, redirect, url_for, Blueprint
from db import db
events_bp = Blueprint("events_bp", __name__)

@events_bp.route("/events")
def events():
    # user_id = request.args.get("user_id")
    user_id = session["user_id"]
    current_user = request.args.get("current_user")
    print(current_user)
    with db.cursor() as cursor:
        query1 = "SELECT * FROM NUser WHERE id=%s"
        cursor.execute(query1, user_id)
        user = cursor.fetchone()
        first_name = user.get("first_name")
        last_name = user.get("last_name")

        # get the events associated with the current user
        query2 = "SELECT * FROM User_Event WHERE user_id=%s"
        cursor.execute(query2, user_id)
        event_id_list = []
        user_event = cursor.fetchall()
        for i in user_event:
            event_id_list.append(i.get("event_id"))

        # for every event id associated with the current user,   --> my events
        # get the event title and display to the user
        event_list = ""
        query3 = "SELECT * FROM UEvent WHERE event_id=%s"
        for i in event_id_list:
            event_list += '<p> <a href="/event?event_id=' + str(i) + '">'
            cursor.execute(query3, i)
            event_list += cursor.fetchone().get("title") + '</a></p>'
        cursor.execute(query2, user_id)
        return render_template("events.html", name = first_name + " " + last_name,
                               event_list = event_list, event_id_list = event_id_list)


@events_bp.route("/event")
def event():
    user_id = session["user_id"]
    event_id = request.args.get("event_id")
    with db.cursor() as cursor:
        query = "SELECT * FROM UEvent WHERE event_id=%s"
        cursor.execute(query, event_id)
        event = cursor.fetchone()
        timings = event.get("timings")
        fees = event.get("fees")
        street_name = event.get("street_name"),
        city = event.get("city")
        zipcode = event.get("zipcode")
        title = event.get("title")
        host = event.get("id")
        interest = event.get("interest")

        already_registered = False
        query1 = "SELECT * FROM Attended_by WHERE event_id=%s AND user_id=%s"
        cursor.execute(query1, (event_id, user_id))
        if cursor.rowcount == 1:
            already_registered = True
    return render_template("event.html", timings = timings,
                           fees = fees, street_name = street_name,
                           city = city, zipcode = zipcode,
                           title = title, host = host,
                           interest = interest, event_id = event_id,
                           already_registered = already_registered)


@events_bp.route("/event_attended_by")
def event_attendies():
    user_id = session["user_id"]
    event_id = request.args.get("event_id")
    with db.cursor() as cursor:
        query = "SELECT * FROM Attended_by WHERE event_id=%s AND user_id=%s"
        cursor.execute(query, (event_id, user_id))
        if cursor.rowcount == 1:
            print("Already registered for the event")
        else:
            query_attended = "INSERT INTO Attended_by VALUES(%s, %s)"
            test = cursor
            test.execute(query_attended, (event_id, user_id))
            db.commit()
            query = "SELECT * FROM UEvent WHERE event_id=%s"
            cursor.execute(query, event_id)
            event = cursor.fetchone()
            timings = event.get("timings")
            fees = event.get("fees")
            street_name = event.get("street_name"),
            city = event.get("city")
            zipcode = event.get("zipcode")
            title = event.get("title")
            host = event.get("id")
            interest = event.get("interest")

            already_registered = False
            query1 = "SELECT * FROM Attended_by WHERE event_id=%s AND user_id=%s"
            cursor.execute(query1, (event_id, user_id))
            if cursor.rowcount == 1:
                already_registered = True
        return render_template("event.html", timings=timings,
                               fees=fees, street_name=street_name,
                               city=city, zipcode=zipcode,
                               title=title, host=host,
                               interest=interest, event_id=event_id,
                               already_registered=already_registered)