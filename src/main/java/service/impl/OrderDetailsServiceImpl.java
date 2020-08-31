/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service.impl;

import dao.OrderDetailsDao;
import dao.impl.OrderDetailsDaoImpl;
import java.util.List;
import model.OrderDetails;
import service.OrderDetailsService;

/**
 *
 * @author DUY
 */
public class OrderDetailsServiceImpl implements OrderDetailsService {

    OrderDetailsDao orderDetailsDao = new OrderDetailsDaoImpl();

    @Override
    public List<OrderDetails> getAll() {
        return orderDetailsDao.getAll();
    }
    
    @Override
    public List<OrderDetails> get(String id) {
        return orderDetailsDao.get(id);
    }
    
    @Override
    public void insert(OrderDetails orderDetails) {
        orderDetailsDao.insert(orderDetails);
    }
    
    @Override
    public void edit(OrderDetails oldOrderDetails, OrderDetails newOrderDetails) {
        orderDetailsDao.edit(newOrderDetails, newOrderDetails);
    }
    
    @Override
    public void delete(String order_id, int pro_id) {
        orderDetailsDao.delete(order_id, pro_id);
    }

    @Override
    public void delete(String order_id) {
        orderDetailsDao.delete(order_id);
    }
}
