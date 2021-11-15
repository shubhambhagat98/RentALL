package com.app.rentall.Controller.Product;

import com.app.rentall.DAO.ProductDAO;
import com.app.rentall.Model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;

@MultipartConfig
@WebServlet(name = "AddProduct", value = "/AddProduct")
public class AddProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String prod_title = request.getParameter("prod_title");
        System.out.println(request.getParameter("prod_title"));
        String prod_description = request.getParameter("prod_description");
        String prod_category = request.getParameter("prod_category");
        System.out.println(request.getParameter("prod_price"));
        int prod_price = Integer.parseInt(request.getParameter("prod_price"));
        String prod_street_address = request.getParameter("street_address");
        String prod_state = request.getParameter("state");
        String prod_city = request.getParameter("city");
        int prod_pincode = Integer.parseInt(request.getParameter("pincode"));
        Collection<Part> imageFileList = request.getParts();

        System.out.println("session user id: "+ request.getSession().getAttribute("user_id"));
        int user_id = Integer.parseInt(String.valueOf(request.getSession().getAttribute("user_id")));
        String destination = null;
        FileOutputStream fos = null;
        InputStream is = null;
        byte[] data = null;
        String date = null;
        String time = null;

        Product product = new Product();

        product.setProd_title(prod_title);
        product.setProd_description(prod_description);
        product.setProd_category(prod_category);
        product.setProd_price(prod_price);
        product.setProd_street_address(prod_street_address);
        product.setProd_city(prod_city);
        product.setProd_state(prod_state);
        product.setProd_pincode(prod_pincode);
        product.setProd_status("Not Approved");
        product.setUser_id(user_id);

        int status = ProductDAO.addProduct(product);

        if (status == 1){
            System.out.println("inside add product servlet, adding image");
            for (Part image: imageFileList){
                if (image.getSubmittedFileName() != null){
                    try {
                        // save actual image in image/products folder
                        System.out.println("Image file name: "+image.getSubmittedFileName());
                        date = String.valueOf(java.time.LocalDate.now());
                        time = String.valueOf(java.time.LocalTime.now());
                        destination = getServletContext().getRealPath("images") + File.separator + "products" + File.separator + user_id + "_" + date + "_" + time + "_" +image.getSubmittedFileName();
                        fos = new FileOutputStream(destination);
                        is = image.getInputStream();
                        data = new byte[is.available()];
                        is.read(data);
                        fos.write(data);

                        // save image name in the database

                        int imageStatus =  ProductDAO.addImage(user_id + "_" + date + "_" + time + "_" +image.getSubmittedFileName());

                    } catch (IOException e) {
                        e.printStackTrace();
                    } finally {
                        if (fos != null) {
                            fos.close();
                        }
                    }
                }
            }

            response.sendRedirect(request.getContextPath()+"/MyAccount");
//          response.sendRedirect("account.jsp");

        }else {
            HttpSession session = request.getSession();
            session.setAttribute("addProductError",true);
            response.sendRedirect("addProduct.jsp");
        }

    }
}
