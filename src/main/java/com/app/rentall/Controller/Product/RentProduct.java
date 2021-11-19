package com.app.rentall.Controller.Product;

import com.app.rentall.DAO.ProductDAO;
import com.app.rentall.Model.RentedProduct;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RentProduct", value = "/RentProduct")
public class RentProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        int product_id = Integer.parseInt(request.getParameter("product_id"));
        int user_id = Integer.parseInt(String.valueOf(request.getSession().getAttribute("user_id")));
        System.out.println(request.getParameter("total_cost"));
        float total_cost = Float.parseFloat(request.getParameter("total_cost"));
        System.out.println(startDate);
        System.out.println(endDate);
        System.out.println(product_id);
        System.out.println(user_id);

        RentedProduct rentedProduct = new RentedProduct(product_id, user_id, startDate,endDate, total_cost, "open");
        int status = ProductDAO.rentProduct(rentedProduct);
        if (status == 1){
            status = ProductDAO.updateProductStatus(product_id,"Rented");
        }

        HttpSession session = request.getSession();
        session.setAttribute("rentProduct", true);
        response.sendRedirect(request.getContextPath()+"/MyAccount");


    }
}
