package com.app.rentall.Controller.Product;

import com.app.rentall.DAO.ProductDAO;
import com.app.rentall.Model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sound.midi.Soundbank;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductListing", value = "/ProductListing")
public class ProductListing extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getParameter("action").equals("allProducts")){






            List<Product> availableProductList = ProductDAO.getApprovedProducts();
            request.setAttribute("availableProductList", availableProductList);
            request.setAttribute("category","allProducts");
            request.setAttribute("minPrice",0);
            request.setAttribute("maxPrice", 1000);
            request.setAttribute("sortBy","default");
            if (request.getSession().getAttribute("user_id") != null){
                int user_id = Integer.parseInt(String.valueOf(request.getSession().getAttribute("user_id")));
                List<Product> recommendedProdList = ProductDAO.getRecommendedProductsByUserId(user_id) ;
                request.setAttribute("recommendedProducts", recommendedProdList);
            }

            request.getRequestDispatcher("productListing.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
