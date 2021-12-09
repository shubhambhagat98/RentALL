package com.app.rentall.Controller.Product;

import com.app.rentall.DAO.ProductDAO;
import com.app.rentall.Model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchProduct", value = "/SearchProduct")
public class SearchProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action.equals("category")){
            String category = request.getParameter("category");
            List<Product> availableProductList = ProductDAO.getProductsByCategory(category);
            request.setAttribute("availableProductList", availableProductList);
            request.setAttribute("category", category);
            request.setAttribute("minPrice",0);
            request.setAttribute("maxPrice", 1000);
            request.getRequestDispatcher("productListing.jsp").forward(request, response);

        }else if (action.equals("keyword")){
            String keyword = request.getParameter("keyword");
            System.out.println(keyword);
            List<Product> availableProductList = ProductDAO.getProductsByKeyword(keyword);
            request.setAttribute("availableProductList", availableProductList);
            request.setAttribute("keyword", keyword);
            request.setAttribute("minPrice",0);
            request.setAttribute("maxPrice", 1000);
            request.getRequestDispatcher("productListing.jsp").forward(request, response);
        } else if (action.equals("filter")){
            String category = request.getParameter("category");
            String keyword = request.getParameter("keyword");
            String prod_state = request.getParameter("state");
            String prod_city = request.getParameter("city");
            String rating = request.getParameter("rating_button");
            int minPrice = Integer.parseInt(request.getParameter("minPrice"));
            int maxPrice = Integer.parseInt(request.getParameter("maxPrice"));
            String sortBy = request.getParameter("sortBy");

//            System.out.println("category: "+category);
//            System.out.println("keyword: "+keyword);
//            System.out.println("state: "+prod_state);
//            System.out.println("city: "+prod_city);
//            System.out.println("rating: "+rating);
//            System.out.println("min price: "+minPrice);
//            System.out.println("max price: "+maxPrice);
//            System.out.println("sort by price: "+sortBy);

            List<Product> availableProductList = ProductDAO.filterProducts(category,keyword, prod_state, prod_city, rating, minPrice, maxPrice, sortBy);
            request.setAttribute("availableProductList", availableProductList);
            request.setAttribute("category", category);
            request.setAttribute("keyword", keyword);
            request.setAttribute("state", prod_state);
            request.setAttribute("city",prod_city);
            request.setAttribute("rating", rating);
            request.setAttribute("minPrice",minPrice);
            request.setAttribute("maxPrice", maxPrice);
            request.setAttribute("sortBy", sortBy);
            request.getRequestDispatcher("productListing.jsp").forward(request, response);

        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
