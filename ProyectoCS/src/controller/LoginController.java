package controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;
import model.Persistence;
import model.UserModel;
import model.LoginQueries;
import model.UserQueries;
import view.LoginView;

public class LoginController implements ActionListener {
    private Persistence persistence = new Persistence();
    private LoginQueries loginQueries = new LoginQueries();
    private UserQueries userQueries = new UserQueries();
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
    
    public boolean loginAction(String ccnit, String password){
        this.persistence.openConnection();
        int userId = this.loginQueries.checkUser(this.persistence.getConnection(), ccnit, password);
        if(userId == 0){
            JOptionPane.showMessageDialog(this.loginView, "wrong ccnit or password");
            return false;
        }
        UserModel currUser = this.userQueries.getUser(this.persistence.getConnection(), userId);
        System.out.println("success loegin");
        this.persistence.closeConnection();
        
        this.loginView.dispose();
        new MainController(currUser);
        return true;
    }
    
    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource() == this.loginView.btnLogin){
            loginAction(this.loginView.txtCCNIT.getText(),
                        String.valueOf(this.loginView.txtPassword.getPassword()));
        } else if(e.getSource() == this.loginView.btnSignup){
            this.loginView.dispose();
            new ClientSignupController();
        }
    }
}
