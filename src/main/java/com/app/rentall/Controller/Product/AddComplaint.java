package com.app.rentall.Controller.Product;

import com.app.rentall.DAO.DBLoginDAO;
import com.app.rentall.DAO.ProductDAO;
import com.app.rentall.Model.Complaint;
import com.app.rentall.Model.Product;
import com.app.rentall.Model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddComplaint", value = "/AddComplaint")
public class AddComplaint extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int user_id = Integer.parseInt(String.valueOf(request.getSession().getAttribute("user_id")));
        int seller_id = Integer.parseInt(request.getParameter("seller_id"));
        int product_id = Integer.parseInt(request.getParameter("product_id"));
        String complaint_description = request.getParameter("complaint_description");
        String date = request.getParameter("complaint_date");

        User seller = DBLoginDAO.getUserById(seller_id);
        User renter = DBLoginDAO.getUserById(user_id);
        Product product = ProductDAO.getProductById(product_id);

        Complaint complaint = new Complaint();
        complaint.setRenter(renter);
        complaint.setSeller(seller);
        complaint.setProduct(product);
        complaint.setDescription(complaint_description);
        complaint.setDate(date);

        int status = ProductDAO.addComplaint(complaint);

        String prev_action = request.getParameter("prev_action");
        if (prev_action.equals("availableProduct")){
            response.sendRedirect(request.getContextPath()+"/ProductDetails?action=availableProduct&product_id="+product_id);
        } else if (prev_action.equals("rentedProductsByYou")){
            response.sendRedirect(request.getContextPath()+"/ProductDetails?action=rentedProductsByYou&product_id="+product_id);
        }

    }
}
