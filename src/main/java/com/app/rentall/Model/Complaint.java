package com.app.rentall.Model;

import java.util.Date;

public class Complaint {
    private User renter;
    private User seller;
    private String description;
    private Date date;
    private Product product;


    public Complaint(User renter, User seller, String description, Date date, Product product) {
        this.renter = renter;
        this.seller = seller;
        this.description = description;
        this.date = date;
        this.product = product;
    }

    public User getRenter() {
        return renter;
    }

    public void setRenter(User renter) {
        this.renter = renter;
    }

    public User getSeller() {
        return seller;
    }

    public void setSeller(User seller) {
        this.seller = seller;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "Complaint{" +
                "renter=" + renter +
                ", seller=" + seller +
                ", description='" + description + '\'' +
                ", date=" + date +
                ", product=" + product +
                '}';
    }
}



