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
    return render_template("messaging.html", friends_list=friends_list)


@messaging_bp.route("/remove_friend")
def remove_friend():
    user_id = session["user_id"]
    friend_id = request.args.get("friend_id")
    with db.cursor() as cursor:
        query_remove_friend = "DELETE FROM befriends WHERE friend_id=%s AND user_id=%s"
        cursor.execute(query_remove_friend, (friend_id, user_id))
        db.commit()
    return render_template(url_for("messaging_bp.messaging"))


@messaging_bp.route("/chat/<friend_id>", methods=["GET"])
def chat(friend_id):
    user_id = session["user_id"]
    with db.cursor() as cursor:
        query_messages = "SELECT * FROM messages WHERE sender_id IN (%s, %s) AND receiver_id IN (%s, %s)"
        cursor.execute(query_messages, (user_id,friend_id, friend_id, user_id))
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
        query_messages = "SELECT * FROM messages WHERE sender_id IN (%s, %s) AND receiver_id IN (%s, %s)"
        cursor.execute(query_messages, (user_id, friend_id, friend_id, user_id))
        unsorted_messages = cursor.fetchall()
    sorted_messages = sorted(unsorted_messages, key=lambda x: x["sent_at"])
    return render_template("chat.html", messsages=sorted_messages, friend_id=friend_id, user_id=user_id)