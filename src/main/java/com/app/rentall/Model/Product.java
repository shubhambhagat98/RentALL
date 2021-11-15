package com.app.rentall.Model;

public class Product {

    private int prod_id;
    private String prod_title;
    private String prod_description;
    private String prod_category;
    private int prod_price;
    private String prod_street_address;
    private String prod_city;
    private String prod_state;
    private int prod_pincode;
    private String prod_status;
    private String prod_firstImage;
    private int user_id;
    private float prod_rating;

    public Product() {
    }

    public Product(int prod_id, String prod_title, String prod_description, String prod_category, int prod_price, String prod_street_address, String prod_city, String prod_state, int prod_pincode, String prod_status, String prod_firstImage, int user_id) {
        this.prod_id = prod_id;
        this.prod_title = prod_title;
        this.prod_description = prod_description;
        this.prod_category = prod_category;
        this.prod_price = prod_price;
        this.prod_street_address = prod_street_address;
        this.prod_city = prod_city;
        this.prod_state = prod_state;
        this.prod_pincode = prod_pincode;
        this.prod_status = prod_status;
        this.prod_firstImage = prod_firstImage;
        this.user_id = user_id;
    }

    // constructor to insert product
    public Product(String prod_title, String prod_description, String prod_category, int prod_price, String prod_street_address, String prod_city, String prod_state, int prod_pincode, String prod_status, int user_id) {
        this.prod_title = prod_title;
        this.prod_description = prod_description;
        this.prod_category = prod_category;
        this.prod_price = prod_price;
        this.prod_street_address = prod_street_address;
        this.prod_city = prod_city;
        this.prod_state = prod_state;
        this.prod_pincode = prod_pincode;
        this.prod_status = prod_status;
        this.user_id = user_id;
    }

    // constructor to retrieve product
    public Product(int prod_id, String prod_title, String prod_description, String prod_category, int prod_price, String prod_street_address, String prod_city, String prod_state, int prod_pincode, String prod_status, String prod_firstImage, int user_id, float prod_rating) {
        this.prod_id = prod_id;
        this.prod_title = prod_title;
        this.prod_description = prod_description;
        this.prod_category = prod_category;
        this.prod_price = prod_price;
        this.prod_street_address = prod_street_address;
        this.prod_city = prod_city;
        this.prod_state = prod_state;
        this.prod_pincode = prod_pincode;
        this.prod_status = prod_status;
        this.prod_firstImage = prod_firstImage;
        this.user_id = user_id;
        this.prod_rating = prod_rating;
    }

    public int getProd_id() {
        return prod_id;
    }

    public void setProd_id(int prod_id) {
        this.prod_id = prod_id;
    }

    public String getProd_title() {
        return prod_title;
    }

    public void setProd_title(String prod_title) {
        this.prod_title = prod_title;
    }

    public String getProd_description() {
        return prod_description;
    }

    public void setProd_description(String prod_description) {
        this.prod_description = prod_description;
    }

    public String getProd_category() {
        return prod_category;
    }

    public void setProd_category(String prod_category) {
        this.prod_category = prod_category;
    }

    public int getProd_price() {
        return prod_price;
    }

    public void setProd_price(int prod_price) {
        this.prod_price = prod_price;
    }

    public String getProd_street_address() {
        return prod_street_address;
    }

    public void setProd_street_address(String prod_street_address) {
        this.prod_street_address = prod_street_address;
    }

    public String getProd_city() {
        return prod_city;
    }

    public void setProd_city(String prod_city) {
        this.prod_city = prod_city;
    }

    public String getProd_state() {
        return prod_state;
    }

    public void setProd_state(String prod_state) {
        this.prod_state = prod_state;
    }

    public int getProd_pincode() {
        return prod_pincode;
    }

    public void setProd_pincode(int prod_pincode) {
        this.prod_pincode = prod_pincode;
    }

    public String getProd_status() {
        return prod_status;
    }

    public void setProd_status(String prod_status) {
        this.prod_status = prod_status;
    }

    public String getProd_firstImage() {
        return prod_firstImage;
    }

    public void setProd_firstImage(String prod_firstImage) {
        this.prod_firstImage = prod_firstImage;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public float getProd_rating() {
        return prod_rating;
    }

    public void setProd_rating(float prod_rating) {
        this.prod_rating = prod_rating;
    }

    @Override
    public String toString() {
        return "Product{" +
                "prod_id=" + prod_id +
                ", prod_title='" + prod_title + '\'' +
                ", prod_description='" + prod_description + '\'' +
                ", prod_category='" + prod_category + '\'' +
                ", prod_price=" + prod_price +
                ", prod_street_address='" + prod_street_address + '\'' +
                ", prod_city='" + prod_city + '\'' +
                ", prod_state='" + prod_state + '\'' +
                ", prod_pincode=" + prod_pincode +
                ", prod_status='" + prod_status + '\'' +
                ", prod_firstImage='" + prod_firstImage + '\'' +
                ", user_id=" + user_id +
                ", prod_rating=" + prod_rating +
                '}';
    }
}

