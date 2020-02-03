package controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;
import model.ClientModel;
import model.ClientQueries;
import model.Persistence;
import model.UserModel;
import model.UserQueries;
import view.ClientSignupView;
import view.ClientProfileView;
import view.ProfileView;

public class ProfileController implements ActionListener {
    private Persistence persistence = new Persistence();
    private UserModel user = null;
    private UserQueries userQueries = new UserQueries();
    private ProfileView profileView = new ProfileView();
    private boolean areMandatoryFieldsFull = false;
    
    public ProfileController(UserModel user) {
        System.out.println("SignupController called");
        this.user = user;
        this.profileView.btnSave.addActionListener(this);
        this.profileView.btnCancel.addActionListener(this);
        this.profileView.setTitle("Perfil");
        this.profileView.setLocationRelativeTo(null);
        this.profileView.setVisible(true);
        this.initializeView();
    }
    
    private void initializeView(){
        this.profileView.txtCCNIT.setText(this.user.getCcnit());
        this.profileView.txtName.setText(this.user.getName());
    }
    
    
    private String checkContent(String field, String value){
        if(value.isEmpty()){
            if(!(field.equals("txtName")||field.equals("password"))){
                this.areMandatoryFieldsFull = false;
            }
            return null;
        }
        return value;
    }
    
    
    public void saveAction(){
        
        this.areMandatoryFieldsFull = true;
        String pass = String.valueOf(this.profileView.password.getPassword());
        String passConfirm = String.valueOf(this.profileView.passwordConfirmation.getPassword());
        if(!pass.equals(passConfirm)){
            JOptionPane.showMessageDialog(this.profileView, "passwords don't match");
        }else{
            this.user.setCcnit(checkContent("txtCCNIT", this.profileView.txtCCNIT.getText()));
            this.user.setName(checkContent("txtName", this.profileView.txtName.getText()));
            pass = checkContent("password", pass);
            if(pass != null)
                this.user.setPasswrod(pass);
            
            if(!this.areMandatoryFieldsFull){
                JOptionPane.showMessageDialog(this.profileView, "there are mandatory fields empty");
            }else{
                this.persistence.openConnection("main", "mainPassword");
                // (without transactions) In God we trust
                this.userQueries.updateUser(this.persistence.getConnection(), this.user);
                System.out.println("success update (I guess)");
                this.persistence.closeConnection();

                this.profileView.dispose();
            }
        }
    }
    

    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource() == this.profileView.btnSave){
            this.saveAction();
        } else if(e.getSource() == this.profileView.btnCancel){
            this.profileView.dispose();
        }
    }
}
