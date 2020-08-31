package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.CategoryDao;
import server.DBConnection;
import model.Category;

public class CategoryDaoImpl extends DBConnection implements CategoryDao {

    @Override
    public void insert(Category category) {
        String sql = "INSERT INTO category(cate_name, sex) VALUES (?,?)";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, category.getName());
            ps.setString(2, category.getSex());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
    }

    @Override
    public void edit(Category category) {
        String sql = "UPDATE category SET cate_name = ?, sex = ? WHERE cate_id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, category.getName());     
            ps.setString(2, category.getSex());
            ps.setInt(3, category.getId());
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
        String sql = "DELETE FROM category WHERE cate_id = ?";
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
    public Category get(int id) {
        String sql = "SELECT * FROM category WHERE cate_id = ? ";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                Category category = new Category();

                category.setId(rs.getInt("cate_id"));
                category.setName(rs.getString("cate_name"));
                category.setSex(rs.getString("sex"));
                return category;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
        return null;
    }

    @Override
    public List<Category> getAll() {
        List<Category> categories = new ArrayList<Category>();
        String sql = "SELECT * FROM Category";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("cate_id"));
                category.setName(rs.getString("cate_name"));
                category.setSex(rs.getString("sex"));
                categories.add(category);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }

        return categories;
    }

    @Override
    public List<Category> search(String keyword) {
        List<Category> categories = new ArrayList<Category>();
        String sql = "SELECT * FROM category WHERE name LIKE ? or sex like ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                Category category = new Category();

                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setSex(rs.getString("sex"));
                categories.add(category);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }

        return categories;
    }

    @Override
    public List<Category> getByName(String name) {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM Category WHERE cate_name = ? ";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();

            while (rs.next()) {
                Category category = new Category();

                category.setId(rs.getInt("cate_id"));
                category.setName(rs.getString("cate_name"));
                category.setSex(rs.getString("sex"));
                list.add(category);

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
        return list;
    }

    @Override
    public List<Category> getBySex(String sex) {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM Category WHERE sex like ? ";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, sex);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("cate_id"));
                category.setName(rs.getString("cate_name"));
                category.setSex(rs.getString("sex"));
                list.add(category);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
        return list;
    }

    @Override
    public Category get(String name, String sex) {
        String sql = "SELECT * FROM Category WHERE cate_name like ? and sex like ?";
        Category category = new Category();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, sex);
            rs = ps.executeQuery();
            while (rs.next()) {
                category.setId(rs.getInt("cate_id"));
                category.setName(rs.getString("cate_name"));
                category.setSex(rs.getString("sex"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }
        return category;
    }

    @Override
    public List<Category> getName() {
        List<Category> categories = new ArrayList<Category>();
        String sql = "SELECT DISTINCT cate_name FROM Category";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = super.getJDBCConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setName(rs.getString("cate_name"));
                categories.add(category);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            super.closed(ps, rs, conn);
        }

        return categories;
    }
}
