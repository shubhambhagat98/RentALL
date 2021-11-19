package com.app.rentall.Controller.DBUser;

import com.app.rentall.DAO.DBLoginDAO;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "VerifyCode", value = "/VerifyCode")
public class VerifyCode extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("inside verify code");
        HttpSession session = request.getSession();

        String enteredCode = request.getParameter("verification_code");
        String sentCode =String.valueOf(session.getAttribute("verificationCode"));
        int user_id = Integer.parseInt(String.valueOf(request.getSession().getAttribute("user_id")));

        if (enteredCode.equals(sentCode)){
            System.out.println("code matched");
            String new_password = request.getParameter("password");
            String hashedPassword = DigestUtils.sha256Hex(new_password);
            int status = DBLoginDAO.updatePassword(user_id, hashedPassword);
            if (status == 1){
                System.out.println("password reset successfully");
                session.setAttribute("passwordReset", true);
                response.sendRedirect("login.jsp");
            }else{
                System.out.println("password reset failed");
                session.setAttribute("passwordResetError", true);
                response.sendRedirect("verificationCode.jsp");
            }


        }else {
            System.out.println("code does not match");
            session.setAttribute("invalidCodeError",true);
            response.sendRedirect("verificationCode.jsp");
        }

    }
}
