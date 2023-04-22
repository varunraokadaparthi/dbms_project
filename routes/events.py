from flask import render_template, session,request, redirect, url_for, Blueprint
from db import db
events_bp = Blueprint("events_bp", __name__)


@events_bp.route("/events")
def events():
    events_id_remember = []
    user_id = session["user_id"]
    with db.cursor() as cursor:
        # get the events user is hosting
        # TODO: user user_event instead
        # query_user_hosting_events = "SELECT * FROM uevent WHERE host_id=%s"
        query_user_hosting_events = "CALL GetUserHostingEvents(%s)"
        cursor.execute(query_user_hosting_events, user_id)
        user_events = cursor.fetchall()
        user_hosting_events = []
        for user_event in user_events:
            # query_get_event_by_id = "SELECT * FROM UEvent WHERE event_id=%s"
            query_get_event_by_id = "CALL GetEventById(%s)"
            cursor.execute(query_get_event_by_id, user_event.get("event_id"))
            user_hosting_events.append(cursor.fetchone())
            events_id_remember.append(user_event.get("event_id"))

        # get the events user is/will be attending
        # query_events_user_attending = "SELECT * FROM attended_by WHERE user_id=%s"
        query_events_user_attending = "CALL GetUserAttendingEvents(%s)"
        cursor.execute(query_events_user_attending, user_id)
        user_events = cursor.fetchall()
        user_attending_events = []
        for user_event in user_events:
            # query_event_details = "SELECT * FROM UEvent WHERE event_id=%s"
            query_event_info = "CALL GetEventById(%s)"
            cursor.execute(query_event_info, user_event.get("event_id"))
            user_attending_events.append(cursor.fetchone())
            events_id_remember.append(user_event.get("event_id"))

        # get all events
        # query_get_all_events = "SELECT * FROM UEvent"
        query_get_all_events = "CALL GetAllEvents()"
        cursor.execute(query_get_all_events)
        all_events = cursor.fetchall()
        recommend_user_event_id = []
        for user_all_events in all_events:
            if user_all_events.get("event_id") not in events_id_remember:
                recommend_user_event_id.append(user_all_events)

        # getting all the user interest id's.
        # query_interest = "SELECT * FROM user_interest WHERE user_id = %s;"
        query_interest = "CALL GetUserInterests(%s)"
        cursor.execute(query_interest,user_id)
        user_events_interest = cursor.fetchall()
        user_interests = []
        for interest in user_events_interest:
            user_interests.append(interest.get("interest_type"))

        final_recommend_user_event_id = []
        for recommend in recommend_user_event_id:
            if recommend.get("interest_type") in user_interests:
                final_recommend_user_event_id.append(recommend)

        return render_template("events.html", all_events=final_recommend_user_event_id,
                               user_hosting_events=user_hosting_events,
                               user_attending_events=user_attending_events)


@events_bp.route("/event")
def event():
    user_id = session["user_id"]
    event_id = request.args.get("event_id")
    with db.cursor() as cursor:
        # query_get_event_by_id = "SELECT * FROM UEvent WHERE event_id=%s"
        query_get_event_by_id = "CALL GetEventById(%s)"
        cursor.execute(query_get_event_by_id, event_id)
        event = cursor.fetchone()

        already_registered = False
        # query_check_user_attending_event = "SELECT * FROM Attended_by WHERE event_id=%s AND user_id=%s"
        query_check_user_attending_event = "CALL CheckUserAttendingEvent(%s, %s)"
        cursor.execute(query_check_user_attending_event, (event_id, user_id))
        if cursor.rowcount == 1:
            already_registered = True
        # query_user_by_id = "SELECT * FROM nuser WHERE id=%s"
        query_user_by_id = "CALL GetUserById(%s)"
        cursor.execute(query_user_by_id, event.get("host_id"))
        host = cursor.fetchone()
        host_name = host.get("first_name") + " " + host.get("last_name")

        # query_get_carpools_for_this_event = "SELECT carpool_id FROM carpool WHERE event_id=%s"
        query_get_carpools_for_this_event = "CALL GetCarpoolIDsForEvent(%s)"
        cursor.execute(query_get_carpools_for_this_event, event_id)
        carpools_this_event = cursor.fetchall()
        user_joined_carpool = 0
        for carpool in carpools_this_event:
            # query_user_joined_carpool = "SELECT * FROM joins WHERE carpool_id=%s AND user_id=%s"
            query_user_joined_carpool = "CALL HasUserJoinedCarpool(%s, %s)"
            cursor.execute(query_user_joined_carpool, (carpool.get("carpool_id"), user_id))
            carpool_user = cursor.fetchone()
            if carpool_user:
                user_joined_carpool = carpool_user.get("carpool_id")
                break

        is_issue_already_raised = False
        # check if user already raised any issue.
        # query_issue_for_this_event = "SELECT * FROM event_issue WHERE event_id = %s AND user_id =%s"
        query_issue_for_this_event = "CALL CheckUserIssueForEvent(%s, %s)"
        cursor.execute(query_issue_for_this_event, (event_id, user_id))
        issue = cursor.fetchone()
        if issue:
            is_issue_already_raised = True


        if user_joined_carpool:
            # query_get_carpool = "SELECT * FROM carpool WHERE carpool_id=%s"
            query_get_carpool = "CALL GetCarpoolv2(%s)"
            cursor.execute(query_get_carpool, user_joined_carpool)
            carpool = cursor.fetchone()

            # query_get_user_name = "SELECT first_name, last_name, phone_number FROM nuser WHERE id=%s"
            query_get_user_name = "CALL GetUserDetails(%s)"
            cursor.execute(query_get_user_name, carpool.get("user_id"))
            user = cursor.fetchone()
            carpool["user_name"] = user.get("first_name") + " " + user.get("last_name")
            carpool["host_phone_number"] = user.get("phone_number")

            # query_get_vehicle = "SELECT * FROM vehicle WHERE vehicle_id=%s AND user_id=%s"
            query_get_vehicle = "CALL GetVehicle(%s, %s)"
            cursor.execute(query_get_vehicle, (carpool.get("vehicle_id"), carpool.get("user_id")))
            vehicle = cursor.fetchone()
            carpool["vehicle_type"] = vehicle.get("vehicle_type")

            return render_template("event_carpool_dont_register.html", event=event, host_name=host_name,
                                   already_registered=already_registered, carpool=carpool, is_issue_already_raised=is_issue_already_raised, issue=issue)
        else:
            return render_template("event_carpool_allow_register.html", event=event, host_name=host_name,
                                   already_registered=already_registered,is_issue_already_raised=is_issue_already_raised, issue=issue)


@events_bp.route("/delete_event")
def delete_event():
    with db.cursor() as cursor:
        event_id = request.args.get("event_id")
        user_id = session["user_id"]


        #check if user is hosting it
        # query_hosting_an_event = "SELECT * FROM uevent WHERE host_id=%s AND event_id=%s"
        query_hosting_an_event = "CALL CheckIfUserIsHostingEvent(%s, %s)"
        cursor.execute(query_hosting_an_event,(user_id, event_id))
        hosting_an_event = cursor.fetchone()

        if hosting_an_event:
            # delete the event
            # query_delete_event = "DELETE FROM uevent WHERE event_id=%s"
            query_delete_event = "CALL DeleteEvent(%s)"
            cursor.execute(query_delete_event, event_id)
        else:
            # delete only the joined event
            # query_delete_event = "DELETE FROM attended_by WHERE event_id=%s AND user_id=%s"
            query_delete_event = "CALL delete_attendance(%s, %s)"
            cursor.execute(query_delete_event, (event_id,user_id))
    return redirect(url_for("events_bp.events"))

@events_bp.route("/update_event")
def update_event():
    with db.cursor() as cursor:
        event_id = request.args.get("event_id")
        user_id = session["user_id"]

        # check if user is hosting it
        # query_hosting_an_event = "SELECT * FROM uevent WHERE host_id=%s AND event_id=%s"
        query_hosting_an_event = "CALL CheckEventHosting(%s, %s)"
        cursor.execute(query_hosting_an_event, (user_id, event_id))
        hosting_an_event = cursor.fetchone()

        query_all_interest_types = "CALL GetAllInterestTypes()"
        cursor.execute(query_all_interest_types)
        interests = cursor.fetchall()

        if hosting_an_event:
            interests.remove({"interest_type": hosting_an_event.get("interest_type")})
            interests.insert(0, {"interest_type": hosting_an_event.get("interest_type")})
            # TODO: Call right form and action
            return render_template("update_event.html", hosting_an_event=hosting_an_event, interests=interests)
        else:
            return redirect(url_for("events_bp.events"))


    return redirect(url_for("events_bp.events"))

@events_bp.route("/event_attended_by")
def event_attendies():
    user_id = session["user_id"]
    event_id = request.args.get("event_id")
    print("event id: " + event_id)
    is_issue_already_raised = False
    issue = {}
    with db.cursor() as cursor:
        # query_check_user_attending_event = "SELECT * FROM Attended_by WHERE event_id=%s AND user_id=%s"
        query_check_user_attending_event = "CALL check_attendancev2(%s, %s)"
        cursor.execute(query_check_user_attending_event, (event_id, user_id))
        if cursor.rowcount == 1:
            print("Already registered for the event")
        else:
            # query_attended = "INSERT INTO Attended_by(event_id, user_id) VALUES(%s, %s)"
            query_attended = "CALL attend_event(%s, %s)"
            cursor.execute(query_attended, (event_id, user_id))
            db.commit()
            # query_get_event = "SELECT * FROM UEvent WHERE event_id=%s"
            query_get_event = "CALL get_event(%s)"
            cursor.execute(query_get_event, event_id)
            event = cursor.fetchone()

            already_registered = False
            # query_check_attendance = "SELECT * FROM Attended_by WHERE event_id=%s AND user_id=%s"
            query_check_attendance = "CALL check_attendance(%s, %s)"
            cursor.execute(query_check_attendance, (event_id, user_id))
            if cursor.rowcount == 1:
                already_registered = True
            # query_get_user_by_id = "SELECT * FROM nuser WHERE id=%s"
            query_get_user_by_id = "CALL select_user_by_id(%s)"
            cursor.execute(query_get_user_by_id, user_id)
            host = cursor.fetchone()
            host_name = host.get("first_name") + " " + host.get("last_name")
    return render_template("event_carpool_allow_register.html", event=event, host_name=host_name,
                           already_registered=already_registered, is_issue_already_raised=is_issue_already_raised,
                           issue=issue)


@events_bp.route("/create_event")
def create_event():
    with db.cursor() as cursor:
        # query_all_interests = "SELECT * FROM interest"
        query_all_interests = "CALL get_all_interests()"
        cursor.execute(query_all_interests)
        interests = cursor.fetchall()
    return render_template("create_event.html", interests=interests)

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
    with db.cursor() as cursor:
        # check if the username already exists
        # query_get_event_by_title = "SELECT * FROM uevent WHERE title=%s"
        query_get_event_by_title = "CALL get_event_by_title(%s)"
        cursor.execute(query_get_event_by_title, title)
        event = cursor.fetchone()

        if event:
            return redirect(url_for("events_bp.events"))
        else:
            # insert the new user into the database
            # TODO: When user creates an event, he should be added to attended by
            # query_insert_event = "INSERT INTO uevent (start_time, end_time, max_people, fees, requirements, street_name, city, zip_code, min_age, title, agenda, host_id, interest_type)" \
            #         "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            query_insert_event = "CALL insert_event(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            cursor.execute(query_insert_event, (start_time, end_time, max_people, fees, requirements, street, city, zipcode, min_age, title, agenda, user_id, interest_type))
            db.commit()
            return redirect(url_for("events_bp.events"))