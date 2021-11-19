package com.app.rentall.Model;

public class Review {

    private int review_id;
    private String review_title;
    private String review_description;
    private int review_rating;
    private String review_date;
    private int product_id;
    private String reviewer_name;

    public Review(int review_id, String review_title, String review_description, int review_rating, String review_date, int product_id, String reviewer_name) {
        this.review_id = review_id;
        this.review_title = review_title;
        this.review_description = review_description;
        this.review_rating = review_rating;
        this.review_date = review_date;
        this.product_id = product_id;
        this.reviewer_name = reviewer_name;
    }

    public Review() {
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

    public int getReview_rating() {
        return review_rating;
    }

    public void setReview_rating(int review_rating) {
        this.review_rating = review_rating;
    }

    public String getReview_date() {
        return review_date;
    }

    public void setReview_date(String review_date) {
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
