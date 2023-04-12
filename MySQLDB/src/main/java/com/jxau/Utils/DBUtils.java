package com.jxau.Utils;

import java.sql.*;

public class DBUtils {
    static String driver = "com.mysql.jdbc.Driver";
    static String url = "jdbc:mysql://localhost:3306/myschool";
    static String userName = "root";
    static String password = "123456";

    //得到连接
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        Class.forName(driver);
        conn = DriverManager.getConnection(url,userName,password);
        return conn;
    }

    //释放资源
    public static void closeAll(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet) {
        if (resultSet != null){
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (preparedStatement !=null){
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection !=null){
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
