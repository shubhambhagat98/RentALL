package com.app.rentall.Controller.Product;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.handlers.HandlerContextKey;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.util.StringUtils;
import com.app.rentall.DAO.ProductDAO;
import com.app.rentall.Model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
@MultipartConfig
@WebServlet(name = "AddProduct1", value = "/AddProduct1")
public class AddProduct1 extends HttpServlet {

//    String AWS_ACCESS_KEY_ID  = System.getenv("AWS_ACCESS_KEY_ID");
//    String AWS_SECRET_ACCESS_KEY = System.getenv("AWS_SECRET_ACCESS_KEY");
//    String S3_BUCKET_NAME = System.getenv("S3_BUCKET_NAME");



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println(request);

        String prod_title = request.getParameter("prod_title");
        System.out.println("prod title: "+request.getParameter("prod_title"));
        String prod_description = request.getParameter("prod_description");
        String prod_category = request.getParameter("prod_category");
        String prod_duration = request.getParameter("prod_duration");
        System.out.println("prod price: "+request.getParameter("prod_price"));
        int prod_price = Integer.parseInt(request.getParameter("prod_price"));
        String prod_street_address = request.getParameter("street_address");
        String prod_state = request.getParameter("state");
        String prod_city = request.getParameter("city");
        int prod_pincode = Integer.parseInt(request.getParameter("pincode"));
        Collection<Part> imageFileList = request.getParts();

        System.out.println("session user id: "+ request.getSession().getAttribute("user_id"));
        int user_id = Integer.parseInt(String.valueOf(request.getSession().getAttribute("user_id")));
        InputStream is = null;
        String date = null;
        String time = null;

        Product product = new Product();

        product.setProd_title(prod_title);
        product.setProd_description(prod_description);
        product.setProd_category(prod_category);
        product.setProd_duration(prod_duration);
        product.setProd_price(prod_price);
        product.setProd_street_address(prod_street_address);
        product.setProd_city(prod_city);
        product.setProd_state(prod_state);
        product.setProd_pincode(prod_pincode);
        product.setProd_status("Not Approved");
        product.setUser_id(user_id);

        int status = ProductDAO.addProduct(product);

        String AWS_ACCESS_KEY_ID  = System.getenv("AWS_ACCESS_KEY_ID");
        String AWS_SECRET_ACCESS_KEY = System.getenv("AWS_SECRET_ACCESS_KEY");
        String S3_BUCKET_NAME = System.getenv("S3_BUCKET_NAME");

        System.out.println(HandlerContextKey.class.getProtectionDomain().getCodeSource().getLocation().getPath());




        BasicAWSCredentials awsCredentials = new BasicAWSCredentials(AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY);

        System.out.println(awsCredentials);

//        AmazonS3 s3client = new AmazonS3Client(awsCredentials);
//        AmazonS3 s3client = new AmazonS3Client(new ProfileCredentialsProvider());
        AmazonS3 s3client = AmazonS3ClientBuilder.standard()
                .withCredentials(new AWSStaticCredentialsProvider(awsCredentials))
                .withRegion(Regions.CA_CENTRAL_1)
                .build();


        if (status == 1){
            System.out.println("inside add product servlet, adding image");




            for (Part image: imageFileList){
                if (image.getSubmittedFileName() != null ){
                    try {

                        System.out.println("Image file name: "+image.getSubmittedFileName());
                        date = String.valueOf(java.time.LocalDate.now());
                        time = String.valueOf(java.time.LocalTime.now());

                        String keyName = user_id + "_" + date + "_" + time + "_" +image.getSubmittedFileName();
                        is = image.getInputStream();

                        ObjectMetadata om = new ObjectMetadata();
                        om.setContentLength(image.getSize());

                        // save image on aws s3
                        PutObjectRequest putObjectRequest = new PutObjectRequest(S3_BUCKET_NAME, keyName, is , om);
                        putObjectRequest.withCannedAcl(CannedAccessControlList.PublicRead);
                        s3client.putObject(putObjectRequest);
//                        s3client.setObjectAcl(S3_BUCKET_NAME, keyName, CannedAccessControlList.PublicRead);
                        System.out.println("image successfully uploaded in aws s3");


                        // save image name in database
                        int imgStatus = ProductDAO.addImage(keyName);
                        System.out.println("image successfully added in the database");



                    }catch (IOException e) {
                        e.printStackTrace();
                    }catch (AmazonServiceException ase) {
                        System.out.println("amazon service exception");
                        System.out.println(ase.getMessage());
                    } catch (AmazonClientException ace) {
                        System.out.println("amazon client exception");
                        System.out.println(ace.getMessage());
                    }

                }
            }

            response.sendRedirect(request.getContextPath()+"/MyAccount");
        }else {
            HttpSession session = request.getSession();
            session.setAttribute("addProductError",true);
            response.sendRedirect("addProduct.jsp");
        }



    }
}
