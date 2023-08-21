/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package DAL;

import java.util.ArrayList;

/**
 *
 * @author PC
 * @param <T>
 */
public interface IGenericDAL<T>{
    ArrayList<T> findAll();
    boolean create(T entity);
    boolean update(T entity);
    boolean delete(T entity);
}
