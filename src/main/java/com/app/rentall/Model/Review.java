package com.app.rentall.Model;

import java.util.Date;

public class Review {

    private int review_id;
    private String review_title;
    private String review_description;
    private float review_rating;
    private Date review_date;
    private int product_id;
    private String reviewer_name;

    public Review(int review_id, String review_title, String review_description, float review_rating, Date review_date, int product_id, String reviewer_name) {
        this.review_id = review_id;
        this.review_title = review_title;
        this.review_description = review_description;
        this.review_rating = review_rating;
        this.review_date = review_date;
        this.product_id = product_id;
        this.reviewer_name = reviewer_name;
    }

    public int getReview_id() {
        return review_id;
    }

    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }

    public String getReview_title() {
        return review_title;
    }

    public void setReview_title(String review_title) {
        this.review_title = review_title;
    }

    public String getReview_description() {
        return review_description;
    }

    public void setReview_description(String review_description) {
        this.review_description = review_description;
    }

    public float getReview_rating() {
        return review_rating;
    }

    public void setReview_rating(float review_rating) {
        this.review_rating = review_rating;
    }

    public Date getReview_date() {
        return review_date;
    }

    public void setReview_date(Date review_date) {
        this.review_date = review_date;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getReviewer_name() {
        return reviewer_name;
    }

    public void setReviewer_name(String reviewer_name) {
        this.reviewer_name = reviewer_name;
    }

    @Override
    public String toString() {
        return "Review{" +
                "review_id=" + review_id +
                ", review_title='" + review_title + '\'' +
                ", review_description='" + review_description + '\'' +
                ", review_rating=" + review_rating +
                ", review_date=" + review_date +
                ", product_id=" + product_id +
                ", reviewer_name='" + reviewer_name + '\'' +
                '}';
    }
}
