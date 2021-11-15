package com.app.rentall.Model;

public class User {
    private int user_id;
    private  String first_name;
    private  String last_name;
    private  String email_id;
    private  String password;
    private  long contact;
    private  String security_1;
    private  String security_2;
    private  String security_3;
    private  String type;

    public User() {
    }

    public User(String first_name, String last_name, String email_id, String password, long contact, String type) {
        this.first_name = first_name;
        this.last_name = last_name;
        this.email_id = email_id;
        this.password = password;
        this.contact = contact;
        this.type = type;
    }

    public User(int user_id, String first_name, String last_name, String email_id, long contact, String type) {
        this.user_id = user_id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email_id = email_id;
        this.contact = contact;
        this.type = type;
    }

    public User(String first_name, String last_name, String email_id, String password, long contact, String security_1, String security_2, String security_3, String type) {
        this.first_name = first_name;
        this.last_name = last_name;
        this.email_id = email_id;
        this.password = password;
        this.contact = contact;
        this.security_1 = security_1;
        this.security_2 = security_2;
        this.security_3 = security_3;
        this.type = type;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getEmail_id() {
        return email_id;
    }

    public void setEmail_id(String email_id) {
        this.email_id = email_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public long getContact() {
        return contact;
    }

    public void setContact(long contact) {
        this.contact = contact;
    }

    public String getSecurity_1() {
        return security_1;
    }

    public void setSecurity_1(String security_1) {
        this.security_1 = security_1;
    }

    public String getSecurity_2() {
        return security_2;
    }

    public void setSecurity_2(String security_2) {
        this.security_2 = security_2;
    }

    public String getSecurity_3() {
        return security_3;
    }

    public void setSecurity_3(String security_3) {
        this.security_3 = security_3;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", first_name='" + first_name + '\'' +
                ", last_name='" + last_name + '\'' +
                ", email_id='" + email_id + '\'' +
                ", password='" + password + '\'' +
                ", contact=" + contact +
                ", security_1='" + security_1 + '\'' +
                ", security_2='" + security_2 + '\'' +
                ", security_3='" + security_3 + '\'' +
                ", type='" + type + '\'' +
                '}';
    }
}
