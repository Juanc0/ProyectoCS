package model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class ItemClientQueries {
    
    public ItemClientModel getItemClient(Connection conn, int itemClientId){
        String query = "{call getItemClient(?) }";
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.setInt(1, itemClientId);
            ResultSet rs = cs.executeQuery();
            if(rs.next()){
                return new ItemClientModel(
                    rs.getInt("ItmC_id"),
                    rs.getInt("ItmC_Itm_id"),
                    rs.getInt("ItmC_Cli_id"),
                    rs.getString("ItmC_serial"),
                    rs.getString("ItmC_internId"),
                    rs.getInt("ItmC_almax"),
                    rs.getInt("ItmC_almin"),
                    rs.getString("ItmC_uso"),
                    rs.getBoolean("ItmC_eliminado")
                );
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return null;
    }
    public ArrayList<ItemClientModel> getItemsClient(Connection conn, int itemId, int userId){
        String query = "{call getItemsClient(?, ?) }";
        ArrayList<ItemClientModel> itemsClient = new ArrayList();
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.setInt(1, itemId);
            cs.setInt(2, userId);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                itemsClient.add(new ItemClientModel(
                    rs.getInt("ItmC_id"),
                    rs.getInt("ItmC_Itm_id"),
                    rs.getInt("ItmC_Cli_id"),
                    rs.getString("ItmC_serial"),
                    rs.getString("ItmC_internId"),
                    rs.getInt("ItmC_almax"),
                    rs.getInt("ItmC_almin"),
                    rs.getString("ItmC_uso"),
                    rs.getBoolean("ItmC_eliminado")
                ));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return itemsClient;
    }
    public int createItemClient(Connection conn, ItemClientModel itemClient){
        String query = "{call createItemClient(?, ?, ?, ?, ?, ?, ?, ?) }";
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.registerOutParameter(1, Types.INTEGER);
            cs.setInt(1, itemClient.getId());
            cs.setInt(2, itemClient.getItemId());
            cs.setInt(3, itemClient.getClientId());
            cs.setString(4, itemClient.getSerial());
            cs.setString(5, itemClient.getInternId());
            cs.setInt(6, itemClient.getMaxRange());
            cs.setInt(7, itemClient.getMinRange());
            cs.setString(8, itemClient.getUse());
            cs.execute();
            return cs.getInt(1);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return 0;// should return the id
    }
    public void updateItemClient(Connection conn, ItemClientModel itemClient){
        String query = "{call updateItemClient(?, ?, ?, ?, ?, ?, ?, ?, ?) }";
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.setInt(1, itemClient.getId());
            cs.setInt(2, itemClient.getClientId());
            cs.setInt(3, itemClient.getClientId());
            cs.setString(4, itemClient.getSerial());
            cs.setString(5, itemClient.getInternId());
            cs.setInt(6, itemClient.getMaxRange());
            cs.setInt(7, itemClient.getMinRange());
            cs.setString(8, itemClient.getUse());
            cs.setBoolean(9, itemClient.getDeleted());
            cs.execute();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
    }
    
    public void deleteItemClient(Connection conn, int itemClientId){
        String query = "{call deleteItemClient(?) }";
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.setInt(1, itemClientId);
            cs.execute();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
    }    public void deleteItemsClient(Connection conn, int itemId){
        String query = "{call deleteItemsClient(?) }";
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.setInt(1, itemId);
            cs.execute();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
    }
    
}
