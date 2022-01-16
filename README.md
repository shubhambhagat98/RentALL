# RentALL - Rental and Service Management System

## System Description

The purpose of this project is to build a platform that communicates relavant and genuine renting information and helps the user to rent products they need and sellers to advertise their products and services. For providing the most convenient rental experience, we have tried to incorporate following features in our website.  

- Login system with Google Sign-in option
- Product Listing page with filters, textual and voice activated search
- Product Information page with maps, multimedia (multiple images), product recommendations, reviews and complaints.
- Chatbot
- Chat messaging between users
- Admin analytics dashboard
- Fully **Responsive** Layout

## Tech Stack
- Project Structure: MVC Design Pattern
- Front-end: HTML5, CSS3, Javascript, Bootstrap 5
- Back-end: Java Servlets
- Database: MySQL
- Third Party Cloud Storage: Amazon S3 Buckets

## Component Overview

**1) User Registration and Sign-in**

<div align="center">
  <img src="https://user-images.githubusercontent.com/53030762/149640956-31c85579-f7ed-45cd-8e93-f0619d29ee3b.png" width="750"/>
</div>

<br>

**2) Product Listing Page**

Here, user can view different products which are pproved by the admins and are available to rent. Users can also apply filters based on different criteria such as product location (state and city), product rating, product price and sorting order. Moreover, users can search different products based on their category or by using keywords (textual and voice activated search).  


<div align="center">
  <img src="https://user-images.githubusercontent.com/53030762/149641823-70d9800c-c3f5-4129-8ff3-9847903be54d.png" width="750"/>
</div>

<br>

**3) Product Information Page**

This component will display all the details of the product such as product image, product title, description, price, seller’s information, rating, reviews, location, and recommendation of the similar category products. On this page user can also add reviews, submit complaints, or rent a product. 

<div align="center">
  <img src="https://user-images.githubusercontent.com/53030762/149642047-935271d1-d7b0-4d30-893b-03c506288ba7.png" width="750"/>
</div>
<br>

### Add Reviews and Rent Product

**Note:** The Payment form is just a dummy form. We haven't implemented an actual payment form. This is just for simulating payment process and then adding the product to the users renting list. 

<div align="center">
  <img src="https://user-images.githubusercontent.com/53030762/149642757-5d8c1a7c-1cfd-4267-96d8-5151b0c3b71a.png" width="750"/>
</div>
<br>



**4) Chat Messaging**

In this component, users can chat with one another. You can access this module either from your Account Dashboard on directly initiate chat with seller from Product Information page

<div align="center">
  <img src="https://user-images.githubusercontent.com/53030762/149642297-8982e138-0730-4786-b9b3-7a4dd20ced71.png" width="750"/>
</div>


<div align="center">
  <img src="https://user-images.githubusercontent.com/53030762/149642310-fb617d24-dbce-46d0-abd6-7d890bd0b017.png" width="750"/>
</div>
<br>

**5) User Account Dashboard**

This is a personalized dashboard for every user. Here the user can view list of products which he has uploaded, list of products which he has rented, access chat history or add new product.

<div align="center">
  <img src="https://user-images.githubusercontent.com/53030762/149642421-fadbacac-1205-4122-93be-e6ad951ffa53.png" width="750"/>
</div>
<br>

**6) Chatbot**

It acts as an assistant to the user for guiding them on using the website. Users can ask different questions and chatbot can reply with appropriate answers. 

<div align="center">
  <img src="https://user-images.githubusercontent.com/53030762/149642592-e42a311e-532c-4039-b71a-4bdfd7391635.png" width="600"/>
</div>
<br>


## Note:
To create an admin account you can do the following steps:
- login by creating a user account with your admin credentials
- Then, in the database, change the value of column _type_ in the _user_ table to **admin**

We have already created one admin account with following credentials:
Username: admin@rentall.com
Pwd: admin@Rentall123
