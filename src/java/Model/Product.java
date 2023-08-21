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
public class Product {
    private int productId, categoryId, status, discount,quantity;
    private String productName, image, description;
    private double price;
    private Date CreateAt, UpdateAt, DeleteAt;

    public Product() {
    }

    public Product(int productId, int categoryId, int status, int discount,int quantity, String productName, String image, String description, double price, Date CreateAt, Date UpdateAt, Date DeleteAt) {
        this.productId = productId;
        this.categoryId = categoryId;
        this.status = status;
        this.discount = discount;
        this.quantity = quantity;
        this.productName = productName;
        this.image = image;
        this.description = description;
        this.price = price;
        this.CreateAt = CreateAt;
        this.UpdateAt = UpdateAt;
        this.DeleteAt = DeleteAt;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
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
