/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;

import dao.OrderDao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.User;
import server.DBConnection;
import service.UserService;
import service.impl.UserServiceImpl;

/**
 *
 * @author DUY
 */
public class OrderDaoImpl extends DBConnection implements OrderDao {

    UserService userS = new UserServiceImpl();

    @Override
    public List<Order> getAll() {
        List<Order> orders = new ArrayList<Order>();
        String sql = "SELECT o.id, o.timeOrder, o.status, u.id AS  user_id  FROM [Order] o INNER JOIN [User] u ON o.u_id = u.id "
                + "ORDER BY o.timeOrder DESC";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = userS.get(rs.getInt("user_id"));
                Order order = new Order();
                order.setId(rs.getString("id"));
                order.setUser(user);
                order.setTimeOrder(rs.getDate("timeOrder"));
                order.setStatus(rs.getInt("status"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
        return orders;
    }

    @Override
    public List<Order> getByUser(int user_id) {
        List<Order> orders = new ArrayList<Order>();
        String sql = "SELECT o.id, timeOrder, o.status, u.id AS  user_id  FROM [Order] o INNER JOIN [User] u ON o.u_id = u.id WHERE u.id = ? "
                + "ORDER BY o.timeOrder DESC";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getString("id"));
                order.setUser(userS.get(user_id));
                order.setTimeOrder(rs.getDate("timeOrder"));
                order.setStatus(rs.getInt("status"));
                orders.add(order);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
        return orders;
    }

    @Override
    public void insert(Order order) {
        String sql = "INSERT INTO [Order] VALUES(?,?,?,?)";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, order.getId());
            ps.setInt(2, order.getUser().getId());
            ps.setDate(3, order.getTimeOrder());
            ps.setInt(4, order.getStatus());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
    }

    @Override
    public void edit(Order order) {
        String sql = "UPDATE [Order] SET u_id = ?, timeOrder = ?, status = ? WHERE id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, order.getUser().getId());
            ps.setDate(2, order.getTimeOrder());
            ps.setInt(3, order.getStatus());
            ps.setString(4, order.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
    }

    @Override
    public void delete(String id) {
        String sql = "DELETE FROM [Order] WHERE id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
    }

    @Override
    public Order getId(String id) {
        String sql = "SELECT o.id, o.timeOrder, o.status, u.id AS  user_id  FROM [Order] o INNER JOIN [User] u ON o.u_id = u.id WHERE o.id = ?";
        Order order = new Order();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = userS.get(rs.getInt("user_id"));
                order.setId(rs.getString("id"));
                order.setUser(user);
                order.setTimeOrder(rs.getDate("timeOrder"));
                order.setStatus(rs.getInt("status"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
        return order;
    }

    @Override
    public List<Order> getName(String u_name) {
        List<Order> orders = new ArrayList<Order>();
        Order order = new Order();
        String sql = "SELECT o.id, o.timeOrder, o.status, u.username, u.id AS  user_id  FROM [Order] o INNER JOIN [User] u ON o.u_id = u.id WHERE u.username  like ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, u_name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = userS.get(rs.getInt("user_id"));
                order.setId(rs.getString("id"));
                order.setUser(user);
                order.setTimeOrder(rs.getDate("timeOrder"));
                order.setStatus(rs.getInt("status"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
        return orders;
    }

    @Override
    public List<Order> searchByDate(Date date) {
        List<Order> orders = new ArrayList<Order>();
        Order order = new Order();
        String sql = "SELECT o.id, o.timeOrder, o.status, u.username, u.id AS  user_id  FROM [Order] o INNER JOIN [User] u ON o.u_id = u.id WHERE u.timeOrder  = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setDate(1, date);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = userS.get(rs.getInt("user_id"));
                order.setId(rs.getString("id"));
                order.setUser(user);
                order.setTimeOrder(rs.getDate("timeOrder"));
                order.setStatus(rs.getInt("status"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
        return orders;
    }

    @Override
    public List<Order> getByStatus(int status) {
        List<Order> orders = new ArrayList<Order>();
        String sql = "SELECT o.id, o.timeOrder, o.status, u.id AS  user_id  "
                + "FROM [Order] o INNER JOIN [User] u ON o.u_id = u.id "
                + "WHERE o.status = ? "
                + "ORDER BY o.timeOrder DESC";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = userS.get(rs.getInt("user_id"));
                Order order = new Order();
                order.setId(rs.getString("id"));
                order.setUser(user);
                order.setTimeOrder(rs.getDate("timeOrder"));
                order.setStatus(rs.getInt("status"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
        return orders;
    }

    @Override
    public List<Order> getByStatus(int u_id, int status) {
        List<Order> orders = new ArrayList<Order>();
        String sql = "SELECT o.id, o.timeOrder, o.status, u.id AS  user_id  "
                + "FROM [Order] o INNER JOIN [User] u ON o.u_id = u.id "
                + "WHERE o.status = ? AND u.id =? "
                + "ORDER BY o.timeOrder DESC";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, u_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = userS.get(rs.getInt("user_id"));
                Order order = new Order();
                order.setId(rs.getString("id"));
                order.setUser(user);
                order.setTimeOrder(rs.getDate("timeOrder"));
                order.setStatus(rs.getInt("status"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
        return orders;
    }

}
