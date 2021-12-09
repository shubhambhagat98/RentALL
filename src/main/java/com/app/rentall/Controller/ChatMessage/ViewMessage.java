package com.app.rentall.Controller.ChatMessage;

import com.app.rentall.DAO.ChatDAO;
import com.app.rentall.DAO.DBLoginDAO;
import com.app.rentall.Model.Message;
import com.app.rentall.Model.User;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ViewMessage", value = "/ViewMessage")
public class ViewMessage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int user_id = Integer.parseInt(String.valueOf(request.getSession().getAttribute("user_id")));

        List<Message> messageList = new ArrayList<>();

        String action = request.getParameter("action");

        if (action.equals("getMessageByToken")){
            int token = Integer.parseInt(request.getParameter("token"));
            messageList = ChatDAO.getMessageByToken(token);
        }else if (action.equals("getMessageById")){
            int to_user_id = Integer.parseInt(request.getParameter("to_user_id"));
            messageList = ChatDAO.getMessageById(user_id, to_user_id);

        }



        int to_user_id = Integer.parseInt(request.getParameter("to_user_id"));

        request.setAttribute("to_user", to_user_id);
        request.setAttribute("messageList", messageList);
        request.getRequestDispatcher("viewMessage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int to_user_id = Integer.parseInt(request.getParameter("to_user_id"));
        int user_id = Integer.parseInt(String.valueOf(request.getSession().getAttribute("user_id")));
        List<Message> messageList= ChatDAO.getMessageById(user_id, to_user_id);
        request.setAttribute("to_user", to_user_id);
        request.setAttribute("messageList", messageList);
        request.getRequestDispatcher("chatMessage.jsp").forward(request, response);





    }
}
