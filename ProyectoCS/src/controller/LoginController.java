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
        this.persistence.setDbUser("auth", "authPassword");
        this.loginView.btnLogin.addActionListener(this);
        this.loginView.btnSignup.addActionListener(this);
        this.loginView.setTitle("Iniciar Sesión");
        this.loginView.setLocationRelativeTo(null);
        this.loginView.setVisible(true);
    }
    
    public boolean loginAction(String ccnit, String password){
        this.persistence.openConnection("auth", "authPassword");
        boolean userExist = this.loginQueries.userExist(this.persistence.getConnection(), ccnit);
        int userId = this.loginQueries.authUser(this.persistence.getConnection(), ccnit, password);
        this.persistence.closeConnection();
        
        if(ccnit.isEmpty() || ccnit.isBlank() || password.isEmpty() || password.isEmpty()){
            JOptionPane.showMessageDialog(this.loginView, "Empty parameters");
        }else if(!userExist){
            JOptionPane.showMessageDialog(this.loginView, "Wrong ccnit");
        }else if(userId == 0){
            JOptionPane.showMessageDialog(this.loginView, "Wrong password");
        }else{
            this.persistence.openConnection("auth", "authPassword");
            UserModel currUser = this.userQueries.getUser(this.persistence.getConnection(), userId);
            this.persistence.closeConnection();
            this.loginView.dispose();
            new MainController(currUser);
            return true;
        }
        return false;
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
