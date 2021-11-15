package com.app.rentall.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.app.rentall.DBUtil.DBUtil;
import com.app.rentall.Model.User;

public class DBLoginDAO {

    // add new user into database
    public static int insertUser(User user){
        Connection conn = null;
        PreparedStatement ps;
        int status = 0;
        try {
            conn = DBUtil.getConnection();
            String insertQuery = "insert into User (first_name, last_name, email_id, password, contact, security_1, security_2, security_3, type) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(insertQuery);
            ps.setString(1,user.getFirst_name());
            ps.setString(2,user.getLast_name());
            ps.setString(3,user.getEmail_id());
            ps.setString(4,user.getPassword());
            ps.setLong(5,user.getContact());
            ps.setString(6,user.getSecurity_1());
            ps.setString(7,user.getSecurity_2());
            ps.setString(8,user.getSecurity_3());
            ps.setString(9,user.getType());
            status = ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
        return status;
    }

    // check user in database
    public static User isValidUser(String email_id, String password){
        Connection conn = null;
        PreparedStatement ps;
        try{
            conn = DBUtil.getConnection();
            String selectQuery = "select * from user where email_id = ? and password = ?";
            ps = conn.prepareStatement(selectQuery);
            ps.setString(1, email_id);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("user_id"),rs.getString("first_name"),rs.getString("last_name"),rs.getString("email_id"),rs.getLong("contact"), rs.getString("type"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }

        return  null;
    }

    //check security
    public static int checkSecurity(String email_id, String security_1,String security_2,String security_3 ){
        int user_id = -1;
        Connection conn = null;
        PreparedStatement ps;
        try{
            conn = DBUtil.getConnection();
            String selectQuery = "select user_id from user where email_id = ? and security_1 = ? and security_2 = ? and security_3 = ?";
            ps = conn.prepareStatement(selectQuery);
            ps.setString(1,email_id);
            ps.setString(2,security_1);
            ps.setString(3,security_2);
            ps.setString(4,security_3);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                user_id = rs.getInt("user_id");
                return user_id;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
        return user_id;
    }



    // update user password
    public static int updatePassword(int user_id, String new_password){
        int status = 0;
        Connection conn = null;
        PreparedStatement ps;
        try {
            conn = DBUtil.getConnection();
            String updateQuery = "update user set password = ? where user_id = ? ";
            ps = conn.prepareStatement(updateQuery);
            ps.setString(1,new_password);
            ps.setInt(2,user_id);
            status = ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
        return status;
    }


    // get user by id
    public static User getUserById(int user_id){
        Connection conn = null;
        PreparedStatement ps;
        try{
            conn = DBUtil.getConnection();
            String selectQuery = "select * from user where user_id = ?";
            ps = conn.prepareStatement(selectQuery);
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("user_id"),rs.getString("first_name"),rs.getString("last_name"),rs.getString("email_id"),rs.getLong("contact"), rs.getString("type"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }

        return  null;
    }


}
