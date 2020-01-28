package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Persistence {
    private final String host = "localhost";
    private final int port = 3306;
    private final String database = "proyectocs";
    private final String url = "jdbc:mysql://"+this.host+":"+String.valueOf(port)+"/"+this.database;
    private String dbUsername = "auth";
    private String dbPasword = "authPassword";
    private Connection conn = null;
    
    public void setDbUser(String username, String password){
        this.dbUsername = username;
        this.dbPasword = password;
    }
    public Connection openConnection(){
        System.out.println("Opening connection");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(this.url, this.dbUsername, this.dbPasword);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Persistence.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("Connection opened");
        return conn;
    }
    public Connection openConnection(String username, String password){
        this.setDbUser(username, password);
        return this.openConnection();
    }
    public Connection getConnection(){
        return this.conn;
    }
    public void closeConnection(){
        System.out.println("Closing Connection");
        try {
            this.conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Persistence.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("Connection closed");
    }
}
