/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Date;
import java.util.List;
import model.Order;
import model.User;

/**
 *
 * @author DUY
 */
public interface OrderDao {

    List<Order> getAll();

    List<Order> getByStatus(int status);

    List<Order> getByStatus(int u_id,int status);

    List<Order> getByUser(int user_id);

    void insert(Order order);

    void edit(Order order);

    void delete(String id);

    Order getId(String id);

    List<Order> getName(String u_name);

    List<Order> searchByDate(Date date);

}
