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

public class ClientSignupController implements ActionListener {
    private Persistence persistence = new Persistence();
    private UserModel user = null;
    private ClientModel client = null;
    private ClientQueries clientQueries = new ClientQueries();
    private UserQueries userQueries = new UserQueries();
    private ClientSignupView clientSignupView = new ClientSignupView();
    private boolean areMandatoryFieldsFull = false;
    
    public ClientSignupController() {
        System.out.println("SignupController called");
        persistence.setDbUser("auth", "authPassword");
        this.clientSignupView.btnSignup.addActionListener(this);
        this.clientSignupView.btnCancel.addActionListener(this);
        this.clientSignupView.setTitle("Registrarse");
        this.clientSignupView.setLocationRelativeTo(null);
        this.clientSignupView.setVisible(true);
        this.initializeView();
    }
    
    private void initializeView(){
        //this.clientSignupView.txt.setText("");
    }
    
    private String checkContent(String field, String value){
        if(value.isEmpty()){
            if(     !(field.equals("txtName")
                    || field.equals("txtJob")
                    || field.equals("txtFax")
                    || field.equals("txtEmail"))    ){
                this.areMandatoryFieldsFull = false;
            }
            return null;
        }
        return value;
    }
    
    public boolean signupAction(){
        this.persistence.openConnection();
        // (without transactions) In God we trust
        this.clientQueries.createClient(this.persistence.getConnection(), this.client);
        this.user.setClientId(this.clientQueries.getClientId(this.persistence.getConnection(), client.getNit()));
        this.userQueries.createUser(this.persistence.getConnection(), this.user);
        System.out.println("success signup (I guess)");
        this.persistence.closeConnection();
        
        this.clientSignupView.dispose();
        new LoginController().loginAction(this.user.getCcnit(), this.user.getPasswrod());
        return true;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource() == this.clientSignupView.btnSignup){
            this.areMandatoryFieldsFull = true;
            String pass = String.valueOf(this.clientSignupView.password.getPassword());
            String passConfirm = String.valueOf(this.clientSignupView.passwordConfirmation.getPassword());
            if(    !pass.equals(passConfirm)){
                JOptionPane.showMessageDialog(this.clientSignupView, "passwords don't match");
            }else{
                this.client = new ClientModel(
                        checkContent("txtNit", this.clientSignupView.txtNit.getText()),
                        checkContent("txtCompany", this.clientSignupView.txtCompany.getText()),
                        checkContent("txtJob", this.clientSignupView.txtJob.getText()),
                        checkContent("txtPhone", this.clientSignupView.txtPhone.getText()),
                        checkContent("txtFax", this.clientSignupView.txtFax.getText()),
                        checkContent("txtEmail", this.clientSignupView.txtEmail.getText()),
                        checkContent("txtCity", this.clientSignupView.txtCity.getText()),
                        checkContent("txtAddress", this.clientSignupView.txtAddress.getText()));
                this.user = new UserModel(
                        checkContent("txtCCNIT", this.clientSignupView.txtCCNIT.getText()),
                        checkContent("txtName", this.clientSignupView.txtName.getText()),
                        checkContent("password", pass));
                if(!this.areMandatoryFieldsFull){
                    JOptionPane.showMessageDialog(this.clientSignupView, "there are mandatory fields empty");
                }else{
                    this.signupAction();
                }
            }
        } else if(e.getSource() == this.clientSignupView.btnCancel){
            this.clientSignupView.dispose();
            new LoginController();
        }
    }
}
