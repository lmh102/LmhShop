/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import DTO.CommentDTO;
import Model.Comment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class CommentDAL extends DBContext implements IGenericDAL<Comment> {

    //Khai báo các thành phần xử lý Db
    Connection cnn; //Kết nối đến db
    //Kết nối đến Database
    PreparedStatement pstm;
    ResultSet rs;

    public CommentDAL() {
        connect();
    }

    private void connect() {
        cnn = super.connection;
        if (cnn != null) {
            System.out.println("Connect success");
        } else {
            System.out.println("Conenct fail");
        }
    }

    public ArrayList<String> findAllImageByCommentId(int commentId) {
        PreparedStatement pstm;
        ResultSet rs;
        ArrayList<String> listImage = new ArrayList<>();
        try {
            String sql = "select Image from CommentImage where CommentId = ?";
            pstm = cnn.prepareStatement(sql);
            pstm.setInt(1, commentId);
            rs = pstm.executeQuery();
            while (rs.next()) {
                listImage.add(rs.getString(1));
            }
            return listImage;
        } catch (SQLException ex) {
            System.out.println("findAllImageByCommentId: " + ex.getMessage());
        }
        return null;
    }

    @Override
    public ArrayList<Comment> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<CommentDTO> getAllCommentByProductId(int productId) {
        PreparedStatement pstm;
        ResultSet rs;
        ProductDAL _productService = new ProductDAL();
        UserDAL _userService = new UserDAL();
        ArrayList<CommentDTO> comments = new ArrayList<>();
        String query = "SELECT * FROM Comment where productId = ? and status = 1";
        try {
            pstm = cnn.prepareStatement(query);
            pstm.setInt(1, productId);
            rs = pstm.executeQuery();
            while (rs.next()) {
                CommentDTO comment = new CommentDTO();
                comment.setCommentId(rs.getInt("CommentId"));
                comment.setUserId(rs.getInt("UserId"));
                comment.setProductId(rs.getInt("ProductId"));
                comment.setStatus(rs.getInt("status"));
                comment.setContent(rs.getString("content"));
                comment.setCreateAt(rs.getDate("CreateAt"));
                comment.setUpdateAt(rs.getDate("UpdateAt"));
                comment.setDeleteAt(rs.getDate("DeleteAt"));
                comment.setImage(findAllImageByCommentId(comment.getCommentId()));
                comment.setRate(_productService.getVote(comment.getUserId(), productId));
                comment.setUser(_userService.getUserById(comment.getUserId()));
                comments.add(comment);
            }
        } catch (SQLException e) {
            System.out.println("getAllCommentByProductId: " + e.getMessage());
        }
        System.out.println(comments.size());
        return comments;
    }

    @Override
    public boolean create(Comment entity) {
        PreparedStatement pstm;
        ResultSet rs;
        entity.setCreateAt(new java.sql.Date(System.currentTimeMillis()));
        entity.setStatus(1);
        try {
            String query = "INSERT INTO comment (UserId, ProductId, status, content, CreateAt, UpdateAt, DeleteAt) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pstm = cnn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            pstm.setInt(1, entity.getUserId());
            pstm.setInt(2, entity.getProductId());
            pstm.setInt(3, entity.getStatus());
            pstm.setString(4, entity.getContent());
            pstm.setDate(5, entity.getCreateAt());
            pstm.setDate(6, entity.getUpdateAt());
            pstm.setDate(7, entity.getDeleteAt());
            int rows = pstm.executeUpdate();
            if (rows > 0) {
                ResultSet generatedKeys = pstm.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int generatedId = generatedKeys.getInt(1);
                    System.out.println("Inserted element ID: " + generatedId);
                }

            }
            return true;
        } catch (SQLException e) {
            System.out.println("create comemnt: " + e.getMessage());
        }
        return false;
    }

    public int saveComment(Comment entity) {
        PreparedStatement pstm;
        ResultSet rs;
        entity.setCreateAt(new java.sql.Date(Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant()).getTime()));
        entity.setStatus(1);
        try {
            String query = "INSERT INTO comment (UserId, ProductId, status, content, CreateAt, UpdateAt, DeleteAt) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pstm = cnn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            pstm.setInt(1, entity.getUserId());
            pstm.setInt(2, entity.getProductId());
            pstm.setInt(3, entity.getStatus());
            pstm.setString(4, entity.getContent());
            pstm.setDate(5, entity.getCreateAt());
            pstm.setDate(6, entity.getUpdateAt());
            pstm.setDate(7, entity.getDeleteAt());
            int rows = pstm.executeUpdate();
            if (rows > 0) {
                ResultSet generatedKeys = pstm.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int generatedId = generatedKeys.getInt(1);
                    return generatedId;
                }

            }
        } catch (SQLException e) {
            System.out.println("create comemnt: " + e.getMessage());
        }
        return -1;
    }

    public void saveImage(int commentId, List<String> listPath) {

        PreparedStatement pstm;
        ResultSet rs;
        for (String filePath : listPath) {
            try {
                String sql = "Insert into CommentImage(CommentId,Image) values(?,?)";
                pstm = cnn.prepareStatement(sql);
                pstm.setInt(1, commentId);
                pstm.setString(2, filePath);
                pstm.executeUpdate();
            } catch (SQLException e) {
                System.out.println("saveImage: " + e.getMessage());
            }
        }
    }

    public boolean isVoted(int userId, int productId) {

        PreparedStatement pstm;
        ResultSet rs;
        try {
            String sql = "select * from Ratings where userID = ? and productId = ?";
            pstm = cnn.prepareStatement(sql);
            pstm.setInt(1, userId);
            pstm.setInt(2, productId);
            rs = pstm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println("isVote: " + ex.getMessage());
        }
        return false;
    }

    public void saveVote(int userId, int productId, int vote) {
        PreparedStatement pstm;
        ResultSet rs;
        try {
            String sql;
            if (isVoted(userId, productId)) {
                sql = "Update Ratings "
                        + "set Rating = ? "
                        + "where UserID = ? and ProductID = ?";
            } else {
                sql = "insert into Ratings(Rating,UserID,ProductID) "
                        + "values(?,?,?)";
            }
            pstm = cnn.prepareStatement(sql);
            pstm.setInt(1, vote);
            pstm.setInt(2, userId);
            pstm.setInt(3, productId);
            pstm.execute();
        } catch (SQLException ex) {
            System.out.println("saveVote: " + ex.getMessage());
        }
    }

    @Override
    public boolean update(Comment entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(Comment entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public boolean delete(int commentId) {
        java.sql.Date DeleteAt = new java.sql.Date(System.currentTimeMillis());
        try {
            String sql = "Update Comment "
                    + "set status = 2 , deleteAt = ? "
                    + "where CommentId = ?";
            PreparedStatement pstm = cnn.prepareStatement(sql);
            pstm.setDate(1, DeleteAt);
            pstm.setInt(2, commentId);
            pstm.execute();
            
            // Xóa comment
            return true;
        } catch (SQLException ex) {
            System.out.println("Delete comment : " + ex.getMessage());
        }
        return false;
    }
}
