/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class UserDAL extends DBContext implements IGenericDAL<User> {
    //Khai báo các thành phần xử lý Db

    Connection cnn; //Kết nối đến db
    //Kết nối đến Database
    PreparedStatement pstm;
    ResultSet rs;

    private void connect() {
        cnn = super.connection;
        if (cnn != null) {
            System.out.println("Connect success");
        } else {
            System.out.println("Conenct fail");
        }
    }

    public UserDAL() {
        connect();
    }

    public User login(String gmail, String password) {
        PreparedStatement pstm;
        ResultSet rs;
        String sql = "select * from Users where email = ? and password = ? and status = 1";
        try {
            pstm = cnn.prepareStatement(sql);
            pstm.setString(1, gmail);
            pstm.setString(2, password);
            rs = pstm.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt(1);
                int status = rs.getInt(2);
                String fullName = rs.getString(3);
                String email = rs.getString(4);
                String avatar = rs.getString(9);
                return new User(userId, status, fullName, email, avatar);
            }
        } catch (SQLException ex) {
            System.out.println("login: " + ex.getMessage());
        }
        return null;
    }

    @Override
    public ArrayList<User> findAll() {
        ArrayList<User> userList = new ArrayList<>();

        try {
            connect();

            // Tạo câu truy vấn SQL
            String query = "SELECT * FROM users where status = 1 ";

            // Chuẩn bị câu truy vấn
            PreparedStatement statement = cnn.prepareStatement(query);

            // Thực hiện câu truy vấn
            ResultSet resultSet = statement.executeQuery();

            // Duyệt qua từng dòng kết quả
            while (resultSet.next()) {
                // Lấy thông tin từ ResultSet
                int userId = resultSet.getInt("userId");
                String fullName = resultSet.getString("fullName");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String avatar = resultSet.getString("avatar");
                java.sql.Date CreateAt = resultSet.getDate("CreateAt");
                String phone = resultSet.getString("phone");
                // Lấy các thông tin khác từ ResultSet

                // Tạo đối tượng User
                User user = new User();
                user.setUserId(userId);
                user.setFullName(fullName);
                user.setGmail(email);
                user.setPassword(password);
                user.setAvartar(avatar);
                user.setCreateAt(CreateAt);
                user.setPhone(phone);
                // Đặt các thông tin khác cho đối tượng User

                // Thêm User vào danh sách
                userList.add(user);
            }

            // Đóng kết nối và giải phóng tài nguyên
            resultSet.close();
            statement.close();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Lỗi khi lấy danh sách người dùng!");
        }

        return userList;
    }

    @Override
    public boolean create(User entity) {
        PreparedStatement pstm;
        ResultSet rs;
        entity.setCreateAt(new java.sql.Date(System.currentTimeMillis()));
//        entity.setCreateAt(new java.sql.Date(Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant()).getTime()));
        if (IsExistUser(entity.getEmail())) {
            return false;
        }
        String sql = "insert into Users(status,fullName,email,password,address,phone,dob,avatar,CreateAt,UpdateAt,DeleteAt) values(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            pstm = cnn.prepareStatement(sql);
            pstm.setInt(1, 1);
            pstm.setString(2, entity.getFullName());
            pstm.setString(3, entity.getEmail());
            pstm.setString(4, entity.getPassword());
            pstm.setString(5, entity.getAddress());
            pstm.setString(6, entity.getPhone());
            pstm.setDate(7, entity.getDob());
            pstm.setString(8, entity.getAvatar());
            pstm.setDate(9, entity.getCreateAt());
            pstm.setDate(10, entity.getUpdateAt());
            pstm.setDate(11, entity.getDeleteAt());
            pstm.execute();
        } catch (SQLException ex) {
            System.out.println("createUser: " + ex.getMessage());
            return false;
        }
        int userId = GetUserIdByEmail(entity.getEmail());
        try {
            sql = "insert into UserRoles(userId,roleId) values(?,1)";
            pstm = cnn.prepareStatement(sql);
            pstm.setInt(1, userId);
            pstm.execute();
        } catch (SQLException ex) {
            System.out.println("MapUserRole: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public String getUserRoleById(int userId) {
        PreparedStatement pstm;
        ResultSet rs;
        String sql = "select r.roleName from UserRoles ur, Roles r "
                + "where ur.userId = ? and ur.roleId = r.roleId";
        try {
            pstm = cnn.prepareStatement(sql);
            pstm.setInt(1, userId);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("getUserRole: " + e.getMessage());
        }
        return null;
    }

    public int GetUserIdByEmail(String email) {
        PreparedStatement pstm;
        ResultSet rs;
        String sql = "select userId from Users where email = ?";
        try {
            pstm = cnn.prepareStatement(sql);
            pstm.setString(1, email);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println("GetUserIdByEmail: " + ex.getMessage());
        }
        return -1;
    }

    public User getUserById(int userId) {
        PreparedStatement pstm;
        ResultSet rs;
        String sql = "select * from Users where userId = ? and status = 1";
        try {
            pstm = cnn.prepareStatement(sql);
            pstm.setInt(1, userId);
            rs = pstm.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setGmail(rs.getString("email"));
                user.setAvartar(rs.getString("avatar"));
                user.setFullName(rs.getString("fullName"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setDob(rs.getDate("dob"));
                user.setCreateAt(rs.getDate("CreateAt"));
                return user;
            }
        } catch (SQLException ex) {
            System.out.println("getUserById: " + ex.getMessage());
        }
        return null;
    }

    public User GetUserByEmail(String email) {
        PreparedStatement pstm;
        ResultSet rs;
        String sql = "select * from Users where email = ?";
        try {
            pstm = cnn.prepareStatement(sql);
            pstm.setString(1, email);
            rs = pstm.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setGmail(rs.getString("email"));
                user.setAvartar(rs.getString("avatar"));
                user.setFullName(rs.getString("fullName"));
                return user;
            }
        } catch (SQLException ex) {
            System.out.println("GetUserIdByEmail: " + ex.getMessage());
        }
        return null;
    }

    public boolean IsExistUser(String email) {
        PreparedStatement pstm;
        ResultSet rs;
        String sql = "select * from Users where email = ?";
        try {
            pstm = cnn.prepareStatement(sql);
            pstm.setString(1, email);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println("IsExistUser: " + ex.getMessage());
        }
        return false;
    }

    public boolean create(User entity, int roleId) {
        PreparedStatement pstm;
        ResultSet rs;
        if (IsExistUser(entity.getEmail())) {
            return false;
        }
        String sql = "insert into Users(status,fullName,email,password,address,phone,dob,avatar,CreateAt,UpdateAt,DeleteAt) values(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            pstm = cnn.prepareStatement(sql);
            pstm.setInt(1, 1);
            pstm.setString(2, entity.getFullName());
            pstm.setString(3, entity.getEmail());
            pstm.setString(4, entity.getPassword());
            pstm.setString(5, entity.getAddress());
            pstm.setString(6, entity.getPhone());
            pstm.setDate(7, entity.getDob());
            pstm.setString(8, entity.getAvatar());
            pstm.setDate(9, entity.getCreateAt());
            pstm.setDate(10, entity.getUpdateAt());
            pstm.setDate(11, entity.getDeleteAt());
            pstm.execute();
        } catch (SQLException ex) {
            System.out.println("createUser: " + ex.getMessage());
        }
        int userId = GetUserIdByEmail(entity.getEmail());
        try {
            sql = "insert into UserRoles(userId,roleId) values(?,?)";
            pstm = cnn.prepareStatement(sql);
            pstm.setInt(1, userId);
            pstm.setInt(2, roleId);
            pstm.execute();
        } catch (SQLException ex) {
            System.out.println("MapUserRole: " + ex.getMessage());
            return false;
        }
        return true;
    }

    @Override
    public boolean update(User entity) {
        try {
            PreparedStatement pstm;
            ResultSet rs;
            entity.setUpdateAt(new java.sql.Date(System.currentTimeMillis()));
            String sql = "Update Users"
                    + " set avatar = ?, fullName = ?, phone = ?, address = ?, dob = ?, UpdateAt = ?"
                    + " where userId = ?";
            pstm = cnn.prepareStatement(sql);
            pstm.setString(1, entity.getAvatar());
            pstm.setString(2, entity.getFullName());
            pstm.setString(3, entity.getPhone());
            pstm.setString(4, entity.getAddress());
            pstm.setDate(5, entity.getDob());
            pstm.setDate(6, entity.getUpdateAt());
            pstm.setInt(7, entity.getUserId());
            pstm.execute();
            return true;
        } catch (SQLException ex) {
            System.out.println("updateUser : " + ex.getMessage());
        }
        return false;
    }

    @Override
    public boolean delete(User entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

        public boolean delete(int UserId) {
        java.sql.Date DeleteAt = new java.sql.Date(System.currentTimeMillis());
        try {
            String sql = "Update Users "
                    + "set status = 2 , DeleteAt = ? "
                    + "where Userid = ?";
            PreparedStatement pstm = cnn.prepareStatement(sql);
            pstm.setDate(1, DeleteAt);
            pstm.setInt(2, UserId);
            pstm.execute();
            sql = "Update comment "
                    + "set status = 2 , DeleteAt = ? "
                    + "where Userid = ?";
            pstm = cnn.prepareStatement(sql);
            pstm.setDate(1, DeleteAt);
            pstm.setInt(2, UserId);
            pstm.execute();
            // Xóa comment
            return true;
        } catch (SQLException ex) {
            System.out.println("Delete User : " + ex.getMessage());
        }
        return false;
    }
}
