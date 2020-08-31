/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;

import dao.UserDetailsDao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;
import model.UserDetails;
import server.DBConnection;
import service.UserService;
import service.impl.UserServiceImpl;

/**
 *
 * @author DUY
 */
public class UserDetailsDaoImpl extends DBConnection implements UserDetailsDao {

    UserService userService = new UserServiceImpl();

    @Override
    public UserDetails getUser(User user) {
        UserDetails userDetails = new UserDetails();
        String sql = "SELECT ud.id, ud.user_id, ud.full_name, ud.tel, ud.address "
                + "FROM UserDetails ud, [User] u WHERE ud.user_id = u.id AND u.id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, user.getId());
            rs = ps.executeQuery();
            while (rs.next()) {
                userDetails.setId(rs.getInt("id"));
                userDetails.setFullName(rs.getNString("full_name"));
                userDetails.setUser(user);
                userDetails.setTel(rs.getString("tel"));
                userDetails.setAddress(rs.getNString("address"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
        return userDetails;
    }

    @Override
    public void insert(UserDetails userDetails) {
        String sql = "INSERT INTO UserDetails(user_id, full_name, [address], tel) VALUES(?,?,?,?)";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userDetails.getUser().getId());
            ps.setString(2, userDetails.getFullName());
            ps.setString(3, userDetails.getAddress());
            ps.setString(4, userDetails.getTel());
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
    }

    @Override
    public void edit(UserDetails userDetails) {
        String sql = "UPDATE UserDetails SET full_name = ?, [address] = ?, tel = ? WHERE id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, userDetails.getFullName());
            ps.setString(2, userDetails.getAddress());
            ps.setString(3, userDetails.getTel());
            ps.setInt(4, userDetails.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
    }

    @Override
    public UserDetails getUserId(int id) {
        UserDetails userDetails = new UserDetails();
        String sql = "SELECT ud.id, ud.user_id, ud.full_name, ud.tel, ud.address "
                + "FROM UserDetails ud, [User] u "
                + "WHERE ud.user_id = u.id AND u.id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                userDetails.setId(rs.getInt("id"));
                userDetails.setFullName(rs.getString("full_name"));
                userDetails.setUser(userService.get(id));
                userDetails.setTel(rs.getString("tel"));
                userDetails.setAddress(rs.getString("address"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
        return userDetails;
    }

    @Override
    public UserDetails getId(int id) {
        UserDetails userDetails = new UserDetails();
        String sql = "SELECT ud.id, ud.user_id, ud.full_name, ud.tel, ud.address "
                + "FROM UserDetails ud, [User] u "
                + "WHERE ud.user_id = u.id AND ud.id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                userDetails.setId(rs.getInt("id"));
                userDetails.setFullName(rs.getString("full_name"));
                userDetails.setUser(userService.get(rs.getInt("user_id")));
                userDetails.setTel(rs.getString("tel"));
                userDetails.setAddress(rs.getString("address"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
        return userDetails;
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM UserDetails WHERE id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
    }

}
