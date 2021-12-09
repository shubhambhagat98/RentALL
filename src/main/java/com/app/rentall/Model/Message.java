package com.app.rentall.Model;

public class Message {

    private int chat_id;
    private int from_user_id;
    private String from_user_name;
    private int to_user_id;
    private String to_user_name;
    private String message;
    private  String chat_time;
    private int token;


    public Message() {
    }

    public int getChat_id() {
        return chat_id;
    }

    public void setChat_id(int chat_id) {
        this.chat_id = chat_id;
    }

    public int getFrom_user_id() {
        return from_user_id;
    }

    public void setFrom_user_id(int from_user_id) {
        this.from_user_id = from_user_id;
    }

    public String getFrom_user_name() {
        return from_user_name;
    }

    public void setFrom_user_name(String from_user_name) {
        this.from_user_name = from_user_name;
    }

    public int getTo_user_id() {
        return to_user_id;
    }

    public void setTo_user_id(int to_user_id) {
        this.to_user_id = to_user_id;
    }

    public String getTo_user_name() {
        return to_user_name;
    }

    public void setTo_user_name(String to_user_name) {
        this.to_user_name = to_user_name;
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

    public int getToken() {
        return token;
    }

    public void setToken(int token) {
        this.token = token;
    }

    @Override
    public String toString() {
        return "Message{" +
                "chat_id=" + chat_id +
                ", from_user_id=" + from_user_id +
                ", from_user_name='" + from_user_name + '\'' +
                ", to_user_id=" + to_user_id +
                ", to_user_name='" + to_user_name + '\'' +
                ", message='" + message + '\'' +
                ", chat_time='" + chat_time + '\'' +
                ", token=" + token +
                '}';
    }
}
