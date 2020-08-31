/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.util.List;
import model.Order;
import model.User;

/**
 *
 * @author DUY
 */
public interface OrderService {

    List<Order> getAll();

    List<Order> getByStatus(int status);

    List<Order> getByStatus(int u_id, int status);

    void insert(Order order);

    void edit(Order newOrder);

    void delete(String id);

    Order getId(String id);

    List<Order> getByUser(int user_id);

    List<Order> search(String keyword);

}
