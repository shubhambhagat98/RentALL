package com.app.rentall.SendEmail;

import com.app.rentall.Model.Product;
import com.app.rentall.Model.RentedProduct;
import com.app.rentall.Model.User;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Properties;

public class SendRenterEmail {

    public static boolean sendRenterEmail(User renter, User seller, Product product, RentedProduct rentedProduct, String destination){
        boolean status = false;
        System.out.println("inside sendRenter email");

        String toEmail = renter.getEmail_id();
        String fromEmail = "rentall398@gmail.com";
        String password = "ajaxdmrtudppsqxr";

        try{
            // host email smtp server details
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            pr.put("mail.smtp.socketFactory.port", "587");
            pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            //get session to authenticate the host email address and password
            Authenticator auth = new Authenticator() {
                public PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            };
            Session session = Session.getInstance(pr, auth);

            // Create a default MimeMessage object.
            Message mess = new MimeMessage(session);

            //set from email address
            mess.setFrom(new InternetAddress(fromEmail));

            //set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

            //set email subject
            mess.setSubject("RentALL Product Confirmation");

            MimeMultipart multipart = new MimeMultipart("related");

            //first part
            MimeBodyPart textPart1 = new MimeBodyPart();
            String text1 = "<h3>Following product has been added to your renting list</h3>" +
                    "<img width=\"300\" height=\"170\" style=\"object-fit: contain\" src = "+destination+product.getProd_firstImage()+"><br>" +
                    "<h3>Product Title: "+ product.getProd_title() +"</h3>" +
                    "<h3>Seller Information:</h3>" +
                    "<span><b>Name: </b>"+ seller.getFirst_name()+" "+seller.getLast_name() +" </span><br>" +
                    "<span><b>Email Id: </b>"+ seller.getEmail_id()+" </span><br>" +
                    "<span><b>Location: </b>"+ product.getProd_street_address()+", "+ product.getProd_city()+", "+ product.getProd_state()+", "+product.getProd_pincode()+", US. </span><br>" +
                    "<h3>Rent Information:</h3>" +
                    "<span><b>Start Date: </b>"+ rentedProduct.getStart_date()+"</span><br>" +
                    "<span><b>End Date: </b>"+ rentedProduct.getEnd_date()+"</span><br>" +
                    "<span><b>Total Cost: </b>"+"$"+ rentedProduct.getTotal_cost()+"</span><br><br>" +
                    "<span>Thank you for using RentALL.</span><br>" +
                    "<h3>Regards<b></h3>" +
                    "<span>RentALL Team</span>";
            textPart1.setContent(text1, "text/html");
            multipart.addBodyPart(textPart1);

//            //second part
//            MimeBodyPart product_image = new MimeBodyPart();
//            String image_path = destination+product.getProd_firstImage();
//            DataSource fds = new FileDataSource(image_path);
//            product_image.setDataHandler(new DataHandler(fds));
//            product_image.setHeader("Content-ID","<image>");
//            multipart.addBodyPart(product_image);

            // put everything together
            mess.setContent(multipart);



            System.out.println("sending renter mail");
            // Send message
            Transport.send(mess);

            status = true;


        }catch (Exception e) {
            e.printStackTrace();
        }



        return status;
    }
}
