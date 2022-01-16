package com.app.rentall.SendEmail;

import com.app.rentall.Model.User;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class SendEmail {

    //generate verification code
    public static String getRandomCode(){
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    public static boolean sendEmail(User user, String code){
        boolean status = false;

        String toEmail = user.getEmail_id();
        String fromEmail = "Your Email ID";
        String password = "Your Password";

        try {

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
            mess.setSubject("Password Reset Code");

            //set message text
            mess.setText("Your request to reset your password is in process. Please use the following verification code for resetting your password \nCode: " + code);

            //send the message
            Transport.send(mess);
            status = true;

        }catch (Exception e) {
            e.printStackTrace();
        }
        return status;

    }


}
