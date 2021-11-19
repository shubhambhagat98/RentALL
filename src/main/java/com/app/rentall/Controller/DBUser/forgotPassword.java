package com.app.rentall.Controller.DBUser;

import com.app.rentall.DAO.DBLoginDAO;
import com.app.rentall.Model.User;
import com.app.rentall.SendEmail.SendEmail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "forgotPassword", value = "/forgotPassword")
public class forgotPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("inside forgot Password Servlet");

        String email_id = request.getParameter("email_id");
        String security_1 = request.getParameter("security_1").toLowerCase();
        String security_2 = request.getParameter("security_2").toLowerCase();
        String security_3 = request.getParameter("security_3").toLowerCase();
        HttpSession session = request.getSession();
        session.invalidate();
        session = request.getSession(true);

        int user_id = DBLoginDAO.checkSecurity(email_id, security_1, security_2, security_3);
        if (user_id != -1){
            // send verification code via email
            System.out.println("user id: "+user_id);
            User user = DBLoginDAO.getUserById(user_id);
            String verificationCode = SendEmail.getRandomCode();
            System.out.println(verificationCode);
            assert user != null;
            boolean status = SendEmail.sendEmail(user, verificationCode);
            System.out.println(status);
            if (status){
                System.out.println("email sent successfully");
                session.setAttribute("verificationCode", verificationCode);
                session.setAttribute("user_id", user_id);
                response.sendRedirect("verificationCode.jsp");;
            }else {
                System.out.println("failed to send email.");
                session.setAttribute("sendEmailError",true);
                response.sendRedirect("forgotPassword.jsp");
            }


        }else {
            System.out.println("forgot Password else condition");
            session.setAttribute("forgotPasswordError",true);
            response.sendRedirect("forgotPassword.jsp");
        }
    }
}
