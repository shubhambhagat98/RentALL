package com.app.rentall.Controller.ChatMessage;

import com.app.rentall.DAO.ChatDAO;

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

        String message = request.getParameter("message");
        int to_user_id = Integer.parseInt(request.getParameter("to_user"));
        if (!message.trim().equals("") ) {

            //check token
            int token  = ChatDAO.getToken(user_id, to_user_id);
            if (token !=0){
                int status = ChatDAO.insertMessage(user_id, to_user_id, message,token);
                response.sendRedirect(request.getContextPath()+"/ViewMessage?action=getMessageByToken&token="+token+"&to_user_id="+ to_user_id);
            }else {
                int new_token = Integer.parseInt(ChatDAO.getRandomCode());
                int status = ChatDAO.insertMessage(user_id, to_user_id, message,new_token);
                response.sendRedirect(request.getContextPath()+"/ViewMessage?action=getMessageByToken&token="+new_token+"&to_user_id="+ to_user_id);
            }

        }


    }
}
