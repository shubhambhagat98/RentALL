package com.app.rentall.DBUtil;
import java.net.URI;
import java.sql.*;

public class DBUtil {

    // create and return connection object
    public  static Connection getConnection(){
        Connection con = null;
        try {
            //Driver class loader
            Class.forName("com.mysql.cj.jdbc.Driver");
//            String dbUrl = "jdbc:mysql://localhost:3306/rentall";
//            String username = "root";
//            String password = "Shivoham@8089";
//            System.out.println(System.getenv("CLEARDB_DATABASE_URL"));
            URI dbUri = new URI(System.getenv("CLEARDB_DATABASE_URL"));
            System.out.println("dburl"+dbUri);
            String username = dbUri.getUserInfo().split(":")[0];
            String password = dbUri.getUserInfo().split(":")[1];
            String dbUrl = "jdbc:mysql://" + dbUri.getHost() + dbUri.getPath();

            //create connection
                con = DriverManager.getConnection(dbUrl, username, password);
//            con = DriverManager.getConnection(dbUrl, username, password);
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

