from flask import Flask, session, render_template, request, redirect, url_for, Blueprint
from db import db

carpooling_bp = Blueprint("carpooling_bp", __name__)


@carpooling_bp.route("/carpooling")
def carpooling():
    carpool_hosting_list, carpool_joined_list = carpooling_tab_helper()

    return render_template("carpooling.html", carpool_hosting_list=carpool_hosting_list, carpool_joined_list=carpool_joined_list)


def carpooling_tab_helper():
    user_id = session["user_id"]
    with db.cursor() as cursor:
        query_carpools_with_event_id = "SELECT * FROM carpool WHERE user_id=%s"
        cursor.execute(query_carpools_with_event_id, user_id)
        carpool_hosting_list = cursor.fetchall()

        for carpool in carpool_hosting_list:
            query_get_vehicle = "SELECT * FROM vehicle WHERE vehicle_id=%s AND user_id=%s"
            cursor.execute(query_get_vehicle, (carpool.get("vehicle_id"), user_id))
            vehicle = cursor.fetchone()
            carpool["vehicle_type"] = vehicle.get("vehicle_type")

            query_get_event_name = "SELECT title,start_time FROM uevent WHERE event_id=%s"
            cursor.execute(query_get_event_name, carpool.get("event_id"))
            event = cursor.fetchone()
            carpool["event_title"] = event.get("title")
            carpool["start_time"] = event.get("start_time")

            query_get_users_joined_in_this_carpool = "SELECT * FROM joins WHERE carpool_id=%s"
            cursor.execute(query_get_users_joined_in_this_carpool, carpool.get("carpool_id"))
            users_joined_in_this_carpool_list = cursor.fetchall()
            users_joined_in_this_carpool_appended = ""
            for user in users_joined_in_this_carpool_list:
                query_get_user_name = "SELECT first_name, last_name FROM nuser WHERE id=%s"
                cursor.execute(query_get_user_name, user.get("user_id"))
                user = cursor.fetchone()
                users_joined_in_this_carpool_appended += user.get("first_name") + " " + user.get("last_name") + ","
            users_joined_in_this_carpool_appended = users_joined_in_this_carpool_appended[:-1]
            carpool["users_joined"] = users_joined_in_this_carpool_appended

        query_get_user_joined_carpools = "SELECT * FROM joins WHERE user_id=%s"
        cursor.execute(query_get_user_joined_carpools, user_id)
        carpool_user_list = cursor.fetchall()
        carpool_joined_list = []
        for carpool_user in carpool_user_list:
            query_carpool = "SELECT * FROM carpool WHERE carpool_id=%s"
            cursor.execute(query_carpool, carpool_user.get("carpool_id"))
            carpool_joined_list.append(cursor.fetchone())
        for carpool in carpool_joined_list:
            query_get_user_name = "SELECT first_name, last_name, phone_number FROM nuser WHERE id=%s"
            cursor.execute(query_get_user_name, carpool.get("user_id"))
            user = cursor.fetchone()
            carpool["user_name"] = user.get("first_name") + " " + user.get("last_name")
            carpool["host_phone_number"] = user.get("phone_number")

            query_get_vehicle = "SELECT * FROM vehicle WHERE vehicle_id=%s AND user_id=%s"
            cursor.execute(query_get_vehicle, (carpool.get("vehicle_id"), carpool.get("user_id")))
            vehicle = cursor.fetchone()
            carpool["vehicle_type"] = vehicle.get("vehicle_type")

            query_get_event_name = "SELECT title,start_time FROM uevent WHERE event_id=%s"
            cursor.execute(query_get_event_name, carpool.get("event_id"))
            event = cursor.fetchone()
            carpool["event_title"] = event.get("title")
            carpool["start_time"] = event.get("start_time")
    return carpool_hosting_list, carpool_joined_list


@carpooling_bp.route("/carpooling_event/<event_id>")
def carpooling_event(event_id):
    with db.cursor() as cursor:
        query_carpools_with_event_id = "SELECT * FROM carpool WHERE event_id=%s"
        cursor.execute(query_carpools_with_event_id, event_id)
        carpool_list = cursor.fetchall()
        if len(carpool_list) == 0:
            return render_template("carpooling_event.html", event_id=event_id)

        for carpool in carpool_list:
            query_get_user_name = "SELECT first_name, last_name, phone_number FROM nuser WHERE id=%s"
            cursor.execute(query_get_user_name, carpool.get("user_id"))
            user = cursor.fetchone()
            carpool["user_name"] = user.get("first_name") + " " + user.get("last_name")
            carpool["host_phone_number"] = user.get("phone_number")

            query_get_vehicle = "SELECT * FROM vehicle WHERE vehicle_id=%s AND user_id=%s"
            cursor.execute(query_get_vehicle, (carpool.get("vehicle_id"), carpool.get("user_id")))
            vehicle = cursor.fetchone()
            carpool["vehicle_type"] = vehicle.get("vehicle_type")

            query_get_event_name = "SELECT title FROM uevent WHERE event_id=%s"
            cursor.execute(query_get_event_name, event_id)
            event = cursor.fetchone()
            event_name = event.get("title")
        return render_template("carpooling_event.html", carpool_list=carpool_list,event_id=event_id, event_name=event_name)


@carpooling_bp.route("/carpool_create")
def carpooling_create():
    event_id = request.args.get("event_id")
    with db.cursor() as cursor:
        query_get_event = "SELECT * FROM uevent WHERE event_id=%s"
        cursor.execute(query_get_event, event_id)
        event = cursor.fetchone()
        query_get_user_vehicles = "SELECT vehicle_type, registration_no FROM vehicle WHERE user_id=%s"
        cursor.execute(query_get_user_vehicles, session["user_id"])
        user_vehicles = cursor.fetchall()
    return render_template("carpool_event_create.html", event=event, user_vehicles=user_vehicles)


@carpooling_bp.route("/carpool_create", methods=["POST"])
def carpooling_create_post():
    pickup_zipcode = request.form["pickup_zipcode"]
    dropoff_zipcode = request.form["dropoff_zipcode"]
    user_id = session["user_id"]
    registration_no = request.form["vehicle"].split(" - ")[0]
    event_id = request.args.get("event_id")
    price = request.form["price"]
    with db.cursor() as cursor:
        query_vehicle_id = "SELECT vehicle_id FROM vehicle WHERE registration_no=%s AND user_id=%s"
        cursor.execute(query_vehicle_id, (registration_no, user_id))
        vehicle = cursor.fetchone()
        vehicle_id = vehicle.get("vehicle_id")
        query_insert_carpool = "INSERT INTO carpool(pickup_zipcode, dropoff_zipcode, user_id, vehicle_id, event_id, price)" \
                               "VALUES (%s, %s, %s, %s, %s, %s)"
        cursor.execute(query_insert_carpool,(pickup_zipcode, dropoff_zipcode, user_id, vehicle_id, event_id, price))
        db.commit()
    return redirect(url_for("carpooling_bp.carpooling"))


@carpooling_bp.route("/carpool_join")
def carpooling_join():
    carpool_id = request.args.get("carpool_id")
    user_id = session["user_id"]
    with db.cursor() as cursor:
        query_user_joins_carpool = "INSERT INTO joins(user_id, carpool_id) " \
                 "VALUES(%s, %s)"
        cursor.execute(query_user_joins_carpool, (user_id, carpool_id))
        db.commit()
    return redirect(url_for("carpooling_bp.carpooling"))

