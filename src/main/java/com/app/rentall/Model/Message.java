package com.app.rentall.Model;

public class Message {

    private int chat_id;
    private User from_user;
    private User to_user;
    private String message;
    private  String chat_time;
    private int token;

    public Message() {
    }

    public Message(int chat_id, User from_user, User to_user, String message, String chat_time) {
        this.chat_id = chat_id;
        this.from_user = from_user;
        this.to_user = to_user;
        this.message = message;
        this.chat_time = chat_time;
    }

    public Message(User from_user, User to_user, String message) {
        this.from_user = from_user;
        this.to_user = to_user;
        this.message = message;
    }

    public int getToken() {
        return token;
    }

    public void setToken(int token) {
        this.token = token;
    }

    public int getChat_id() {
        return chat_id;
    }

    public void setChat_id(int chat_id) {
        this.chat_id = chat_id;
    }

    public User getFrom_user() {
        return from_user;
    }

    public void setFrom_user(User from_user) {
        this.from_user = from_user;
    }

    public User getTo_user() {
        return to_user;
    }

    public void setTo_user(User to_user) {
        this.to_user = to_user;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getChat_time() {
        return chat_time;
    }

    public void setChat_time(String chat_time) {
        this.chat_time = chat_time;
    }


    @Override
    public String toString() {
        return "Message{" +
                "chat_id=" + chat_id +
                ", from_user=" + from_user +
                ", to_user=" + to_user +
                ", message='" + message + '\'' +
                ", chat_time='" + chat_time + '\'' +
                ", token=" + token +
                '}';
    }
}
