/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;

import dao.OrderDetailsDao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.OrderDetails;
import model.Product;
import server.DBConnection;
import service.OrderService;
import service.ProductService;
import service.impl.OrderServiceImpl;
import service.impl.ProductServiceImpl;

/**
 *
 * @author DUY
 */
public class OrderDetailsDaoImpl extends DBConnection implements OrderDetailsDao {

    OrderService orderS = new OrderServiceImpl();
    ProductService productS = new ProductServiceImpl();

    @Override
    public List<OrderDetails> getAll() {
        List<OrderDetails> list = new ArrayList<OrderDetails>();
        String sql = "SELECT *"
                + "FROM OrderDetails od INNER JOIN [Order] o ON od.order_id = o.id "
                + "INNER JOIN Product p ON od.pro_id = p.id";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetails orderDetails = new OrderDetails();
                Product product = productS.get(rs.getInt("pro_id"));
                Order order = orderS.getId(rs.getString("order_id"));
                orderDetails.setOrder(order);
                orderDetails.setProduct(product);
                orderDetails.setQuantity(rs.getInt("quantity"));
                orderDetails.setUnitPrice(rs.getInt("unitPrice"));
                list.add(orderDetails);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
        return list;
    }

    @Override
    public List<OrderDetails> get(String id) {
        List<OrderDetails> list = new ArrayList<OrderDetails>();
        String sql = "SELECT *"
                + "FROM OrderDetails od INNER JOIN [Order] o ON od.order_id = o.id "
                + "INNER JOIN Product p ON od.pro_id = p.id WHERE order_id = ? ";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetails orderDetails = new OrderDetails();
                Product product = productS.get(rs.getInt("pro_id"));
                Order order = orderS.getId(rs.getString("order_id"));
                orderDetails.setOrder(order);
                orderDetails.setProduct(product);
                orderDetails.setQuantity(rs.getInt("quantity"));
                orderDetails.setUnitPrice(rs.getInt("unitPrice"));
                list.add(orderDetails);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
        return list;
    }

    @Override
    public void insert(OrderDetails orderDetails) {
        String sql = "INSERT INTO OrderDetails VALUES(?,?,?,?)";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, orderDetails.getOrder().getId());
            ps.setInt(2, orderDetails.getProduct().getId());
            ps.setInt(3, orderDetails.getQuantity());
            ps.setFloat(4, orderDetails.getUnitPrice());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
    }

    @Override
    public void edit(OrderDetails oldOrderDetails, OrderDetails newOrderDetails) {
        String sql = "UPDATE [Order] SET pro_id = ?, quantity = ?, unitPrice = ? WHERE order_id = ? AND pro_id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, newOrderDetails.getProduct().getId());
            ps.setInt(2, newOrderDetails.getQuantity());
            ps.setFloat(3, newOrderDetails.getUnitPrice());
            ps.setString(4, oldOrderDetails.getOrder().getId());
            ps.setInt(5, oldOrderDetails.getProduct().getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
    }

    @Override
    public void delete(String order_id, int pro_id) {
        String sql = "DELETE FROM OrderDetails WHERE order_id = ? AND  pro_id =?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, order_id);
            ps.setInt(2, pro_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
    }

    @Override
    public void delete(String order_id) {
        String sql = "DELETE FROM OrderDetails WHERE order_id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, order_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
    }
}
