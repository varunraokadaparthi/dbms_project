from flask import Flask, session, render_template, request, redirect, url_for, Blueprint
from db import db

vehicle_bp = Blueprint("vehicle_bp", __name__)


@vehicle_bp.route("/vehicle_update", methods=["POST"])
def vehicle_update():
    vehicle_id = request.args.get("vehicle_id")
    registration_no = request.form["registration_no"]
    vehicle_type = request.form["vehicle_type"]
    with db.cursor() as cursor:
        # TODO: combo box default for update vehicle
        # query_update_vehicle = "UPDATE vehicle SET registration_no=%s, vehicle_type=%s WHERE vehicle_id=%s"
        query_update_vehicle = "CALL UpdateVehicle(%s, %s, %s)"
        cursor.execute(query_update_vehicle, (registration_no, vehicle_type, vehicle_id))
        db.commit()
    return redirect(url_for("profile_bp.profile"))


@vehicle_bp.route("/vehicle_remove")
def vehicle_remove():
    vehicle_id = request.args.get("vehicle_id")
    with db.cursor() as cursor:
        # query_remove_vehicle = "DELETE FROM vehicle WHERE vehicle_id=%s"
        query_remove_vehicle = "CALL RemoveVehicle(%s)"
        cursor.execute(query_remove_vehicle, vehicle_id)
        db.commit()
    return redirect(url_for("profile_bp.profile"))

@vehicle_bp.route("/vehicle_add", methods=["POST"])
def vehicle_add():
    registration_no = request.form["registration_no"]
    vehicle_type = request.form["vehicle_type"]
    with db.cursor() as cursor:
        # query_add_vehicle = "INSERT INTO vehicle(registration_no, vehicle_type, user_id) " \
        #                        "VALUES(%s, %s, %s) "
        query_add_vehicle = "CALL AddVehicle(%s, %s, %s)"
        cursor.execute(query_add_vehicle, (registration_no, vehicle_type, session["user_id"]))
        db.commit()
    return redirect(url_for("profile_bp.profile"))