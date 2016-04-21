package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 *
 * @author zOzDarKzOz Manager connection
 */
public class SingleDBConnection {

    public static SingleDBConnection instance;
    private Connection conn;

    //get connection option in property file: config.properties
    private SingleDBConnection() {
    }

    public Connection getConnection() {
        return conn;
    }

    public void setConnection(Connection conn) {
        this.conn = conn;
    }

    public static SingleDBConnection getMyDBConnection() {
        if (instance == null) {
            instance = new SingleDBConnection();
            try {
                if (instance.getConnection() == null) {
                    Properties properties = new Properties();
                    properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("resources/config/config.properties"));
                    Class.forName(properties.getProperty("DRIVER_CLASSNAME"));
                    instance.setConnection(DriverManager.getConnection(properties.getProperty("CONNECT_STRING")));
                }
            } catch (ClassNotFoundException | IOException | SQLException e) {
                e.printStackTrace();
            }
        }
        return instance;
    }

    public void closeConnection(Connection conn) {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
