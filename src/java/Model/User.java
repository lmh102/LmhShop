/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author PC
 */
public class User {

    private int userId, status;
    private String fullName, email, password, address, phone, avatar;
    private Date dob, CreateAt, DeleteAt, UpdateAt;

    public User() {
    }

    public User(int userId, int status, String fullName, String email, String password, String address, String phone, String avartar, Date dob, Date CreateAt, Date DeleteAt, Date UpdateAt) {
        this.userId = userId;
        this.status = status;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.address = address;
        this.phone = phone;
        this.avatar = avartar;
        this.dob = dob;
        this.CreateAt = CreateAt;
        this.DeleteAt = DeleteAt;
        this.UpdateAt = UpdateAt;
    }

    public User(int userId, int status, String fullName, String email, String avatar) {
        this.userId = userId;
        this.status = status;
        this.fullName = fullName;
        this.email = email;
        this.avatar = avatar;
    }

    public User(String fullName, String email, String password) {
        this.fullName = fullName;
        this.email = email;
        this.password = password;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setGmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvartar(String avatar) {
        this.avatar = avatar;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Date getCreateAt() {
        return CreateAt;
    }

    public void setCreateAt(Date CreateAt) {
        this.CreateAt = CreateAt;
    }

    public Date getDeleteAt() {
        return DeleteAt;
    }

    public void setDeleteAt(Date DeleteAt) {
        this.DeleteAt = DeleteAt;
    }

    public Date getUpdateAt() {
        return UpdateAt;
    }

    public void setUpdateAt(Date UpdateAt) {
        this.UpdateAt = UpdateAt;
    }

}
