package model;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
public class UserQueries{
    public int login(Connection conn, String nick, String password){
        try {
//            Statement s = conn.createStatement();
//            String sql = "SELECT Usu_id FROM Usuario WHERE Usu_nick = '"+nick+"' AND Usu_contra = '"+password+"' limit 1;";
//            System.out.println(sql);
//            ResultSet rs = s.executeQuery(sql);
//            System.out.println("algo");
//            
//            rs.next();
//            System.out.println("re secibió algo: "+rs.getString("Usu_id"));
            
            String query = "{ call login(?, ?) }";

            CallableStatement cs = conn.prepareCall(query);
            cs.setString(1, nick);
            cs.setString(2, password);
            ResultSet rs2 = cs.executeQuery();
            rs2.next();
            System.out.println("carajo: "+rs2.getString("Usu_id"));
            System.out.println("");
            boolean hasResults = cs.execute();
            while(hasResults){
                ResultSet rs = cs.getResultSet();
                while(rs.next()){
                    System.out.println(rs.getString("Usu_id"));
                }
                hasResults = cs.getMoreResults();
            }
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        
        return 0;
    }
    
    public User getUser(Connection conn, int userId){
        String query = "{call getUser(?) }";
        User currUser = null;
        try {
            CallableStatement cs = conn.prepareCall(query);
            cs.setInt(1, userId);
            ResultSet rs = cs.executeQuery();
            if(rs.next()){
                currUser = new User(
                    rs.getInt("Usu_id"),
                    rs.getString("Usu_nick"),
                    rs.getString("Usu_rol"),
                    rs.getString("Usu_estado"),
                    rs.getString("Usu_Cli_nit"),
                    rs.getInt("Usu_Ases_id"),
                    rs.getInt("Usu_Lab_id")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserQueries.class.getName()).log(Level.SEVERE, null, ex);
        }
        return currUser;
    }
    
}
