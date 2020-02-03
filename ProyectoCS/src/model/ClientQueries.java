package model;

import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Types;
import javax.swing.JOptionPane;
public class ClientQueries{
    public int createClient(Connection conn, ClientModel newClient){
        try {
            String query = "{ call createClient(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }";
            CallableStatement cs = conn.prepareCall(query);
            cs.registerOutParameter(1, Types.INTEGER);
            cs.setString(2, newClient.getNit());
            cs.setString(3, newClient.getCompany());
            cs.setString(4, newClient.getJob());
            cs.setString(5, newClient.getPhone());
            cs.setString(6, newClient.getFax());
            cs.setString(7, newClient.getEmail());
            cs.setString(8, newClient.getCity());
            cs.setString(9, newClient.getAddress());
            cs.setString(10, newClient.getType());
            cs.execute();
            return cs.getInt(1);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getStackTrace());
        }
        return 0;
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
                    rs.getString("Cli_estado")
                );
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getStackTrace());
        }
        return client;
    }
    public void updateClient(Connection conn, ClientModel client){
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
            cs.setString(10, client.getType());
            cs.execute();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getStackTrace());
        }
    }    
}
