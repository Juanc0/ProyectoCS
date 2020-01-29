package model;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
public class ClientSignupQueries{
    public int createUser(Connection conn, UserModel newUser){
        try {
            String query = "{ call createClientUser(?, ?, ?, ?) }";
            CallableStatement cs = conn.prepareCall(query);
            cs.setString(1, newUser.getCcnit());
            cs.setString(2, newUser.getName());
            cs.setString(3, newUser.getPasswrod());
            cs.setString(4, newUser.getClientNit());
            cs.execute();
        } catch (SQLException ex) {
            Logger.getLogger(ClientSignupQueries.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;   //  should be the new registry id
    }
    public int createClient(Connection conn, ClientModel newClient){
        try {
            String query = "{ call createClient(?, ?, ?, ?, ?, ?, ?, ?, ?) }";
            CallableStatement cs = conn.prepareCall(query);
            cs.setString(1, newClient.getNit());
            cs.setString(2, newClient.getCompany());
            cs.setString(3, newClient.getJob());
            cs.setString(4, newClient.getPhone());
            cs.setString(5, newClient.getFax());
            cs.setString(6, newClient.getEmail());
            cs.setString(7, newClient.getCity());
            cs.setString(8, newClient.getAddress());
            cs.execute();
        } catch (SQLException ex) {
            Logger.getLogger(ClientSignupQueries.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;  //  should be the new registry id
    }    
}
