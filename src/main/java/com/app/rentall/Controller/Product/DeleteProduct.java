package com.app.rentall.Controller.Product;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
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

        String AWS_ACCESS_KEY_ID  = System.getenv("AWS_ACCESS_KEY_ID");
        String AWS_SECRET_ACCESS_KEY = System.getenv("AWS_SECRET_ACCESS_KEY");
        String S3_BUCKET_NAME = System.getenv("S3_BUCKET_NAME");



        BasicAWSCredentials awsCredentials = new BasicAWSCredentials(AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY);
        System.out.println(awsCredentials);
        AmazonS3 s3client = AmazonS3ClientBuilder.standard()
                .withCredentials(new AWSStaticCredentialsProvider(awsCredentials))
                .withRegion(Regions.CA_CENTRAL_1)
                .build();

        List<String> imageList = ProductDAO.getAllImages(product_id);
        for (String image: imageList){


//            delete image from aws s3
            s3client.deleteObject(S3_BUCKET_NAME, image);
            System.out.println(image+" deleted from aws s3");



        }

        int status1 = ProductDAO.deleteImage(product_id);
        int status2 = ProductDAO.deleteRentedProduct(product_id);
        int status3 = ProductDAO.deleteProduct(product_id);
        int status4 = ProductDAO.deleteReview(product_id);
        int status5 = ProductDAO.deleteComplaint(product_id);
        System.out.println("inside delete servlet");
        System.out.println("product id: "+product_id);
        response.sendRedirect(request.getContextPath()+"/MyAccount");


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
