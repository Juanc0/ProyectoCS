package model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class UserQueries {
    
    public int createUser(Connection conn, UserModel newUser){
        try {
            String query = "{ call createClientUser(?, ?, ?, ?) }";
            CallableStatement cs = conn.prepareCall(query);
            cs.setString(1, newUser.getCcnit());
            cs.setString(2, newUser.getName());
            cs.setString(3, newUser.getPasswrod());
            cs.setInt(4, newUser.getClientId());
            cs.execute();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return 0;   //  should be the new registry id
    }
    public UserModel getUser(Connection conn, int userId){
        String query = "{call getUser(?) }";
        UserModel user = null;
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.setInt(1, userId);
            ResultSet rs = cs.executeQuery();
            if(rs.next()){
                user = new UserModel(
                    rs.getInt("Usu_id"),
                    rs.getString("Usu_ccnit"),
                    rs.getString("Usu_nombre"),
                    rs.getString("Usu_contra"),
                    rs.getInt("Usu_Cli_id"),
                    rs.getInt("Usu_Ases_id"),
                    rs.getInt("Usu_Lab_id"),
                    rs.getBoolean("Usu_esMetrologo"),
                    rs.getBoolean("Usu_esGerente"),
                    rs.getBoolean("Usu_esSu")
                );
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return user;
    }
    public int updateUser(Connection conn, UserModel user){
        try {
            String query = "{ call updateUser(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }";
            CallableStatement cs = conn.prepareCall(query);
            cs.setInt(1, user.getId());
            cs.setString(2, user.getCcnit());
            cs.setString(3, user.getName());
            cs.setString(4, user.getPasswrod());
            cs.setInt(5, user.getClientId());
            cs.setInt(6, user.getAdviserId());
            cs.setInt(7, user.getLabId());
            cs.setBoolean(8, user.getIsMetrologist());
            cs.setBoolean(9, user.getIsManager());
            cs.setBoolean(10, user.getIsSu());
            cs.execute();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return 0;   //  should be the new registry id
    }
}
