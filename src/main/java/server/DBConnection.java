package server;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;
import javax.swing.JOptionPane;

public class DBConnection {

    public static Connection getJDBCConnection() {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("connection");
        Connection connection = null;
        try {
            Class.forName(resourceBundle.getString("driverName"));
            String toolName = resourceBundle.getString("toolName");
            String host = resourceBundle.getString("serverID");
            String port = resourceBundle.getString("port");
            String dbname = resourceBundle.getString("database");
            String user = resourceBundle.getString("userName");
            String password = resourceBundle.getString("password");
            String url = toolName + host + ":" + port + ";databaseName=" + dbname;
            connection = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        return connection;
    }

    public static void closed(PreparedStatement ps, ResultSet rs, Connection conn) {
        try {
            if (conn != null) {
                conn.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
