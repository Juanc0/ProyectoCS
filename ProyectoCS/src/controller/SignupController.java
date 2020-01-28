package controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import model.Persistence;
import view.SignupView;

public class SignupController implements ActionListener {
    private Persistence persistence = new Persistence();
//    private UserQueries userQueries = new UserQueries();
    private SignupView signupView = new SignupView();
    
    public SignupController() {
        persistence.setDbUser("client", "clientPassword");
        System.out.println("SignupController called");
        this.signupView.btnSignup.addActionListener(this);
        this.signupView.btnBack.addActionListener(this);
        this.signupView.setTitle("Registrarse");
        this.signupView.setLocationRelativeTo(null);
        this.signupView.setVisible(true);
        this.personalizeView();
    }
    
    private void personalizeView(){
        //this.clientView.tlUsername.setText(this.currUser.getUsername());
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource() == this.signupView.btnSignup){
            this.signupView.dispose();
            new LoginController();
            // meter registro y hacer login
        } else if(e.getSource() == this.signupView.btnBack){
            this.signupView.dispose();
            new LoginController();
        }
    }
}
