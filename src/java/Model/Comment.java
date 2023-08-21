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
public class Comment {
    private int CommentId, UserId, ProductId, status;
    private String content;
    private Date CreateAt, UpdateAt, DeleteAt;

    public Comment() {
    }

    public Comment(int CommentId, int UserId, int ProductId, int status, String content, Date CreateAt, Date UpdateAt, Date DeleteAt) {
        this.CommentId = CommentId;
        this.UserId = UserId;
        this.ProductId = ProductId;
        this.status = status;
        this.content = content;
        this.CreateAt = CreateAt;
        this.UpdateAt = UpdateAt;
        this.DeleteAt = DeleteAt;
    }

    public int getCommentId() {
        return CommentId;
    }

    public void setCommentId(int CommentId) {
        this.CommentId = CommentId;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    public int getProductId() {
        return ProductId;
    }

    public void setProductId(int ProductId) {
        this.ProductId = ProductId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
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
    
    
}
