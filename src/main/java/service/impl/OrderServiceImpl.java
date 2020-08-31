/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service.impl;

import dao.OrderDao;
import dao.impl.OrderDaoImpl;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.User;
import service.OrderService;

/**
 *
 * @author DUY
 */
public class OrderServiceImpl implements OrderService {

    OrderDao orderDao = new OrderDaoImpl();

    @Override
    public List<Order> getAll() {
        return orderDao.getAll();
    }

    @Override
    public void insert(Order order) {
        orderDao.insert(order);
    }

    @Override
    public void edit(Order newOrder) {
        Order oldOrder = orderDao.getId(newOrder.getId());
        oldOrder.setUser(newOrder.getUser());
        oldOrder.setTimeOrder(newOrder.getTimeOrder());
        oldOrder.setStatus(newOrder.getStatus());
        orderDao.edit(oldOrder);
    }

    @Override
    public void delete(String id) {
        orderDao.delete(id);
    }

    @Override
    public Order getId(String id) {
        return orderDao.getId(id);
    }

    @Override
    public List<Order> search(String keyword) {
        return orderDao.getName(keyword);
    }

    @Override
    public List<Order> getByUser(int user_id) {
        return orderDao.getByUser(user_id);
    }

    @Override
    public List<Order> getByStatus(int status) {
        return orderDao.getByStatus(status);
    }

    @Override
    public List<Order> getByStatus(int id, int status) {
        return orderDao.getByStatus(id, status);
    }

}
