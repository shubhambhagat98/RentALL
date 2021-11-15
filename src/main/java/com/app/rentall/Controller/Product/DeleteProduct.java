package com.app.rentall.Controller.Product;

import com.app.rentall.DAO.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteProduct", value = "/DeleteProduct")
public class DeleteProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int product_id = Integer.parseInt(request.getParameter("product_id"));
        int user_id = Integer.parseInt(String.valueOf(request.getSession().getAttribute("user_id")));

        File file = null;

        List<String> imageList = ProductDAO.getAllImages(product_id);
        for (String image: imageList){
            file = new File(getServletContext().getRealPath("images") + File.separator + "products" + File.separator +image);
            if(file.delete())
            {
                System.out.println("File deleted successfully");
            }
            else
            {
                System.out.println("Failed to delete the file");
            }
        }

        int status1 = ProductDAO.deleteImage(product_id);
        int status2 = ProductDAO.deleteRentedProduct(product_id);
        int status3 = ProductDAO.deleteProduct(product_id);
        System.out.println("inside delete servlet");
        System.out.println("product id: "+product_id);
        response.sendRedirect(request.getContextPath()+"/MyAccount");


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
