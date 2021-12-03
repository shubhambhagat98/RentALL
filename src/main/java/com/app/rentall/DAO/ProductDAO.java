package com.app.rentall.DAO;

import com.app.rentall.DBUtil.DBUtil;
import com.app.rentall.Model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class ProductDAO {

    static Connection con = null;
    static PreparedStatement ps;

    //---------------------------------method related to product-----------------------------------

    // return list of not-approved products
    public static List<Product> getNotApprovedProducts(){
        List<Product> productList = new ArrayList<Product>();
        try {
            con = DBUtil.getConnection();
            String selectQuery = "select * from product where prod_status = 'Not Approved' ";
            ps = con.prepareStatement(selectQuery);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Product product = new Product();
                product.setProd_id(rs.getInt("prod_id"));
                product.setProd_title(rs.getString("prod_title"));
                product.setProd_description(rs.getString("prod_description"));
                product.setProd_category(rs.getString("prod_category"));
                product.setProd_duration(rs.getString("prod_duration"));
                product.setProd_price(rs.getInt("prod_price"));
                product.setProd_street_address(rs.getString("prod_street_address"));
                product.setProd_city(rs.getString("prod_city"));
                product.setProd_state(rs.getString("prod_state"));
                product.setProd_pincode(rs.getInt("prod_pincode"));
                product.setProd_status(rs.getString("prod_status"));
                product.setUser_id(rs.getInt("user_id"));
                product.setProd_firstImage(getFirstImage(rs.getInt("prod_id")));
                product.setProd_rating(getAverageRating(rs.getInt("prod_id")));
                productList.add(product);

            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return productList;
    }

    // return list of approved products
    public static List<Product> getApprovedProducts(){
        List<Product> productList = new ArrayList<Product>();
        try {
            con = DBUtil.getConnection();
            String selectQuery = "select * from product where prod_status = 'Available' ";
            ps = con.prepareStatement(selectQuery);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Product product = new Product();
                product.setProd_id(rs.getInt("prod_id"));
                product.setProd_title(rs.getString("prod_title"));
                product.setProd_description(rs.getString("prod_description"));
                product.setProd_category(rs.getString("prod_category"));
                product.setProd_duration(rs.getString("prod_duration"));
                product.setProd_price(rs.getInt("prod_price"));
                product.setProd_street_address(rs.getString("prod_street_address"));
                product.setProd_city(rs.getString("prod_city"));
                product.setProd_state(rs.getString("prod_state"));
                product.setProd_pincode(rs.getInt("prod_pincode"));
                product.setProd_status(rs.getString("prod_status"));
                product.setUser_id(rs.getInt("user_id"));
                product.setProd_firstImage(getFirstImage(rs.getInt("prod_id")));
                product.setProd_rating(getAverageRating(rs.getInt("prod_id")));
                productList.add(product);

            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return productList;
    }


    //get products based on category
    public static List<Product> getProductsByCategory(String category){
        List<Product> productList = new ArrayList<Product>();
        try {
            con = DBUtil.getConnection();
            String selectQuery = "select * from product where prod_status = 'Available' and prod_category = ?";
            ps = con.prepareStatement(selectQuery);
            ps.setString(1, category);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Product product = new Product();
                product.setProd_id(rs.getInt("prod_id"));
                product.setProd_title(rs.getString("prod_title"));
                product.setProd_description(rs.getString("prod_description"));
                product.setProd_category(rs.getString("prod_category"));
                product.setProd_duration(rs.getString("prod_duration"));
                product.setProd_price(rs.getInt("prod_price"));
                product.setProd_street_address(rs.getString("prod_street_address"));
                product.setProd_city(rs.getString("prod_city"));
                product.setProd_state(rs.getString("prod_state"));
                product.setProd_pincode(rs.getInt("prod_pincode"));
                product.setProd_status(rs.getString("prod_status"));
                product.setUser_id(rs.getInt("user_id"));
                product.setProd_firstImage(getFirstImage(rs.getInt("prod_id")));
                product.setProd_rating(getAverageRating(rs.getInt("prod_id")));
                productList.add(product);

            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return productList;
    }

    // get products based on keyword
    public static List<Product> getProductsByKeyword(String keyword){
        List<Product> productList = new ArrayList<Product>();
        try {
            con = DBUtil.getConnection();
            String selectQuery = "select * from product where prod_status = 'Available' and (prod_category like ? or prod_title like ? or prod_description like ?)" ;
            ps = con.prepareStatement(selectQuery);
            ps.setString(1, "%"+keyword+"%");
            ps.setString(2, "%"+keyword+"%");
            ps.setString(3, "%"+keyword+"%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Product product = new Product();
                product.setProd_id(rs.getInt("prod_id"));
                product.setProd_title(rs.getString("prod_title"));
                product.setProd_description(rs.getString("prod_description"));
                product.setProd_category(rs.getString("prod_category"));
                product.setProd_duration(rs.getString("prod_duration"));
                product.setProd_price(rs.getInt("prod_price"));
                product.setProd_street_address(rs.getString("prod_street_address"));
                product.setProd_city(rs.getString("prod_city"));
                product.setProd_state(rs.getString("prod_state"));
                product.setProd_pincode(rs.getInt("prod_pincode"));
                product.setProd_status(rs.getString("prod_status"));
                product.setUser_id(rs.getInt("user_id"));
                product.setProd_firstImage(getFirstImage(rs.getInt("prod_id")));
                product.setProd_rating(getAverageRating(rs.getInt("prod_id")));
                productList.add(product);

            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return productList;
    }


    //get product list based on user id
    public static List<Product> getProductsByUserId(String user_id){
        List<Product> productList = new ArrayList<Product>();
        try {
            con = DBUtil.getConnection();
            String selectQuery = "select * from product where user_id = ?";
            ps = con.prepareStatement(selectQuery);
            ps.setInt(1, Integer.parseInt(user_id));
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Product product = new Product();
                product.setProd_id(rs.getInt("prod_id"));
                product.setProd_title(rs.getString("prod_title"));
                product.setProd_description(rs.getString("prod_description"));
                product.setProd_category(rs.getString("prod_category"));
                product.setProd_duration(rs.getString("prod_duration"));
                product.setProd_price(rs.getInt("prod_price"));
                product.setProd_street_address(rs.getString("prod_street_address"));
                product.setProd_city(rs.getString("prod_city"));
                product.setProd_state(rs.getString("prod_state"));
                product.setProd_pincode(rs.getInt("prod_pincode"));
                product.setProd_status(rs.getString("prod_status"));
                product.setUser_id(rs.getInt("user_id"));
                product.setProd_firstImage(getFirstImage(rs.getInt("prod_id")));
                product.setProd_rating(getAverageRating(rs.getInt("prod_id")));
                productList.add(product);

            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return productList;
    }



    // return product based on product id
    public static Product getProductById(int productId){
        Product product = null;
        try {
            con = DBUtil.getConnection();
            String selectQuery = "select * from product where prod_id = ?";
            ps = con.prepareStatement(selectQuery);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                product = new Product();
                product.setProd_id(rs.getInt("prod_id"));
                product.setProd_title(rs.getString("prod_title"));
                product.setProd_description(rs.getString("prod_description"));
                product.setProd_category(rs.getString("prod_category"));
                product.setProd_price(rs.getInt("prod_price"));
                product.setProd_duration(rs.getString("prod_duration"));
                product.setProd_street_address(rs.getString("prod_street_address"));
                product.setProd_city(rs.getString("prod_city"));
                product.setProd_state(rs.getString("prod_state"));
                product.setProd_pincode(rs.getInt("prod_pincode"));
                product.setProd_status(rs.getString("prod_status"));
                product.setUser_id(rs.getInt("user_id"));
                product.setProd_firstImage(getFirstImage(rs.getInt("prod_id")));
                product.setProd_rating(getAverageRating(rs.getInt("prod_id")));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return product;
    }


    // add product in DB
    public  static int addProduct(Product product){
        int status = 0;
        try {
            con = DBUtil.getConnection();
            String insertQuery = "insert into product (prod_title, prod_description, prod_category, prod_price, prod_duration, prod_street_address, prod_city, prod_state, prod_pincode, prod_status, user_id ) values (?,?,?,?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(insertQuery);
            ps.setString(1,product.getProd_title());
            ps.setString(2, product.getProd_description());
            ps.setString(3, product.getProd_category());
            ps.setInt(4, product.getProd_price());
            ps.setString(5, product.getProd_duration());
            ps.setString(6, product.getProd_street_address());
            ps.setString(7, product.getProd_city());
            ps.setString(8, product.getProd_state());
            ps.setInt(9, product.getProd_pincode());
            ps.setString(10, product.getProd_status());
            ps.setInt(11, product.getUser_id());
            status = ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return status;
    }

    //delete product
    public static int deleteProduct(int productId){
        int status = 0;
        try {
            con = DBUtil.getConnection();
            String deleteQuery = "DELETE FROM product where prod_id = ?";
            ps = con.prepareStatement(deleteQuery);
            ps.setInt(1, productId);
            status = ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return status;
    }

    // update product status
    public static int updateProductStatus(int prod_id, String prod_status){
        int status = 0;

        try {
            con = DBUtil.getConnection();
            String updateQuery = "UPDATE product SET prod_status = ? WHERE prod_id=?";
            ps = con.prepareStatement(updateQuery);
            ps.setString(1, prod_status);
            ps.setInt(2,prod_id);
            status = ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return status;
    }





    // ----------------------------------------methods related to product image----------------------------------------------

    // add image name into the database
    public  static int addImage(String image_name) {
        int status = 0;
        int productId = 0;
        try {
            con = DBUtil.getConnection();
            String selectMaxId = "select max(prod_id) from product";
            ps = con.prepareStatement(selectMaxId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                productId = rs.getInt("max(prod_id)");
                System.out.println("last product id: " + productId);
            }
            String insertQuery = " insert into image(image_name, prod_id) values(?,?)";
            ps = con.prepareStatement(insertQuery);
            ps.setString(1, image_name);
            ps.setInt(2, productId);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(con);
        }
        return status;
    }


    //delete image from database
    public static int deleteImage(int productId){
        int imageStatus = 0;
        try {
            con = DBUtil.getConnection();
            String deleteQuery = "DELETE FROM image where prod_id = ?";
            ps = con.prepareStatement(deleteQuery);
            ps.setInt(1, productId);
            imageStatus = ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return imageStatus;
    }


    // get first name
    public static String getFirstImage(int productId){
        String name = null;
        try {
            con = DBUtil.getConnection();
            String selectQuery = "select image_name from image where prod_id = ? limit 1";
            ps = con.prepareStatement(selectQuery);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                name = rs.getString("image_name");
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return name;
    }

    // get image name from database
    public static List<String> getAllImages(int productId){
        List<String> imageFileList = new ArrayList<>();
        try {
            con = DBUtil.getConnection();
            String selectQuery = "select image_name from image where prod_id = ?";
            ps = con.prepareStatement(selectQuery);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                imageFileList.add(rs.getString("image_name"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return imageFileList;
    }





    // ---------------------------------methods related to rented product------------------------------

    // return list of rented products
    public static List<Product> getRentedProducts(int user_id){
        List<Product> productList = new ArrayList<Product>();
        try {
            con = DBUtil.getConnection();
            String selectQuery = "select * from product where prod_status = 'Rented' and prod_id in (select prod_id from rented_products where user_id = ? and status = 'open')";
            ps = con.prepareStatement(selectQuery);
            ps.setInt(1,user_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Product product = new Product();
                product.setProd_id(rs.getInt("prod_id"));
                product.setProd_title(rs.getString("prod_title"));
                product.setProd_description(rs.getString("prod_description"));
                product.setProd_category(rs.getString("prod_category"));
                product.setProd_price(rs.getInt("prod_price"));
                product.setProd_duration(rs.getString("prod_duration"));
                product.setProd_street_address(rs.getString("prod_street_address"));
                product.setProd_city(rs.getString("prod_city"));
                product.setProd_state(rs.getString("prod_state"));
                product.setProd_pincode(rs.getInt("prod_pincode"));
                product.setProd_status(rs.getString("prod_status"));
                product.setUser_id(rs.getInt("user_id"));
                product.setProd_firstImage(getFirstImage(rs.getInt("prod_id")));
                product.setProd_rating(getAverageRating(rs.getInt("prod_id")));
                System.out.println(product);
                productList.add(product);

            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return productList;
    }



    //get rented product details
    public static RentedProduct getRentedProductDetails(int prod_id){

        try {
            con = DBUtil.getConnection();
            String selectQuery = "select * from rented_products where prod_id = ? and status = 'open'";
            ps = con.prepareStatement(selectQuery);
            ps.setInt(1, prod_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                return new RentedProduct(rs.getInt("prod_id"), rs.getInt("user_id"), rs.getString("start_date"), rs.getString("end_date"), rs.getFloat("total_cost"), rs.getString("status"));

            }

        }catch(Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return null;
    }


    // rent a product
    public static int rentProduct(RentedProduct rentedProduct){
        int status = 0;
        try {
            con = DBUtil.getConnection();
            String insertQuery = "insert into rented_products (prod_id, user_id, start_date, end_date, total_cost, status) values (?,?,?,?,?,?)";
            ps = con.prepareStatement(insertQuery);
            ps.setInt(1,rentedProduct.getProd_id());
            ps.setInt(2, rentedProduct.getUser_id());
            ps.setString(3, rentedProduct.getStart_date());
            ps.setString(4, rentedProduct.getEnd_date());
            ps.setFloat(5, rentedProduct.getTotal_cost());
            ps.setString(6, rentedProduct.getStatus());
            status = ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return status;
    }


    //update rent status
    public static int updateRentedProductStatus(int prod_id, int user_id, String prod_status){
        int status = 0;
        try {
            con = DBUtil.getConnection();
            String updateQuery = "update rented_products set status = ? where prod_id = ? and user_id = ?";
            ps = con.prepareStatement(updateQuery);
            ps.setString(1, prod_status);
            ps.setInt(2, prod_id);
            ps.setInt(3, user_id);
            status = ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }

        return status;
    }

    // delete product from rented list

    public static int deleteRentedProduct(int productId){
        int status = 0;
        try {
            con = DBUtil.getConnection();
            String deleteQuery = "DELETE FROM rented_products where prod_id = ?";
            ps = con.prepareStatement(deleteQuery);
            ps.setInt(1, productId);
            status = ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return status;
    }






    // ---------------------------------methods related to reviews------------------------------

    // get average rating for a product
    public static float getAverageRating(int product_id){
        float rating = 0;
        try{
            con = DBUtil.getConnection();
            String selectQuery = "select AVG(review_rating) 'average_rating' from review where prod_id = ?";
            ps = con.prepareStatement(selectQuery);
            ps.setInt(1, product_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                rating = rs.getFloat("average_rating");
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }

        return rating;
    }


    // get all reviews
    public static List<Review> getAllReviews(int product_id){
        List<Review> reviewList = new ArrayList<>();

        try{
            con = DBUtil.getConnection();
            String selectQuery = "select * from review where prod_id = ?";
            ps = con.prepareStatement(selectQuery);
            ps.setInt(1, product_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Review review = new Review(rs.getInt("review_id"), rs.getString("review_title"), rs.getString("review_description"),rs.getInt("review_rating"), rs.getString("review_date"),  rs.getInt("prod_id"), rs.getString("reviewer_name"));
                reviewList.add(review);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }

        return reviewList;
    }

        // add review
    public static int addReview(Review review){
        int status = 0;
        try {
            con = DBUtil.getConnection();
            String insertQuery = "insert into review (review_title, review_description, review_date, review_rating, reviewer_name,prod_id ) values (?,?,?,?,?,?)";
            ps = con.prepareStatement(insertQuery);
            ps.setString(1,review.getReview_title());
            ps.setString(2, review.getReview_description());
            ps.setString(3, review.getReview_date());
            ps.setInt( 4, review.getReview_rating());
            ps.setString(5, review.getReviewer_name());
            ps.setInt(6, review.getProduct_id());

            status = ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return status;
    }

    // add complaint
    public static int addComplaint(Complaint complaint){
        int status = 0;
        try {
            con = DBUtil.getConnection();
            String insertQuery = "insert into complaints (renter_id, seller_id, product_id, description, date) values (?,?,?,?,?)";
            ps = con.prepareStatement(insertQuery);
            ps.setInt(1,complaint.getRenter().getUser_id());
            ps.setInt(2,complaint.getSeller().getUser_id());
            ps.setInt(3, complaint.getProduct().getProd_id());
            ps.setString( 4, complaint.getDescription());
            ps.setString(5, complaint.getDate());
            status = ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return status;
    }




    // Get all complaints
    public static List<Complaint> getAllComplaints(){
        List<Complaint> complaints = new ArrayList<>();

        try{
            con = DBUtil.getConnection();
            String selectQuery = "select * from complaints";
            ps = con.prepareStatement(selectQuery);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                User renter = DBLoginDAO.getUserById(rs.getInt("renter_id"));
                User seller = DBLoginDAO.getUserById(rs.getInt("seller_id"));
                Product product = ProductDAO.getProductById(rs.getInt("product_id"));
                String description = rs.getString("description");
                String date = rs.getString("date");
                Complaint complaint = new Complaint(renter, seller,description,  date, product);
                complaints.add(complaint);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }

        return complaints;
    }




    //---------------------------------product filter--------------------------------------------------
    public static List<Product> filterProducts(String category, String keyword, String state, String city, String rating, int minPrice, int maxPrice, String sortBy)  {
        List<Product> productList = new ArrayList<Product>();

        try {
            con = DBUtil.getConnection();
            String selectQuery = "select * from product where prod_status = 'Available'";


            if (!category.equals("allProducts") && !category.equals("")){
                selectQuery += " and prod_category = ?";
            } else if (!keyword.equals("")){
                selectQuery += " and prod_category like ? or prod_title like ? or prod_description like ?";
            }

            if (!state.equals("")){
                selectQuery += " and prod_state = ?";
            }

            if (city != null && !city.equals("") ){
                selectQuery += " and prod_city = ?";
            }


            selectQuery += " and prod_price between ? and ?";


            if (rating != null){
                selectQuery += " and prod_id in (select prod_id from review where review_rating >= ?)";
            }

            if (sortBy.equals("lowToHigh")){
                selectQuery += " order by prod_price ASC";
            } else if (sortBy.equals("highToLow")){
                selectQuery += " order by prod_price DESC";
            }

            System.out.println(selectQuery);

            int count = 1;
            ps = con.prepareStatement(selectQuery);

            if (!category.equals("allProducts") && !category.equals("")){
                ps.setString(count,category);
                count += 1;
            } else if (!keyword.equals("")){
               ps.setString(count, "%"+keyword+"%");
               count +=1 ;
               ps.setString(count, "%"+keyword+"%");
               count +=1 ;
               ps.setString(count, "%"+keyword+"%");
               count +=1 ;
            }

            if (!state.equals("")  ){
                ps.setString(count, state);
                count += 1;
            }

            if (city != null && !city.equals("")){
                ps.setString(count, city);
                count +=1 ;
            }


            ps.setInt(count, minPrice);
            count += 1;

            ps.setInt(count, maxPrice);
                count += 1;


            if (rating != null){
                ps.setInt(count, Integer.parseInt(rating));

            }

            System.out.println(ps);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProd_id(rs.getInt("prod_id"));
                product.setProd_title(rs.getString("prod_title"));
                product.setProd_description(rs.getString("prod_description"));
                product.setProd_category(rs.getString("prod_category"));
                product.setProd_duration(rs.getString("prod_duration"));
                product.setProd_price(rs.getInt("prod_price"));
                product.setProd_street_address(rs.getString("prod_street_address"));
                product.setProd_city(rs.getString("prod_city"));
                product.setProd_state(rs.getString("prod_state"));
                product.setProd_pincode(rs.getInt("prod_pincode"));
                product.setProd_status(rs.getString("prod_status"));
                product.setUser_id(rs.getInt("user_id"));
                product.setProd_firstImage(getFirstImage(rs.getInt("prod_id")));
                product.setProd_rating(getAverageRating(rs.getInt("prod_id")));
                productList.add(product);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(con);
        }
        return productList;



    }

}



