/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import DTO.ProductDTO;
import DTO.RateDTO;
import Model.Category;
import Model.Product;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class ProductDAL extends DBContext implements IGenericDAL<Product> {

    Connection cnn; //Kết nối đến db
    //Kết nối đến Database
    PreparedStatement pstm;
    ResultSet rs;

    public ProductDAL() {
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

    public void updateDiscount(ArrayList<Integer> listId, int discount) {
        for (int id : listId) {
            try {
                PreparedStatement pstm;
                ResultSet rs;
                String sql = "update product set Discount = ? where ProductID = ?";
                pstm = cnn.prepareStatement(sql);
                pstm.setInt(1, discount);
                pstm.setInt(2, id);
                pstm.execute();
            } catch (SQLException ex) {
                System.out.println("updateDiscount: " + ex.getMessage());
            }
        }
    }

    public void clearDiscount() {
        try {
            PreparedStatement pstm;
            ResultSet rs;
            String sql = "update product set Discount = 0";
            pstm = cnn.prepareStatement(sql);
            pstm.execute();
        } catch (SQLException ex) {
        }
    }

    public RateDTO getRateByProductId(int productId) {
        PreparedStatement pstm;
        ResultSet rs;
        RateDTO rate = new RateDTO();
        try {
            String sql = "select avg(r.Rating), count(r.Rating) from Ratings r where ProductID = ?";
            pstm = cnn.prepareStatement(sql);
            pstm.setInt(1, productId);
            rs = pstm.executeQuery();
            if (rs.next()) {
                rate.avgRate = rs.getInt(1);
                rate.countRate = rs.getInt(2);
                return rate;
            }
        } catch (SQLException ex) {
            System.out.println("getAvgRateByProductId: " + ex.getMessage());
        }
        return null;
    }

    public int getVote(int userId, int productId) {
        PreparedStatement pstm;
        ResultSet rs;
        int vote = 0;
        try {
            String sql = "select Rating from Ratings where UserID = ? and ProductID = ?";
            pstm = cnn.prepareStatement(sql);
            pstm.setInt(1, userId);
            pstm.setInt(2, productId);
            rs = pstm.executeQuery();
            if (rs.next()) {
                vote = rs.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println("getVote: " + ex.getMessage());
        }
        return vote;
    }

    public ArrayList<String> getImageDetail(int productId) {
        PreparedStatement pstm;
        ResultSet rs;
        ArrayList<String> listImage = new ArrayList<>();
        try {
            String sql = "select image from ImageDetail where productId = ?";
            pstm = cnn.prepareStatement(sql);
            pstm.setInt(1, productId);
            rs = pstm.executeQuery();
            while (rs.next()) {
                listImage.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            System.out.println("getImageDetail: " + ex.getMessage());
        }
        return listImage;
    }

    public ArrayList<ProductDTO> getAllProductByKeyword(String keyword) {
        PreparedStatement pstm;
        ResultSet rs;
        ArrayList<ProductDTO> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM product WHERE  status = 1";
            pstm = cnn.prepareStatement(query);
            ProductDTO product = new ProductDTO();
            // Thực thi câu truy vấn
            rs = pstm.executeQuery();
            // Xử lý kết quả truy vấn
            while (rs.next()) {
                product = new ProductDTO();
                product.setProductId(rs.getInt("productId"));
                product.setCategoryId(rs.getInt("categoryId"));
                product.setStatus(rs.getInt("status"));
                product.setDiscount(rs.getInt("discount"));
                product.setQuantity(rs.getInt("quantity"));
                product.setProductName(rs.getString("productName"));
                product.setImage(rs.getString("image"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setCreateAt(rs.getDate("CreateAt"));
                product.setUpdateAt(rs.getDate("UpdateAt"));
                product.setDeleteAt(rs.getDate("DeleteAt"));
                if (!product.getProductName().contains(keyword)) {
                    continue;
                }
                RateDTO rate = getRateByProductId(product.getProductId());
                product.setAvgRate(rate.getAvgRate());
                product.setCountRate(rate.getCountRate());
                list.add(product);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("findProductById: " + ex.getMessage());
        }
        return list;
    }

    public ArrayList<ProductDTO> getAllProduct() {
        PreparedStatement pstm;
        ResultSet rs;
        ArrayList<ProductDTO> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM product WHERE  status = 1";
            pstm = cnn.prepareStatement(query);
            ProductDTO product = new ProductDTO();
            // Thực thi câu truy vấn
            rs = pstm.executeQuery();
            // Xử lý kết quả truy vấn
            while (rs.next()) {
                product = new ProductDTO();
                product.setProductId(rs.getInt("productId"));
                product.setCategoryId(rs.getInt("categoryId"));
                product.setStatus(rs.getInt("status"));
                product.setDiscount(rs.getInt("discount"));
                product.setQuantity(rs.getInt("quantity"));
                product.setProductName(rs.getString("productName"));
                product.setImage(rs.getString("image"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setCreateAt(rs.getDate("CreateAt"));
                product.setUpdateAt(rs.getDate("UpdateAt"));
                product.setDeleteAt(rs.getDate("DeleteAt"));
                RateDTO rate = getRateByProductId(product.getProductId());
                product.setAvgRate(rate.getAvgRate());
                product.setCountRate(rate.getCountRate());
                list.add(product);
            }
        } catch (SQLException ex) {
            System.out.println("findAllProduct: " + ex.getMessage());
        }
        return list;
    }

    public ProductDTO findProductById(int productId) {
        PreparedStatement pstm;
        ResultSet rs;
        try {
            String query = "SELECT * FROM product WHERE productId = ?  and status = 1";
            pstm = cnn.prepareStatement(query);
            pstm.setInt(1, productId);
            ProductDTO product = new ProductDTO();
            // Thực thi câu truy vấn
            rs = pstm.executeQuery();

            // Xử lý kết quả truy vấn
            if (rs.next()) {
                product = new ProductDTO();
                product.setProductId(rs.getInt("productId"));
                product.setCategoryId(rs.getInt("categoryId"));
                product.setStatus(rs.getInt("status"));
                product.setDiscount(rs.getInt("discount"));
                product.setQuantity(rs.getInt("quantity"));
                product.setProductName(rs.getString("productName"));
                product.setImage(rs.getString("image"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setCreateAt(rs.getDate("CreateAt"));
                product.setUpdateAt(rs.getDate("UpdateAt"));
                product.setDeleteAt(rs.getDate("DeleteAt"));
                RateDTO rate = getRateByProductId(productId);
                product.setAvgRate(rate.getAvgRate());
                product.setCountRate(rate.getCountRate());
                product.setImageDetail(getImageDetail(productId));
            }
            return product;
        } catch (SQLException ex) {
            System.out.println("findProductById: " + ex.getMessage());
        }
        return null;
    }

    public HashMap<Integer, ArrayList<Product>> findAllProductWithCatgory(ArrayList<Category> listCate) {
        PreparedStatement pstm;
        ResultSet rs;
        ArrayList<Product> listProduct;
        HashMap<Integer, ArrayList<Product>> map = new HashMap<>();
        for (Category cate : listCate) {
            listProduct = new ArrayList<>();
            String sql = "select * from product where status = 1 and CategoryID = " + cate.getCategoryId();
            try {
                pstm = cnn.prepareStatement(sql);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    Product product = new Product();
                    product.setProductId(rs.getInt("productId"));
                    product.setCategoryId(rs.getInt("categoryId"));
                    product.setStatus(rs.getInt("status"));
                    product.setDiscount(rs.getInt("discount"));
                    product.setQuantity(rs.getInt("quantity"));
                    product.setProductName(rs.getString("productName"));
                    product.setImage(rs.getString("image"));
                    product.setDescription(rs.getString("description"));
                    product.setPrice(rs.getDouble("price"));
                    product.setCreateAt(rs.getDate("createAt"));
                    product.setUpdateAt(rs.getDate("updateAt"));
                    product.setDeleteAt(rs.getDate("deleteAt"));
                    // Thêm đối tượng Product vào danh sách
                    listProduct.add(product);
                }
            } catch (SQLException ex) {
                System.out.println("find All Product: " + ex.getMessage());
            }
            map.put(cate.getCategoryId(), listProduct);
        }
        return map;
    }

    @Override
    public ArrayList<Product> findAll() {
        PreparedStatement pstm;
        ResultSet rs;
        ArrayList<Product> result = new ArrayList<>();
        String sql = "select * from product where status = 1";
        try {
            pstm = cnn.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("productId"));
                product.setCategoryId(rs.getInt("categoryId"));
                product.setStatus(rs.getInt("status"));
                product.setDiscount(rs.getInt("discount"));
                product.setQuantity(rs.getInt("quantity"));
                product.setProductName(rs.getString("productName"));
                product.setImage(rs.getString("image"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setCreateAt(rs.getDate("createAt"));
                product.setUpdateAt(rs.getDate("updateAt"));
                product.setDeleteAt(rs.getDate("deleteAt"));
                // Thêm đối tượng Product vào danh sách
                result.add(product);
            }
        } catch (SQLException ex) {
            System.out.println("find All Product: " + ex.getMessage());
        }
        return result;
    }

    public ArrayList<Product> findAllProductDiscount() {
        PreparedStatement pstm;
        ResultSet rs;
        ArrayList<Product> result = new ArrayList<>();
        String sql = "select * from product where Discount != 0 and status = 1 order by Discount desc";
        try {
            pstm = cnn.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("productId"));
                product.setCategoryId(rs.getInt("categoryId"));
                product.setStatus(rs.getInt("status"));
                product.setDiscount(rs.getInt("discount"));
                product.setQuantity(rs.getInt("quantity"));
                product.setProductName(rs.getString("productName"));
                product.setImage(rs.getString("image"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setCreateAt(rs.getDate("createAt"));
                product.setUpdateAt(rs.getDate("updateAt"));
                product.setDeleteAt(rs.getDate("deleteAt"));
                // Thêm đối tượng Product vào danh sách
                result.add(product);
            }
        } catch (SQLException ex) {
            System.out.println("find All Product: " + ex.getMessage());
        }
        return result;
    }

    public HashMap<Integer, Integer> FindAllProductWithRate() {
        PreparedStatement pstm;
        ResultSet rs;
        HashMap<Integer, Integer> map = new HashMap<>();
        try {
            String sql = "select r.ProductID, avg(r.Rating) from product p , Ratings r  where p.ProductID = r.ProductID and p.status = 1 group by r.ProductID";
            pstm = cnn.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt(1);
                int avg = rs.getInt(2);
                map.put(productId, avg);
            }
        } catch (SQLException ex) {
            System.out.println("FindAllProductWithRate");
        }
        return map;
    }

    @Override
    public boolean create(Product entity) {
        entity.setCreateAt(new Date(System.currentTimeMillis()));
        entity.setStatus(1);
        try {
            String sql = "INSERT INTO product ( categoryId, status, discount, quantity, productName, image, description, price, CreateAt, UpdateAt, DeleteAt)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = cnn.prepareStatement(sql);

            // Set values for parameters
            statement.setInt(1, entity.getCategoryId());
            statement.setInt(2, entity.getStatus());
            statement.setInt(3, entity.getDiscount());
            statement.setInt(4, entity.getQuantity());
            statement.setString(5, entity.getProductName());
            statement.setString(6, entity.getImage());
            statement.setString(7, entity.getDescription());
            statement.setDouble(8, entity.getPrice());
            statement.setDate(9, entity.getCreateAt());
            statement.setDate(10, entity.getUpdateAt());
            statement.setDate(11, entity.getDeleteAt());

            // Execute the statement
            statement.executeUpdate();

            System.out.println("Product created successfully.");
            return true;
        } catch (SQLException e) {
            System.out.println("Error creating product: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean update(Product entity) {
        entity.setStatus(1);
        try {
            String query = "UPDATE product SET productName = ?, categoryId = ?, status = ?, "
                    + "discount = ?, quantity = ?, image = ?, description = ?, price = ?, "
                    + "updateAt = ? WHERE productId = ?";

            // Chuẩn bị câu truy vấn
            PreparedStatement statement = cnn.prepareStatement(query);

            // Đặt giá trị cho các tham số trong câu truy vấn
            statement.setString(1, entity.getProductName());
            statement.setInt(2, entity.getCategoryId());
            statement.setInt(3, entity.getStatus());
            statement.setInt(4, entity.getDiscount());
            statement.setInt(5, entity.getQuantity());
            statement.setString(6, entity.getImage());
            statement.setString(7, entity.getDescription());
            statement.setDouble(8, entity.getPrice());
            statement.setDate(9, new java.sql.Date(System.currentTimeMillis()));
            statement.setInt(10, entity.getProductId());

            // Thực hiện câu truy vấn
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("updateProduct: " + ex.getMessage());
        }
        return false;
    }

    @Override
    public boolean delete(Product entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public boolean delete(int productId) {
        Date DeleteAt = new Date(System.currentTimeMillis());
        try {
            String sql = "Update product "
                    + "set status = 2 , deleteAt = ? "
                    + "where ProductID = ?";
            PreparedStatement pstm = cnn.prepareStatement(sql);
            pstm.setDate(1, DeleteAt);
            pstm.setInt(2, productId);
            pstm.execute();
            // Xóa comment
            return true;
        } catch (SQLException ex) {
            System.out.println("delete product: " + ex.getMessage());
        }
        return false;
    }
}
