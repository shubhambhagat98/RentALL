package com.app.rentall.Controller.Product;

import com.app.rentall.DAO.DBLoginDAO;
import com.app.rentall.DAO.ProductDAO;
import com.app.rentall.Model.Review;
import com.app.rentall.Model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddReview", value = "/AddReview")
public class AddReview extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("inside add review");
        // Fetching the inputs
        int product_id = Integer.parseInt(request.getParameter("product_id"));
        String review_title = request.getParameter("review_title");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String review_description = request.getParameter("review_description");

        int user_id = Integer.parseInt(String.valueOf(request.getSession().getAttribute("user_id")));

        User userReviewer = DBLoginDAO.getUserById(user_id);
        String date = request.getParameter("review_date");

        Review review = new Review();
        review.setReview_title(review_title);
        review.setReview_description(review_description);
        review.setReview_rating(rating);
        review.setReview_date(date);
        review.setProduct_id(product_id);
        assert userReviewer != null;
        review.setReviewer_name(userReviewer.getFirst_name()+" "+userReviewer.getLast_name());

        System.out.println(review);

        int status = ProductDAO.addReview(review);
        System.out.println(status);

        String prev_action = request.getParameter("prev_action");
        if (prev_action.equals("availableProduct")){
            response.sendRedirect(request.getContextPath()+"/ProductDetails?action=availableProduct&product_id="+product_id);
        } else if (prev_action.equals("rentedProductsByYou")){
            response.sendRedirect(request.getContextPath()+"/ProductDetails?action=rentedProductsByYou&product_id="+product_id);
        }



    }
}
