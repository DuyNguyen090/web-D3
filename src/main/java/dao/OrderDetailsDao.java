/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.OrderDetails;

/**
 *
 * @author DUY
 */
public interface OrderDetailsDao {

    List<OrderDetails> getAll();

    List<OrderDetails> get(String id);

    void insert(OrderDetails orderDetails);

    void edit(OrderDetails oldOrderDetails, OrderDetails newOrderDetails);

    void delete(String order_id, int pro_id);

    void delete(String order_id);
}
