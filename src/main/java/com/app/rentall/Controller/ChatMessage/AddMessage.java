package com.app.rentall.Controller.ChatMessage;

import com.app.rentall.DAO.ChatDAO;
import com.app.rentall.DAO.DBLoginDAO;
import com.app.rentall.Model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddMessage", value = "/AddMessage")
public class AddMessage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int user_id = Integer.parseInt(String.valueOf(request.getSession().getAttribute("user_id")));

        User from_user = DBLoginDAO.getUserById(user_id);
        String from_user_name = from_user.getFirst_name()+" "+from_user.getLast_name();


        String message = request.getParameter("message");
        int to_user_id = Integer.parseInt(request.getParameter("to_user"));

        User to_user = DBLoginDAO.getUserById(to_user_id);
        String to_user_name = to_user.getFirst_name()+" "+to_user.getLast_name();

        if (!message.trim().equals("") ) {

            //check token
            int token  = ChatDAO.getToken(user_id, to_user_id);
            if (token !=0){
                int status = ChatDAO.insertMessage(user_id, from_user_name, to_user_id, to_user_name, message,token);
                response.sendRedirect(request.getContextPath()+"/ViewMessage?action=getMessageByToken&token="+token+"&to_user_id="+ to_user_id);
            }else {
                int new_token = Integer.parseInt(ChatDAO.getRandomCode());
                int status = ChatDAO.insertMessage(user_id, from_user_name, to_user_id, to_user_name, message,new_token);
                response.sendRedirect(request.getContextPath()+"/ViewMessage?action=getMessageByToken&token="+new_token+"&to_user_id="+ to_user_id);
            }

        }


    }
}
