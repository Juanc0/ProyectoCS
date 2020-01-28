package controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import model.ClientModel;
import model.ClientSignupQueries;
import model.Persistence;
import model.UserModel;
import view.ClientSignupView;

public class ClientSignupController implements ActionListener {
    private Persistence persistence = new Persistence();
    private UserModel user = null;
    private ClientSignupQueries clientSignupQueries = new ClientSignupQueries();
    private ClientSignupView signupView = new ClientSignupView();
    private boolean areMandatoryFieldsFull = false;
    
    public ClientSignupController() {
        persistence.setDbUser("auth", "authPassword");
        System.out.println("SignupController called");
        this.signupView.btnSignup.addActionListener(this);
        this.signupView.btnCancel.addActionListener(this);
        this.signupView.setTitle("Registrarse");
        this.signupView.setLocationRelativeTo(null);
        this.signupView.setVisible(true);
        this.personalizeView();
    }
    
    private void personalizeView(){
        //this.signupView.txt.setText("");
    }
    
    public void setAreMandatoryFieldsFull(boolean areMandatoryFieldsFull){
        this.areMandatoryFieldsFull = areMandatoryFieldsFull;
    }
    
    private String checkContent(String field, String value){
        if(value.isEmpty()){
            if(     !(field.equals("txtName")
                    || field.equals("txtJob")
                    || field.equals("txtFax")
                    || field.equals("txtEmail"))    ){
                setAreMandatoryFieldsFull(false);
            }
            return null;
        }
        return value;
    }
    
    public boolean signupAction(UserModel newUser, ClientModel newClient){
        this.persistence.openConnection();
        // (without transactions) In God we trust
        this.clientSignupQueries.createUser(this.persistence.getConnection(), newUser);
        this.clientSignupQueries.createClient(this.persistence.getConnection(), newClient);
        System.out.println("success signup (I guess)");
        this.persistence.closeConnection();
        
        this.signupView.dispose();
        new LoginController().loginAction(newUser.getCcnit(), newUser.getPasswrod());
        return true;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource() == this.signupView.btnSignup){
            setAreMandatoryFieldsFull(true);
            if(    !String.valueOf(this.signupView.password.getPassword()).equals(
                    String.valueOf(this.signupView.passwordConfirmation.getPassword()))){
                System.out.println("passwords doesn't match");
            }else{
                UserModel newUser = new UserModel(
                        checkContent("txtCCNIT", this.signupView.txtCCNIT.getText()),
                        checkContent("txtName", this.signupView.txtName.getText()),
                        checkContent("password", String.valueOf(this.signupView.password.getPassword())));
                ClientModel newClient = new ClientModel(
                        checkContent("txtCompany", this.signupView.txtNit.getText()),
                        checkContent("txtCompany", this.signupView.txtCompany.getText()),
                        checkContent("txtJob", this.signupView.txtJob.getText()),
                        checkContent("txtPhone", this.signupView.txtPhone.getText()),
                        checkContent("txtFax", this.signupView.txtFax.getText()),
                        checkContent("txtEmail", this.signupView.txtEmail.getText()),
                        checkContent("txtCity", this.signupView.txtCity.getText()),
                        checkContent("txtAddress", this.signupView.txtAddress.getText()));
                if(!this.areMandatoryFieldsFull){
                    System.out.println("there are mandatory fields empty");
                }else{
                    this.signupAction(newUser, newClient);
                }
            }
        } else if(e.getSource() == this.signupView.btnCancel){
            this.signupView.dispose();
            new LoginController();
        }
    }
}
