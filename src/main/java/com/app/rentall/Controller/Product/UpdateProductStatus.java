package com.app.rentall.Controller.Product;

import com.app.rentall.DAO.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateProductStatus", value = "/UpdateProductStatus")
public class UpdateProductStatus extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int product_id = Integer.parseInt(request.getParameter("product_id"));


        if (action.equals("Hide")){
            int status = ProductDAO.updateProductStatus(product_id,"Unavailable");
            response.sendRedirect(request.getContextPath()+"/ProductDetails?action=yourProduct&product_id="+product_id);
        } else if (action.equals("Show")){
            int status = ProductDAO.updateProductStatus(product_id, "Available");
            response.sendRedirect(request.getContextPath()+"/ProductDetails?action=yourProduct&product_id="+product_id);
        } else if (action.equals("Approve")){
            int status = ProductDAO.updateProductStatus(product_id, "Available");
            response.sendRedirect(request.getContextPath()+"/Admin?adminQuery=productList");
        } else if (action.equals("NotApprove")){
            int status = ProductDAO.updateProductStatus(product_id, "Not Approved");
            response.sendRedirect(request.getContextPath()+"/ProductDetails?action=notApprovedProduct&product_id="+product_id);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
