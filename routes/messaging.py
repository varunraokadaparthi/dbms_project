from flask import Flask, session, render_template, request, redirect, url_for, Blueprint
from db import db
from datetime import datetime
messaging_bp = Blueprint("messaging_bp", __name__)


@messaging_bp.route("/messaging")
def messaging():
    user_id = session["user_id"]
    with db.cursor() as cursor:
        query_friends = "SELECT friend_id FROM befriends WHERE user_id=%s"
        cursor.execute(query_friends, user_id)
        friends = cursor.fetchall()

        friends_list = []
        for friend in friends:
            query_user = "SELECT id,username FROM nuser WHERE id=%s"
            cursor.execute(query_user, friend.get("friend_id"))
            friends_list.append(cursor.fetchone())

        friends_list_id = [item.get("id") for item in friends_list]

        # get all people who's interest are of user_id.
        user_Interest = "SELECT * FROM user_interest WHERE interest_type in (SELECT interest_type FROM user_interest WHERE user_id = %s);"
        cursor.execute(user_Interest, user_id)
        user_events_interest = cursor.fetchall()
        user_of_same_interests = []
        for user_id_interest in user_events_interest:
            user_of_same_interests.append(user_id_interest.get("user_id"))

        #get all the people in carpool which were hosted by the user
        user_joined = "SELECT user_id FROM joins WHERE carpool_id in (SELECT carpool_id FROM carpool WHERE user_id = %s);"
        cursor.execute(user_joined, user_id)
        user_joined_user_id = cursor.fetchall()
        user_joined_hosted_by_user = []
        for user_id_joined in user_joined_user_id:
            user_joined_hosted_by_user.append(user_id_joined.get("user_id"))

        # get all the people in carpool which user joined
        user_hosted = "SELECT user_id FROM carpool WHERE carpool_id in (SELECT carpool_id FROM joins WHERE user_id = %s);"
        cursor.execute(user_hosted, user_id)
        user_hosted_user_id = cursor.fetchall()
        user_hosted_joined_by_user = []
        for user_id_hosted in user_hosted_user_id:
            user_hosted_joined_by_user.append(user_id_hosted.get("user_id"))

        # get all the people where they joined event hosted by the user.
        users_joined_events = "SELECT user_id FROM user_event WHERE event_id IN (SELECT event_id FROM user_event WHERE user_id = %s) AND user_id != %s;"
        cursor.execute(users_joined_events, (user_id, user_id))
        users_joined_event_hosted_by_user = cursor.fetchall()
        users_joined_event_host = []
        for user_id_hosted in users_joined_event_hosted_by_user:
            users_joined_event_host.append(user_id_hosted.get("user_id"))


        # Add all the users add remove the friendList
        other_friends_to_be_recommended = []
        all_users = []
        all_users.extend(user_of_same_interests)
        all_users.extend(user_joined_hosted_by_user)
        all_users.extend(user_hosted_joined_by_user)
        all_users.extend(users_joined_event_host)
        for i in all_users:
            if i not in friends_list_id:
                if i != user_id:
                    other_friends_to_be_recommended.append(i)

        other_friends_to_be_recommended_set = set(other_friends_to_be_recommended)

        recommend_friends_names = []
        for user_id_item in other_friends_to_be_recommended_set:
            query_for_name = "SELECT id, username FROM nuser WHERE id = %s"
            cursor.execute(query_for_name, user_id_item)
            recommend_friends_names.append(cursor.fetchone())

    return render_template("messaging.html", friends_list=friends_list, recommend_friends_names=recommend_friends_names)


@messaging_bp.route("/remove_friend")
def remove_friend():
    user_id = session["user_id"]
    friend_id = request.args.get("friend_id")
    with db.cursor() as cursor:
        query_remove_friend = "DELETE FROM befriends WHERE friend_id=%s AND user_id=%s"
        cursor.execute(query_remove_friend, (friend_id, user_id))
        db.commit()
    return redirect(url_for("messaging_bp.messaging"))


@messaging_bp.route("/chat/<friend_id>")
def chat(friend_id):
    user_id = session["user_id"]
    with db.cursor() as cursor:
        query_messages = "SELECT * FROM messages WHERE sender_id IN (%s, %s) AND receiver_id IN (%s, %s)"
        cursor.execute(query_messages, (user_id, friend_id, friend_id, user_id))
        unsorted_messages = cursor.fetchall()
    sorted_messages = sorted(unsorted_messages, key=lambda x: x["sent_at"])
    return render_template("chat.html", messsages=sorted_messages, friend_id=friend_id, user_id=user_id)

@messaging_bp.route("/save_message", methods=["POST"])
def update_chat():
    user_id = session["user_id"]
    friend_id = request.args.get("friend_id")
    message = request.form["message"]
    sent_at = datetime.now()
    with db.cursor() as cursor:
        query_new_message = "INSERT INTO messages(sender_id, receiver_id, message, sent_at) " \
                         "VALUES(%s, %s, %s, %s)"
        cursor.execute(query_new_message, (user_id, friend_id, message, sent_at))
        db.commit()
    return redirect(url_for('messaging_bp.chat', friend_id=friend_id))
