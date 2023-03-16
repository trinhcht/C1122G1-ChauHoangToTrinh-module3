package module3.ss12.repository.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository {
    private static final String USER_NAME = "root";
    private static final String PASSWORD = "123456";
    private static final String HOST = "localhost";
    private static final String DATABASE = "demo_ss12";
    private static final String PORT = "3307";

    private static Connection connection;

    public static Connection getConnection () {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://"+HOST+":"+PORT+"/"+DATABASE, USER_NAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static void close(){
        try {
            if(connection != null){
                connection.close();
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }
}
