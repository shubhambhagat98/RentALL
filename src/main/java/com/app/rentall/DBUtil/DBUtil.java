package com.app.rentall.DBUtil;
import java.sql.*;

public class DBUtil {

    // create and return connection object
    public  static Connection getConnection(){
        Connection con = null;
        try {
            //Driver class loader
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/rentall";
            String username = "root";
            String password = "Shivoham@8089";

            //create connection
            con = DriverManager.getConnection(url, username, password);
//            System.out.println("Connection established!!");

        }catch (Exception e){
            e.printStackTrace();
        }
        return con;
    }


    //close connection
    public static void closeConnection(Connection con){
        try {
            con.close();
        }catch (Exception e){
            e.printStackTrace();
        }

    }

}

