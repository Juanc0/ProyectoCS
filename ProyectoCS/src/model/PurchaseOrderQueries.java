package model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class PurchaseOrderQueries {
    public ArrayList<PurchaseOrderModel> getClientPurchaseOrders(Connection conn, int clientId){
        ArrayList<PurchaseOrderModel> clientPurchaseOrders = new ArrayList();
        String query = "{call getClientPurchaseOrders(?) }";
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.setInt(1, clientId);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                clientPurchaseOrders.add(new PurchaseOrderModel(
                    rs.getInt("Ordc_id"),
                    rs.getInt("Ordc_Ases_id"),
                    rs.getInt("Ordc_Cli_id"),
                    rs.getInt("Ordc_preciotol"),
                    rs.getInt("Ordc_precioFianl"),
                    rs.getDate("Ordc_fec"),
                    rs.getString("Ordc_estado")
                ));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return clientPurchaseOrders;
    }
    
    public ArrayList<PurchaseOrderModel> getAdvisorPurchaseOrders(Connection conn, int clientId){
        ArrayList<PurchaseOrderModel> advisorPurchaseOrders = new ArrayList();
        String query = "{call getAdvisorPurchaseOrders(?) }";
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.setInt(1, clientId);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                advisorPurchaseOrders.add(new PurchaseOrderModel(
                    rs.getInt("Ordc_id"),
                    rs.getInt("Ordc_Ases_id"),
                    rs.getInt("Ordc_Cli_id"),
                    rs.getInt("Ordc_preciotol"),
                    rs.getInt("Ordc_precioFianl"),
                    rs.getDate("Ordc_fec"),
                    rs.getString("Ordc_estado")
                ));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return advisorPurchaseOrders;
    }
}
