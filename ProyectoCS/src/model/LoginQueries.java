package model;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
public class LoginQueries{
    public int checkUser(Connection conn, String ccnit, String password){
        try {
            String query = "{ call checkUser(?, ?) }";
            CallableStatement cs = conn.prepareCall(query);
            cs.setString(1, ccnit);
            cs.setString(2, password);
            ResultSet rs = cs.executeQuery();
            if(rs.next())
                return rs.getInt("Usu_id");
        } catch (SQLException ex) {
            Logger.getLogger(LoginQueries.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public UserModel getUser(Connection conn, int userId){
        String query = "{call getUser(?) }";
        UserModel currUser = null;
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.setInt(1, userId);
            ResultSet rs = cs.executeQuery();
            if(rs.next()){
                currUser = new UserModel(
                    rs.getInt("Usu_id"),
                    rs.getString("Usu_ccnit"),
                    rs.getString("Usu_nombre"),
                    rs.getString("Usu_Cli_nit"),
                    rs.getInt("Usu_Ases_id"),
                    rs.getInt("Usu_Lab_id"),
                    rs.getBoolean("Usu_esMetrologo"),
                    rs.getBoolean("Usu_esGerente"),
                    rs.getBoolean("Usu_esSu")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginQueries.class.getName()).log(Level.SEVERE, null, ex);
        }
        return currUser;
    }
    
}
