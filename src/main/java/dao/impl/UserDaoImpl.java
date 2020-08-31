package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.UserDao;
import server.DBConnection;
import model.User;

public class UserDaoImpl extends DBConnection implements UserDao {

    @Override
    public void insert(User user) {
        int roleId = 0;
        String sql = "INSERT INTO [User](email, username, password,avatar,role_id) VALUES (?,?,?,?,?)";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getAvatar());
            try {
                conn = super.getJDBCConnection();
                if (user.getRoleId() == 1) {
                    roleId = 1;
                } else {
                    roleId = 2;
                }

            } catch (Exception e) {
                roleId = 2;
            }
            ps.setInt(5, roleId);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
    }

    @Override
    public void edit(User user) {
        String sql = "UPDATE [User] SET email = ? , username = ?, password = ?, avatar = ?, role_id = ? WHERE id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getAvatar());
            ps.setInt(5, user.getRoleId());
            ps.setInt(6, user.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM [User] WHERE id = ?";
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

    @Override
    public User get(String username) {
        String sql = "SELECT * FROM [User] WHERE username = ? ";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();

            while (rs.next()) {
                User user = new User();

                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setAvatar(rs.getString("avatar"));
                user.setRoleId(Integer.parseInt(rs.getString("role_id")));

                return user;

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
        return null;
    }

    @Override
    public User get(int id) {
        String sql = "SELECT * FROM [User] WHERE id = ? ";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                User user = new User();

                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setAvatar(rs.getString("avatar"));
                user.setRoleId(Integer.parseInt(rs.getString("role_id")));

                return user;

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
        return null;
    }

    @Override
    public List<User> getAll() {
        List<User> userList = new ArrayList<User>();
        String sql = "SELECT * FROM [User]";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                User user = new User();

                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setAvatar(rs.getString("avatar"));
                user.setRoleId(Integer.parseInt(rs.getString("role_id")));

                userList.add(user);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }

        return userList;
    }

    @Override
    public List<User> search(String keyword) {
        List<User> userList = new ArrayList<User>();
        String sql = "SELECT * FROM [User] WHERE name LIKE ? ";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                User user = new User();

                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setAvatar(rs.getString("avatar"));
                user.setRoleId(Integer.parseInt(rs.getString("role_id")));

                userList.add(user);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }

        return userList;
    }

    public boolean checkExistEmail(String email) {
        String query = "select * from [user] where email = ?";
        boolean duplicate = false;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = super.getJDBCConnection();

            ps = conn.prepareStatement(query);

            ps.setString(1, email);

            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                duplicate = true;
            }

        } catch (SQLException ex) {
            // TODO Auto-generated catch block
            ex.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
        return duplicate;
    }

    public boolean checkExistUsername(String username) {
        String query = "select * from [User] where username = ?";
        boolean duplicate = false;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = super.getJDBCConnection();

            ps = conn.prepareStatement(query);

            ps.setString(1, username);

            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                duplicate = true;
            }

        } catch (SQLException ex) {
            // TODO Auto-generated catch block
            ex.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
        return duplicate;
    }

}
