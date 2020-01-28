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
            String query = "{ call createUser(?, ?, ?, ?) }";
            CallableStatement cs = conn.prepareCall(query);
            cs.setString(1, newUser.getCcnit());
            cs.setString(2, newUser.getName());
            cs.setString(3, newUser.getPasswrod());
            cs.setString(3, newUser.getClientNit());
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
            cs.setString(1, newClient.getCompany());
            cs.setString(1, newClient.getJob());
            cs.setString(1, newClient.getPhone());
            cs.setString(1, newClient.getFax());
            cs.setString(1, newClient.getEmail());
            cs.setString(1, newClient.getCity());
            cs.setString(1, newClient.getAddress());
            cs.setString(1, newClient.getIdArt());
            cs.execute();
        } catch (SQLException ex) {
            Logger.getLogger(ClientSignupQueries.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;  //  should be the new registry id
    }    
}
