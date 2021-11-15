package com.app.rentall.Controller.UserAccount;

import com.app.rentall.DAO.ProductDAO;
import com.app.rentall.Model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MyAccount", value = "/MyAccount")
public class MyAccount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Product> approvedProductList = ProductDAO.getApprovedProducts();
//        List<Product> notApprovedProductList = ProductDAO.getNotApprovedProducts();

//        request.setAttribute("approvedProductList", approvedProductList);
//        request.setAttribute("notApprovedProductList", notApprovedProductList);
//        request.setAttribute("rentedProductList", rentedProductList);

        List<Product> yourProductList = ProductDAO.getProductsByUserId(String.valueOf(request.getSession().getAttribute("user_id")));
        int user_id = Integer.parseInt(String.valueOf(request.getSession().getAttribute("user_id")));
        List<Product> rentedProductList = ProductDAO.getRentedProducts(user_id);
        System.out.println("rented product list size: "+rentedProductList.size());

        request.setAttribute("yourProductList", yourProductList);
        request.setAttribute("rentedProductList", rentedProductList);
        request.getRequestDispatcher("account.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
