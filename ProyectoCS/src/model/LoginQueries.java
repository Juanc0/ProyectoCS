package model;

import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import java.sql.Types;


public class LoginQueries{
    public boolean userExist(Connection conn, String ccnit){
        try {
            String query = "{ ?= CALL userExist(?) }";
            CallableStatement cs = conn.prepareCall(query);
            cs.registerOutParameter(1, Types.BOOLEAN);
            cs.setString(2, ccnit);
            cs.execute();
            return cs.getBoolean(1);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getStackTrace());
        }
        return false;
    }
    public int authUser(Connection conn, String ccnit, String password){
        try {
            String query = "{ ?= call authUser(?, ?) }";
            CallableStatement cs = conn.prepareCall(query);
            cs.registerOutParameter(1, Types.INTEGER);
            cs.setString(2, ccnit);
            cs.setString(3, password);
            cs.execute();
            return cs.getInt(1);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getStackTrace());
        }
        return 0;
    }
    
    
}
