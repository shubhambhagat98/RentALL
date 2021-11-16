package com.app.rentall.Controller.GoogleUser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import com.app.rentall.DAO.GoogleLoginDAO;
import com.app.rentall.Model.User;
import com.app.rentall.OAuthVerify.IdTokenVerifierAndParser;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;

@WebServlet(name = "GoogleLogin", value = "/GoogleLogin")
public class GoogleLogin extends HttpServlet {
    static String type = "GoogleLogin";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String id_token = request.getParameter("id_token");
            GoogleIdToken.Payload payload = IdTokenVerifierAndParser.getPayload(id_token);
            String name = (String) payload.get("name");
            String email_id = payload.getEmail();

            System.out.println("User name: " + name);
            System.out.println("User email: " + email_id);
            System.out.println(id_token);
            String first_name = name.split(" ")[0];
            String last_name = name.split(" ")[1];

            User checkedUser = GoogleLoginDAO.checkUser(email_id, first_name, last_name, type);
            HttpSession session = request.getSession();
            session.invalidate();
            session = request.getSession(true);
            if (checkedUser != null){
//                session.setAttribute("user_id", checkedUser.getUser_id());
//                session.setAttribute("first_name", checkedUser.getFirst_name());
//                session.setAttribute("last_name", checkedUser.getLast_name());
//                session.setAttribute("email_id", checkedUser.getEmail_id());
//                session.setAttribute("type", checkedUser.getType());
                System.out.println("user: "+checkedUser);
                response.sendRedirect("index.jsp");
            } else {

                User user = new User();
                user.setFirst_name(first_name);
                user.setLast_name(last_name);
                user.setEmail_id(email_id);
                user.setType(type);

                //add user in database for first time
                int status   = GoogleLoginDAO.insertUser(user);
                User insertedUser = GoogleLoginDAO.getInsertedUser();
                assert insertedUser != null;
                session.setAttribute("user_id", insertedUser.getUser_id());
                session.setAttribute("first_name", insertedUser.getFirst_name());
                session.setAttribute("last_name", insertedUser.getLast_name());
                session.setAttribute("email_id", insertedUser.getEmail_id());
                session.setAttribute("type", insertedUser.getType());
                response.sendRedirect("index.jsp");

            }



        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
