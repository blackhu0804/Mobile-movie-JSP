/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sql.connect;
import java.sql.*;
/**
 *
 * @author Administrator
 */
public class connect {
    public Connection getConnection() throws SQLException,  
            InstantiationException, IllegalAccessException,  
            ClassNotFoundException {  
        Connection conn = null;  
        // 加载数据库驱动类  
        /** 
         * 这是SqlServer的情形； 
         * Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver" 
         * ).newInstance(); 
         */  
        Class.forName("com.mysql.jdbc.Driver");  
        // 数据库连接URL  
        /** 
         * 这是SqlServer的情形； 
         *  
         * String url = 
         * "jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=Northwind"; 
         */  
        String url = "jdbc:mysql://localhost:3306/movie?useUnicode=true&characterEncoding=gbk";  
        // 数据库用户名  
        String user = "root";  
        // 数据库密码  
        String password = "root";  
        // 根据数据库参数取得一个数据库连接  
        conn = DriverManager.getConnection(url, user, password);  
        return conn;  
    }  
    public ResultSet select(String sql) throws Exception {  
        Connection conn = null;  
        Statement stmt = null;  
        ResultSet rs = null;  
        try {  
            conn = getConnection();  
            stmt = conn.createStatement();  
            rs = stmt.executeQuery(sql);  
            return rs;  
        } catch (SQLException sqle) {  
            throw new SQLException("select data exception: "  
                    + sqle.getMessage());  
        } catch (Exception e) {  
            throw new Exception("System e exception: " + e.getMessage());  
        }  
    }  
    /** 
     * 根据传入的SQL语句向数据库增加一条记录 
     *  
     * @param sql 
     * @throws Exception 
     */  
    public void insert(String sql) throws Exception {  
        Connection conn = null;  
        PreparedStatement ps = null;  
        try {  
            conn = getConnection();  
            ps = conn.prepareStatement(sql);  
            ps.executeUpdate();  
        } catch (SQLException sqle) {  
            throw new Exception("insert data exception: " + sqle.getMessage());  
        } finally {  
            try {  
                if (ps != null) {  
                    ps.close();  
                }  
            } catch (Exception e) {  
                throw new Exception("ps close exception: " + e.getMessage());  
            }  
        }  
        try {  
            if (conn != null) {  
                conn.close();  
            }  
        } catch (Exception e) {  
            throw new Exception("connection close exception: " + e.getMessage());  
        }  
    }  
  
    /** 
     * 根据传入的SQL语句更新数据库记录 
     *  
     * @param sql 
     * @throws Exception 
     */  
    public void update(String sql) throws Exception {  
        Connection conn = null;  
        PreparedStatement ps = null;  
        try {  
            conn = getConnection();  
            ps = conn.prepareStatement(sql);  
            ps.executeUpdate();  
        } catch (SQLException sqle) {  
            throw new Exception("update exception: " + sqle.getMessage());  
        } finally {  
            try {  
                if (ps != null) {  
                    ps.close();  
                }  
            } catch (Exception e) {  
                throw new Exception("ps close exception: " + e.getMessage());  
            }  
        }  
        try {  
            if (conn != null) {  
                conn.close();  
            }  
        } catch (Exception e) {  
            throw new Exception("connection close exception: " + e.getMessage());  
        }  
    }  
  
    /** 
     * 根据传入的SQL语句删除一条数据库记录 
     *  
     * @param sql 
     * @throws Exception 
     */  
    public void delete(String sql) throws Exception {  
        Connection conn = null;  
        PreparedStatement ps = null;  
        try {  
            conn = getConnection();  
            ps = conn.prepareStatement(sql);  
            ps.executeUpdate();  
        } catch (SQLException sqle) {  
            throw new Exception("delete data exception: " + sqle.getMessage());  
        } finally {  
            try {  
                if (ps != null) {  
                    ps.close();  
                }  
            } catch (Exception e) {  
                throw new Exception("ps close exception: " + e.getMessage());  
            }  
        }  
        try {  
            if (conn != null) {  
                conn.close();  
            }  
        } catch (Exception e) {  
            throw new Exception("connection close exception: " + e.getMessage());  
        }  
    }  
}  
