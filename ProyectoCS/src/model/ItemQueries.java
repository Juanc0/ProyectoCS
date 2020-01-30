package model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class ItemQueries {
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
                    rs.getString("Itm_auxId"),
                    rs.getString("Itm_nom"),
                    rs.getString("Itm_mar"),
                    rs.getString("Itm_mod"),
                    rs.getString("Itm_ran"),
                    rs.getString("Itm_marg"),
                    rs.getString("Itm_almax"),
                    rs.getString("Itm_almin"),
                    rs.getDouble("Itm_res")
                ));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return items;
    }
    public int createItem(Connection conn, ItemModel item){
        String query = "{call createItem(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }";
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.setInt(1, item.getId());
            cs.setString(2, item.getAuxId());
            cs.setString(3, item.getName());
            cs.setString(4, item.getBrand());
            cs.setString(5, item.getModel());
            cs.setString(6, item.getRange());
            cs.setString(7, item.getMagnitude());
            cs.setString(8, item.getMaxScope());
            cs.setString(9, item.getMinScope());
            cs.setDouble(10, item.getScale());
            cs.execute();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return 0;// should return the id
    }
}
