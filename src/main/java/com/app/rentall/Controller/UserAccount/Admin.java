package com.app.rentall.Controller.UserAccount;

import com.app.rentall.DAO.ProductDAO;
import com.app.rentall.Model.Complaint;
import com.app.rentall.Model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Admin", value = "/Admin")
public class Admin extends HttpServlet {

    static List<Product> pendingProductList;
    static List<Product> rentedProductList;
    static String prodCategoryCount;
    static String prodLocationCount;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String query = request.getParameter("adminQuery");


        if (query.equals("productList")){
//            session.setAttribute("adminQuery",);
            pendingProductList = ProductDAO.getNotApprovedProducts();
            rentedProductList = ProductDAO.getRentedProductsAdmin();
            request.setAttribute("adminQuery","productList");
            request.setAttribute("pendingProductList", pendingProductList);
            request.setAttribute("rentedProductList", rentedProductList);
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        } else if (query.equals("analytics")){
            prodCategoryCount = ProductDAO.getProductCategoryCount();
            prodLocationCount = ProductDAO.getProductLocationCount();
            request.setAttribute("adminQuery","analytics");
            request.setAttribute("prodCategoryCount", prodCategoryCount);
            request.setAttribute("prodLocationCount", prodLocationCount);;
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        } else if (query.equals("complaints")){
            request.setAttribute("adminQuery","complaints");
            List<Complaint> complaintList = ProductDAO.getAllComplaints();
            request.setAttribute("complaintList", complaintList);
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
