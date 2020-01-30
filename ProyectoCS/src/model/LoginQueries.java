package model;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
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
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        return 0;
    }
    
    
}
