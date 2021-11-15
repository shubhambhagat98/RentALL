package com.app.rentall.Controller.DBUser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import com.app.rentall.DAO.DBLoginDAO;
import com.app.rentall.Model.User;
import org.apache.commons.codec.digest.DigestUtils;

@WebServlet(name = "DBSignup", value = "/DBSignup")
public class DBSignup extends HttpServlet {
    static String type = "DBLogin";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String email_id = request.getParameter("email_id");
        String password = request.getParameter("password");
        long contact = Long.parseLong(request.getParameter("contact"));
        String security_1 = request.getParameter("security_1").toLowerCase();
        String security_2 = request.getParameter("security_2").toLowerCase();
        String security_3 = request.getParameter("security_3").toLowerCase();

        System.out.println("inside db signup servlet");


        //generate hashed password
        String hashedPassword = DigestUtils.sha256Hex(password);



        User newUser = new User(first_name, last_name, email_id, hashedPassword, contact, security_1, security_2,security_3, type);
        int status = DBLoginDAO.insertUser(newUser);
        if (status == 1){
            response.sendRedirect("login.jsp");
        }else {
            HttpSession session = request.getSession();
            session.invalidate();
            session = request.getSession(true);
            session.setAttribute("signupError",true);
            response.sendRedirect("signup.jsp");
        }



    }
}
