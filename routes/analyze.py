from flask import render_template, session,request, redirect, url_for, Blueprint
from db import db
analyze_bp = Blueprint("analyze_bp", __name__)


@analyze_bp.route("/analyze")
def analyze():
    with db.cursor() as cursor:
        # get all the events hosted by users
        query_user_hosted_number = "CALL GetUSerHostedNumber()"
        # query_user_hosted_number = "SELECT nuser.id AS user_id, CONCAT(nuser.first_name, ' ', nuser.last_name) AS name, COUNT(uevent.event_id) AS num_events FROM nuser LEFT JOIN uevent ON nuser.id = uevent.host_id GROUP BY nuser.id, name ORDER BY num_events DESC LIMIT 5";
        cursor.execute(query_user_hosted_number)
        user_hosted_number = cursor.fetchall()

        # get all the carpools hosted by users
        # query_user_carpools_hosted_number = "SELECT nuser.id AS user_id, CONCAT(nuser.first_name, ' ', nuser.last_name) AS name, COUNT(carpool.carpool_id) AS num_carpools FROM nuser LEFT JOIN carpool ON nuser.id = carpool.user_id GROUP BY nuser.id, name ORDER BY num_carpools DESC LIMIT 5";
        query_user_carpools_hosted_number = "CALL GetUserCarpoolsHostedNumber()"
        cursor.execute(query_user_carpools_hosted_number)
        user_carpool_hosted_number = cursor.fetchall()

        # get top interest amoung user's
        # query_top_interest = "SELECT interest_type, COUNT(*) AS num_users FROM user_interest GROUP BY interest_type ORDER BY num_users DESC LIMIT 10";
        query_top_interest = "CALL GetTopInterests()"
        cursor.execute(query_top_interest)
        users_top_interests = cursor.fetchall()

        # get user's most friends
        # query_top_friends_count = "SELECT nuser.id AS user_id, CONCAT(nuser.first_name, ' ', nuser.last_name) AS name, COUNT(*) AS num_friends FROM nuser INNER JOIN befriends ON nuser.id = befriends.user_id GROUP BY nuser.id, name ORDER BY num_friends DESC LIMIT 10";
        query_top_friends_count = "CALL GetTopFriendsCount()"
        cursor.execute(query_top_friends_count)
        users_top_friends_count = cursor.fetchall()

        # get user's genders demographic
        # query_demographic = "SELECT gender, COUNT(*) AS num_users FROM nuser GROUP BY gender";
        query_demographic = "CALL GetDemographicData()"
        cursor.execute(query_demographic)
        users_demographic = cursor.fetchall()

        # get top vehicle_type among user's
        # query_top_vehicle_type = "SELECT vehicle_type, COUNT(DISTINCT user_id) AS num_users FROM vehicle GROUP BY vehicle_type ORDER BY num_users DESC";
        query_top_vehicle_type = "CALL GetTopVehicleType()"
        cursor.execute(query_top_vehicle_type)
        users_top_vehicle_type = cursor.fetchall()

        # get top events revenue
        # query_top_event_revenue = "SELECT e.event_id AS event_id, e.title AS title, COUNT(ab.user_id) AS attendance, COUNT(DISTINCT ep.epayment_id) AS revenue FROM uevent AS e LEFT JOIN attended_by AS ab ON e.event_id = ab.event_id LEFT JOIN event_payment AS ep ON e.event_id = ep.event_id GROUP BY e.event_id, e.title ORDER BY revenue DESC";
        query_top_event_revenue = "CALL GetTopEventRevenue()"
        cursor.execute(query_top_event_revenue)
        users_top_event_revenue = cursor.fetchall()



    return render_template("analyze.html", user_hosted_number=user_hosted_number, user_carpool_hosted_number=user_carpool_hosted_number, users_top_interests=users_top_interests, users_top_friends_count=users_top_friends_count , users_demographic=users_demographic, users_top_vehicle_type=users_top_vehicle_type , users_top_event_revenue=users_top_event_revenue)