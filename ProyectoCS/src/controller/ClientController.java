package controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import model.Persistence;
import model.UserModel;
import view.ClientView;

public class ClientController implements ActionListener {
    private Persistence persistence = new Persistence();
    private UserModel currUser;
//    private UserQueries userQueries = new UserQueries();
    private ClientView clientView = new ClientView();
    
    public ClientController(UserModel currUser) {
        this.currUser = currUser;
        // set new dbUser and password by clients
        persistence.setDbUser("client", "clientPassword");
        System.out.println("ClientController called");
        this.clientView.btnLogout.addActionListener(this);
        this.clientView.setTitle("Cliente");
        this.clientView.setLocationRelativeTo(null);
        this.clientView.setVisible(true);
        this.personalizeView();
    }
    
    private void personalizeView(){
        this.clientView.tlUsername.setText(this.currUser.getUsername());
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource() == this.clientView.btnLogout){
            this.clientView.dispose();
            new LoginController();
        }
    }
}
