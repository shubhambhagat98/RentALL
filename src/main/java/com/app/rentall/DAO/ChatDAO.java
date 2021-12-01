package com.app.rentall.DAO;

import com.app.rentall.DBUtil.DBUtil;
import com.app.rentall.Model.Message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class ChatDAO {

    static Connection con = null;
    static PreparedStatement ps;



    // get all messages from different users
    public  static List<Message> getAllMessage(int user_id){
        List<Message> messageList = new ArrayList<>();

        try {
            con = DBUtil.getConnection();
//            String selectQuery = "SELECT * FROM message WHERE from_user = ? or to_user = ? AND chat_time IN (SELECT MAX(chat_time) FROM message GROUP by token) ORDER BY chat_time DESC";
            String selectQuery = "SELECT * FROM message where chat_time IN (SELECT MAX(chat_time) FROM message GROUP by token) and token in (select token from message where from_user = ? or to_user = ?) ORDER BY chat_time DESC";
            ps = con.prepareStatement(selectQuery);
            ps.setInt(1, user_id);
            ps.setInt(2, user_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                Message message = new Message();
                message.setChat_id(rs.getInt("chat_id"));
                message.setFrom_user(DBLoginDAO.getUserById(rs.getInt("from_user")));
                message.setTo_user(DBLoginDAO.getUserById(rs.getInt("to_user")));
                message.setMessage(rs.getString("message"));
                message.setChat_time(rs.getString("chat_time"));
                message.setToken(rs.getInt("token"));
                messageList.add(message);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return messageList;
    }


//    // get all messages between from_user and to_user
    public static List<Message> getMessageById(int fromUserID, int toUserID){
        List<Message> messageList = new ArrayList<>();
        ResultSet rs1 = null;
        try {
            con = DBUtil.getConnection();
            String selectQuery = "SELECT * FROM message WHERE (from_user = ? OR to_user = ?) AND (from_user = ? OR to_user = ?) ORDER BY chat_time";
            ps = con.prepareStatement(selectQuery);
            ps.setInt(1, fromUserID);
            ps.setInt(2, fromUserID);
            ps.setInt(3, toUserID);
            ps.setInt(4, toUserID);
            rs1 = ps.executeQuery();
            while (rs1.next()){
                Message message = new Message();
                message.setMessage(rs1.getString("message"));
                message.setChat_id(rs1.getInt("chat_id"));
                message.setFrom_user(DBLoginDAO.getUserById(rs1.getInt("from_user")));
                message.setTo_user(DBLoginDAO.getUserById(rs1.getInt("to_user")));
                message.setChat_time(rs1.getString("chat_time"));
                message.setToken(rs1.getInt("token"));
                messageList.add(message);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
//            try { if (rs1 != null) rs1.close(); } catch (Exception e) {};
//            try { if (ps != null) ps.close(); } catch (Exception e) {};
//            DBUtil.closeConnection(con);
        }
        return messageList;
    }

    // get all messages between from_user and to_user
    public static List<Message> getMessageByToken(int token){
        List<Message> messageList = new ArrayList<>();

        try {
            con = DBUtil.getConnection();
            String selectQuery = "SELECT * FROM message WHERE token = ? ORDER BY chat_time";
            ps = con.prepareStatement(selectQuery);
            ps.setInt(1, token);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Message message = new Message();
                message.setChat_id(rs.getInt("chat_id"));
                message.setFrom_user(DBLoginDAO.getUserById(rs.getInt("from_user")));
                message.setTo_user(DBLoginDAO.getUserById(rs.getInt("to_user")));
                message.setMessage(rs.getString("message"));
                message.setChat_time(rs.getString("chat_time"));
                message.setToken(rs.getInt("token"));
                messageList.add(message);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return messageList;
    }


    // insert message into DB
    public static int insertMessage(int fromUserID, int toUserID, String message, int token){
        int status = 0;
        try {
            con = DBUtil.getConnection();
            String insertQuery = "INSERT INTO message(from_user, to_user, message, token) VALUES (?,?,?,?)";
            ps = con.prepareStatement(insertQuery);
            ps.setInt(1, fromUserID);
            ps.setInt(2, toUserID);
            ps.setString(3, message);
            ps.setInt(4, token);
            status = ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return status;
    }


    public static String getRandomCode(){
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    //check token
    public static int getToken(int fromUserID, int toUserID){
        int token = 0;

        try {

            con = DBUtil.getConnection();
            String selectQuery = "select token from message  WHERE (from_user = ? OR to_user = ?) AND (from_user = ? OR to_user = ?)";
            ps = con.prepareStatement(selectQuery);
            ps.setInt(1, fromUserID);
            ps.setInt(2, fromUserID);
            ps.setInt(3, toUserID);
            ps.setInt(4, toUserID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                return rs.getInt("token");
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }

        return token;

    }


}
