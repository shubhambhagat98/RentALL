package com.app.rentall.Controller.Product;

import com.app.rentall.DAO.DBLoginDAO;
import com.app.rentall.DAO.ProductDAO;
import com.app.rentall.GeoCode.GeoCodeImplementation;
import com.app.rentall.Model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductDetails", value = "/ProductDetails")
public class ProductDetails extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int product_id = Integer.parseInt(request.getParameter("product_id"));
//        int user_id = Integer.parseInt(String.valueOf(request.getSession().getAttribute("user_id")));

        System.out.println("inside product details");
        // get all details of product
        Product product = ProductDAO.getProductById(product_id);
        System.out.println("product details: "+product);

        // get details of seller
        User seller = DBLoginDAO.getUserById(product.getUser_id());
        assert seller != null;
        System.out.println("Seller details: "+seller.getEmail_id());

        // get all images of product
        List<String> imageFileList = ProductDAO.getAllImages(product_id);

        // get all reviews
        List<Review> reviewList = ProductDAO.getAllReviews(product_id);

        String address = product.getProd_street_address() + ", " + product.getProd_city() + ", "+ product.getProd_state()+", "+product.getProd_pincode() +", US";
        LatAndLng latAndLng = GeoCodeImplementation.getLatandLang(address);







        if (request.getParameter("action").equals("availableProduct")){

            System.out.println("product rating:"+product.getProd_rating());
            request.setAttribute("product", product);
            request.setAttribute("seller", seller);
            request.setAttribute("imageFileList", imageFileList);
            request.setAttribute("reviewList", reviewList);
            request.setAttribute("lat", latAndLng.getLat());
            request.setAttribute("lng",latAndLng.getLng());
            request.getRequestDispatcher("availableProduct.jsp").forward(request, response);

        }else if (request.getParameter("action").equals("yourProduct")){
            System.out.println("inside your product if condition");
            RentedProduct rentedProduct = ProductDAO.getRentedProductDetails(product_id);
            if (rentedProduct != null){
                User renter = DBLoginDAO.getUserById(rentedProduct.getUser_id());
                System.out.println("renter: "+renter);
                System.out.println("rented product:"+rentedProduct);
                request.setAttribute("rentedProduct",rentedProduct);
                request.setAttribute("renter",renter);
                request.setAttribute("rentFlag",true);
            }else {
                request.setAttribute("rentFlag", false);
            }
            request.setAttribute("product", product);
            request.setAttribute("seller", seller);
            request.setAttribute("imageFileList", imageFileList);
            request.setAttribute("reviewList", reviewList);
            request.setAttribute("lat", latAndLng.getLat());
            request.setAttribute("lng",latAndLng.getLng());
            request.getRequestDispatcher("YourProduct.jsp").forward(request, response);

        }else  if (request.getParameter("action").equals("rentedProductsByYou")){
            RentedProduct rentedProduct = ProductDAO.getRentedProductDetails(product_id);
            assert rentedProduct != null;
            User renter = DBLoginDAO.getUserById(rentedProduct.getUser_id());
            request.setAttribute("product", product);
            request.setAttribute("seller", seller);
            request.setAttribute("renter",renter);
            request.setAttribute("rentedProduct",rentedProduct);
            request.setAttribute("imageFileList", imageFileList);
            request.setAttribute("reviewList", reviewList);
            request.setAttribute("lat", latAndLng.getLat());
            request.setAttribute("lng",latAndLng.getLng());
            request.getRequestDispatcher("rentedProductsByYou.jsp").forward(request, response);

        } else if (request.getParameter("action").equals("notApprovedProduct")){
            request.setAttribute("product", product);
            request.setAttribute("seller", seller);
            request.setAttribute("imageFileList", imageFileList);
            request.setAttribute("reviewList", reviewList);
            request.setAttribute("lat", latAndLng.getLat());
            request.setAttribute("lng",latAndLng.getLng());
            request.getRequestDispatcher("notApprovedProduct.jsp").forward(request, response);
        }






    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
