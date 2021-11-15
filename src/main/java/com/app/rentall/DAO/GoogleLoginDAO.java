package com.app.rentall.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.app.rentall.DBUtil.DBUtil;
import com.app.rentall.Model.User;
public class GoogleLoginDAO {

    // check if user is present in database
    public static User checkUser(String email_id, String first_name, String last_name, String type){
        Connection conn = null;
        PreparedStatement ps;

        try {
            conn = DBUtil.getConnection();
            String selectQuery = "select * from user where email_id = ? and first_name = ? and last_name = ? and type = ?";
            ps = conn.prepareStatement(selectQuery);
            ps.setString(1, email_id);
            ps.setString(2, first_name);
            ps.setString(3, last_name);
            ps.setString(4, type);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                User user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setFirst_name(rs.getString("first_name"));
                user.setLast_name(rs.getString("last_name"));
                user.setEmail_id(rs.getString("email_id"));
                user.setType(rs.getString("type"));
                return  user;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }

        return null;

    }

    // insert record in database for first login attempt
    // add new user into database
    public static int insertUser(User user){
        Connection conn = null;
        PreparedStatement ps;
        int status = 0;
        try {
            conn = DBUtil.getConnection();
            String insertQuery = "insert into User (first_name, last_name, email_id, type) values (?, ?, ?, ?)";
            ps = conn.prepareStatement(insertQuery);
            ps.setString(1,user.getFirst_name());
            ps.setString(2,user.getLast_name());
            ps.setString(3,user.getEmail_id());
            ps.setString(4,user.getType());
            status = ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
        return status;
    }

    //get newly inserted user
    public static User getInsertedUser(){
        Connection conn = null;
        PreparedStatement ps;
        int max_user_id = -1;
        try {
            conn = DBUtil.getConnection();
            String getMaxIdQuery = "select max(user_id) from user";
            ps = conn.prepareStatement(getMaxIdQuery);
            ResultSet rs1 = ps.executeQuery();
            if (rs1.next()){
                max_user_id = rs1.getInt("max(user_id)");
                System.out.println("last user id for google login: "+ max_user_id);
            }

            String selectUserQuery = "select * from user where user_id = ?";
            ps = conn.prepareStatement(selectUserQuery);
            ps.setInt(1,max_user_id);
            ResultSet rs2 = ps.executeQuery();
            if (rs2.next()){
                User user = new User();
                user.setUser_id(rs2.getInt("user_id"));
                user.setFirst_name(rs2.getString("first_name"));
                user.setLast_name(rs2.getString("last_name"));
                user.setEmail_id(rs2.getString("email_id"));
                user.setType(rs2.getString("type"));
                return  user;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }

        return null;
    }
}
