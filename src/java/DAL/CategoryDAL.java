/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class CategoryDAL extends DBContext implements IGenericDAL<Category> {
    //Khai báo các thành phần xử lý Db

    Connection cnn; //Kết nối đến db
    //Kết nối đến Database
    PreparedStatement pstm;
    ResultSet rs;

    public CategoryDAL() {
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

    @Override
    public ArrayList<Category> findAll() {
        PreparedStatement pstm;
        ResultSet rs;
        ArrayList<Category> result = new ArrayList<>();
        try {
            String sql = "select * from Categories";
            pstm = cnn.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int categoryId = rs.getInt(1);
                String CategoryName = rs.getString(2);
                result.add(new Category(categoryId, CategoryName));
            }
        } catch (SQLException ex) {
            System.out.println("find All Category: " + ex.getMessage());
        }
        return result;
    }

    @Override
    public boolean create(Category entity) {
        try {
            String sql = "insert into Categories(CategoryName) values(?)";
            pstm = cnn.prepareStatement(sql);
            pstm.setString(1,entity.getCategoryName());
            pstm.execute();
            return true;
        } catch (SQLException ex) {
            System.out.println("create Category: " + ex.getMessage());
        }
        return false;
    }

    @Override
    public boolean update(Category entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(Category entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
