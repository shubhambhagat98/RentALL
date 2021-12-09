package com.app.rentall.Controller.DBUser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import com.app.rentall.DAO.DBLoginDAO;
import com.app.rentall.Model.User;
import org.apache.commons.codec.digest.DigestUtils;

@WebServlet(name = "DBLogin", value = "/DBLogin")
public class DBLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email_id = request.getParameter("email_id");
        String password  = request.getParameter("password");

        //generate hashed password
        String hashedPassword = DigestUtils.sha256Hex(password);

        User loggedInUser = DBLoginDAO.isValidUser(email_id, hashedPassword);
        HttpSession session = request.getSession();
        session.invalidate();
        session = request.getSession(true);
        if (loggedInUser != null){
            session.setAttribute("user_id", loggedInUser.getUser_id());
            session.setAttribute("first_name", loggedInUser.getFirst_name());
            session.setAttribute("last_name", loggedInUser.getLast_name());
            session.setAttribute("email_id", loggedInUser.getEmail_id());
            session.setAttribute("contact", loggedInUser.getContact());
            session.setAttribute("type", loggedInUser.getType());
            response.sendRedirect("index.jsp");
        }else {
            session.setAttribute("loginError",true);
            response.sendRedirect("login.jsp");
        }



    }
}
