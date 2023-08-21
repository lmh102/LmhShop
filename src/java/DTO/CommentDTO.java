/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import Model.Product;
import Model.User;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class CommentDTO {
    public int CommentId, userId, ProductId, rate;
    public ArrayList<String> image;
    public String content;
    public User user;
    public Date CreateAt, UpdateAt, DeleteAt;
    public int status;
    
    public CommentDTO() {
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    public CommentDTO(int CommentId, int userId, int ProductId, ArrayList<String> image, String content, Date CreateAt, Date UpdateAt, Date DeleteAt, int status) {
        this.CommentId = CommentId;
        this.userId = userId;
        this.ProductId = ProductId;
        this.image = image;
        this.content = content;
        this.CreateAt = CreateAt;
        this.UpdateAt = UpdateAt;
        this.DeleteAt = DeleteAt;
        this.status = status;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public int getCommentId() {
        return CommentId;
    }

    public void setCommentId(int CommentId) {
        this.CommentId = CommentId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return ProductId;
    }

    public void setProductId(int ProductId) {
        this.ProductId = ProductId;
    }

    public ArrayList<String> getImage() {
        return image;
    }

    public void setImage(ArrayList<String> image) {
        this.image = image;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateAt() {
        return CreateAt;
    }

    public void setCreateAt(Date CreateAt) {
        this.CreateAt = CreateAt;
    }

    public Date getUpdateAt() {
        return UpdateAt;
    }

    public void setUpdateAt(Date UpdateAt) {
        this.UpdateAt = UpdateAt;
    }

    public Date getDeleteAt() {
        return DeleteAt;
    }

    public void setDeleteAt(Date DeleteAt) {
        this.DeleteAt = DeleteAt;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
