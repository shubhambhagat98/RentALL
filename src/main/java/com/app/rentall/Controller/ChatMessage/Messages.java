package com.app.rentall.Controller.ChatMessage;

import com.app.rentall.DAO.ChatDAO;
import com.app.rentall.Model.Message;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Messages", value = "/Messages")
public class Messages extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int user_id = Integer.parseInt(String.valueOf(request.getSession().getAttribute("user_id")));
        List<Message> messageList = ChatDAO.getAllMessage(user_id);
        request.setAttribute("messageList", messageList);
        request.getRequestDispatcher("message.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
