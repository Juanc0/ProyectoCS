package model;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
public class ClientQueries{
    public int createClient(Connection conn, ClientModel newClient){
        try {
            String query = "{ call createClient(?, ?, ?, ?, ?, ?, ?, ?) }";
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
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return 0;  //  should be the new registry id
    }
    
    public ClientModel getClient(Connection conn, int clientId){
        String query = "{call getClient(?) }";
        ClientModel client = null;
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.setInt(1, clientId);
            ResultSet rs = cs.executeQuery();
            if(rs.next()){
                client = new ClientModel(
                    rs.getInt("Cli_id"),
                    rs.getString("Cli_nit"),
                    rs.getString("Cli_emp"),
                    rs.getString("Cli_cont_carg"),
                    rs.getString("Cli_tel"),
                    rs.getString("Cli_fax"),
                    rs.getString("Cli_email"),
                    rs.getString("Cli_ciu"),
                    rs.getString("Cli_dir"),
                    rs.getString("Cli_idart")
                );
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return client;
    }
    public int getClientId(Connection conn, String nit){
        try {
            String query = "{ call getClientId(?) }";
            CallableStatement cs = conn.prepareCall(query);
            cs.setString(1, nit);
            ResultSet rs = cs.executeQuery();
            if(rs.next())
                return rs.getInt("Cli_id");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return 0;
    }
    
    public int updateClient(Connection conn, ClientModel client){
        try {
            String query = "{ call updateClient(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }";
            CallableStatement cs = conn.prepareCall(query);
            cs.setInt(1, client.getId());
            cs.setString(2, client.getNit());
            cs.setString(3, client.getCompany());
            cs.setString(4, client.getJob());
            cs.setString(5, client.getPhone());
            cs.setString(6, client.getFax());
            cs.setString(7, client.getEmail());
            cs.setString(8, client.getCity());
            cs.setString(9, client.getAddress());
            cs.setString(10, client.getArtificialId());
            cs.execute();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return 0;   //  should be the new registry id
    }
//    public int updateUserClientId(Connection conn, int userId, int clientId){
//        try {
//            String query = "{ call updateUserClientId(?, ?) }";
//            CallableStatement cs = conn.prepareCall(query);
//            cs.setInt(1, userId);
//            cs.setInt(2, clientId);
//            cs.execute();
//        } catch (SQLException ex) {
//            Logger.getLogger(ClientQueries.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return 0;  //  should be the new registry id
//    }
    
}
