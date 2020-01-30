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

public class ClientProfileController implements ActionListener {
    private Persistence persistence = new Persistence();
    private UserModel user = null;
    private ClientModel client = null;
    private ClientQueries clientQueries = new ClientQueries();
    private UserQueries userQueries = new UserQueries();
    private ClientProfileView clientProfileView = new ClientProfileView();
    private boolean areMandatoryFieldsFull = false;
    
    public ClientProfileController(UserModel user) {
        System.out.println("SignupController called");
        persistence.setDbUser("profile", "profilePassword");
        this.user = user;
        this.persistence.openConnection();
        this.client = this.clientQueries.getClient(this.persistence.getConnection(), user.getClientId());
        this.persistence.closeConnection();
        this.clientProfileView.btnSave.addActionListener(this);
        this.clientProfileView.btnCancel.addActionListener(this);
        this.clientProfileView.setTitle("Perfil");
        this.clientProfileView.setLocationRelativeTo(null);
        this.clientProfileView.setVisible(true);
        this.initializeView();
    }
    
    private void initializeView(){
        this.clientProfileView.txtCCNIT.setText(this.user.getCcnit());
        this.clientProfileView.txtName.setText(this.user.getName());
        
        this.clientProfileView.txtNit.setText(this.client.getNit());
        this.clientProfileView.txtCompany.setText(this.client.getCompany());
        this.clientProfileView.txtJob.setText(this.client.getJob());
        this.clientProfileView.txtPhone.setText(this.client.getPhone());
        this.clientProfileView.txtFax.setText(this.client.getFax());
        this.clientProfileView.txtEmail.setText(this.client.getEmail());
        this.clientProfileView.txtAddress.setText(this.client.getAddress());
        this.clientProfileView.txtCity.setText(this.client.getCity());
    }
    
    
    private String checkContent(String field, String value){
        if(value.isEmpty()){
            if(     !(field.equals("txtName")
                    || field.equals("password")
                    || field.equals("txtJob")
                    || field.equals("txtFax")
                    || field.equals("txtEmail"))    ){
                this.areMandatoryFieldsFull = false;
            }
            return null;
        }
        return value;
    }
    
    
    public void saveAction(){
        
        this.areMandatoryFieldsFull = true;
        String pass = String.valueOf(this.clientProfileView.password.getPassword());
        String passConfirm = String.valueOf(this.clientProfileView.passwordConfirmation.getPassword());
        if(!pass.equals(passConfirm)){
            JOptionPane.showMessageDialog(this.clientProfileView, "passwords don't match");
        }else{
            this.user.setCcnit(checkContent("txtCCNIT", this.clientProfileView.txtCCNIT.getText()));
            this.user.setName(checkContent("txtName", this.clientProfileView.txtName.getText()));
            pass = checkContent("password", pass);
            if(pass != null)
                this.user.setPasswrod(pass);
            
            this.client.setNit(checkContent("txtNit", this.clientProfileView.txtNit.getText()));
            this.client.setCompany(checkContent("txtCompany", this.clientProfileView.txtCompany.getText()));
            this.client.setJob(checkContent("txtJob", this.clientProfileView.txtJob.getText()));
            this.client.setPhone(checkContent("txtPhone", this.clientProfileView.txtPhone.getText()));
            this.client.setFax(checkContent("txtFax", this.clientProfileView.txtFax.getText()));
            this.client.setEmail(checkContent("txtEmail", this.clientProfileView.txtEmail.getText()));
            this.client.setCity(checkContent("txtCity", this.clientProfileView.txtCity.getText()));
            this.client.setAddress(checkContent("txtAddress", this.clientProfileView.txtAddress.getText()));
            
            if(!this.areMandatoryFieldsFull){
                JOptionPane.showMessageDialog(this.clientProfileView, "there are mandatory fields empty");
            }else{
                this.persistence.openConnection();
                // (without transactions) In God we trust
                this.userQueries.updateUser(this.persistence.getConnection(), this.user);
                this.clientQueries.updateClient(this.persistence.getConnection(), this.client);
                System.out.println("success signup (I guess)");
                this.persistence.closeConnection();

                this.clientProfileView.dispose();
            }
        }
    }
    

    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource() == this.clientProfileView.btnSave){
            this.saveAction();
        } else if(e.getSource() == this.clientProfileView.btnCancel){
            this.clientProfileView.dispose();
        }
    }
}
