package model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class ItemQueries {
    public ItemModel getItem(Connection conn, int itemId){
        String query = "{call getItem(?) }";
        ItemModel item = null;
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.setInt(1, itemId);
            ResultSet rs = cs.executeQuery();
            if(rs.next()){
                item = new ItemModel(
                    rs.getInt("Itm_id"),
                    rs.getString("Itm_nom"),
                    rs.getString("Itm_let"),
                    rs.getString("Itm_mar"),
                    rs.getString("Itm_mod"),
                    rs.getString("Itm_magn"),
                    rs.getInt("Itm_almax"),
                    rs.getInt("Itm_almin"),
                    rs.getDouble("Itm_res"),
                    rs.getString("Itm_escala"),
                    rs.getBoolean("Itm_eliminado")
                );
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return item;
    }
    public ArrayList<ItemModel> getItems(Connection conn, int userId){
        String query = "{call getItems(?) }";
        ArrayList<ItemModel> items = new ArrayList();
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.setInt(1, userId);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                items.add(new ItemModel(
                    rs.getInt("Itm_id"),
                    rs.getString("Itm_nom"),
                    rs.getString("Itm_let"),
                    rs.getString("Itm_mar"),
                    rs.getString("Itm_mod"),
                    rs.getString("Itm_magn"),
                    rs.getInt("Itm_almax"),
                    rs.getInt("Itm_almin"),
                    rs.getDouble("Itm_res"),
                    rs.getString("Itm_escala"),
                    rs.getBoolean("Itm_eliminado")
                ));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return items;
    }
    public int createItem(Connection conn, ItemModel item){
        String query = "{call createItem(?, ?, ?, ?, ?, ?, ?, ?, ?) }";
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.registerOutParameter(1, Types.INTEGER);
            cs.setInt(1, item.getId());
            cs.setString(2, item.getName());
            cs.setString(3, item.getBrand());
            cs.setString(4, item.getModel());
            cs.setString(5, item.getMagnitude());
            cs.setInt(6, item.getMaxRange());
            cs.setInt(7, item.getMinRange());
            cs.setDouble(8, item.getPrecision());
            cs.setString(9, item.getScale());
            cs.execute();
            return cs.getInt(1);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return 0;// should return the id
    }
    
    public void updateItem(Connection conn, ItemModel item){
        String query = "{call updateItem(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }";
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.setInt(1, item.getId());
            cs.setString(2, item.getName());
            cs.setString(3, item.getType());
            cs.setString(4, item.getBrand());
            cs.setString(5, item.getModel());
            cs.setString(6, item.getMagnitude());
            cs.setInt(7, item.getMaxRange());
            cs.setInt(8, item.getMinRange());
            cs.setDouble(9, item.getPrecision());
            cs.setBoolean(10, item.getDeleted());
            cs.execute();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
    }
    
    public void deleteItem(Connection conn, int itemId){
        String query = "{call deleteItem(?) }";
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.setInt(1, itemId);
            cs.execute();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
    }
}
