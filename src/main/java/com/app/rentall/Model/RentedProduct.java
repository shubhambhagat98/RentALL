package com.app.rentall.Model;

public class RentedProduct {
    private int prod_id;
    private int user_id;
    private String start_date;
    private String end_date;
    private String Status;

    public RentedProduct(int prod_id, int user_id, String start_date, String end_date, String status) {
        this.prod_id = prod_id;
        this.user_id = user_id;
        this.start_date = start_date;
        this.end_date = end_date;
        Status = status;
    }

    public RentedProduct(int prod_id, String start_date, String end_date, String status) {
        this.prod_id = prod_id;
        this.start_date = start_date;
        this.end_date = end_date;
        Status = status;
    }

    public int getProd_id() {
        return prod_id;
    }

    public void setProd_id(int prod_id) {
        this.prod_id = prod_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }

    @Override
    public String toString() {
        return "RentedProduct{" +
                "prod_id=" + prod_id +
                ", user_id=" + user_id +
                ", start_date=" + start_date +
                ", end_date=" + end_date +
                ", Status='" + Status + '\'' +
                '}';
    }
}
