package com.app.rentall.Model;

public class Complaint {
    private User renter;
    private User seller;
    private String description;
    private String date;
    private Product product;


    public Complaint(User renter, User seller, String description, String date, Product product) {
        this.renter = renter;
        this.seller = seller;
        this.description = description;
        this.date = date;
        this.product = product;
    }

    public Complaint(){

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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
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



