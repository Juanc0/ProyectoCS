package controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import model.Persistence;
import model.User;
import model.UserQueries;
import view.Login;

public class UserController implements ActionListener {
    private Persistence persistence;
    private User user;
    private UserQueries userQueries;
    private Login login;

    public UserController(Persistence persistence, User user, UserQueries userQueries, Login login) {
        this.persistence = persistence;
        this.user = user;
        this.userQueries = userQueries;
        this.login = login;
        this.login.btnLogin.addActionListener(this);
        /*this.login.btnLogin.addActionListener(this);
        this.login.btnLogin.addActionListener(this);
        this.login.btnLogin.addActionListener(this);*/
    }
    
    public void start(){
        this.login.setTitle("Login");
        this.login.setLocationRelativeTo(null);
    }
    

    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource() == this.login.btnLogin){
            persistence.openConnection("auth", "authPassword");
            userQueries.login(
                    persistence.getConnection(),
                    String.valueOf(login.txtUsername.getText()),
                    String.valueOf(login.txtPassword.getText()));
            persistence.closeConnection();
        }
    }
}
