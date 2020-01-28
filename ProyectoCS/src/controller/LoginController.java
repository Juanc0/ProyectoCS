package controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import model.Persistence;
import model.UserModel;
import model.LoginQueries;
import view.LoginView;

public class LoginController implements ActionListener {
    private Persistence persistence = new Persistence();
    private LoginQueries loginQueries = new LoginQueries();
    private LoginView loginView = new LoginView();

    public LoginController() {
        System.out.println("LoginController called");
        persistence.setDbUser("auth", "authPassword");
        this.loginView.btnLogin.addActionListener(this);
        this.loginView.btnSignup.addActionListener(this);
        this.loginView.setTitle("Iniciar Sesión");
        this.loginView.setLocationRelativeTo(null);
        this.loginView.setVisible(true);
    }
    
    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource() == this.loginView.btnLogin){
            this.persistence.openConnection();
            int userId = this.loginQueries.checkUser(
                    this.persistence.getConnection(),
                    String.valueOf(this.loginView.txtUsername.getText()),
                    String.valueOf(this.loginView.txtPassword.getText()));
            if(userId == 0){
                System.out.println("wrong sername or password");
            } else {
                UserModel currUser = this.loginQueries.getUser(this.persistence.getConnection(), userId);
                System.out.println("success loegin");
                this.loginView.dispose();
                new ClientController(currUser);
            }
            this.persistence.closeConnection();
        } else if(e.getSource() == this.loginView.btnSignup){
            this.loginView.dispose();
            new SignupController();
        }
    }
}