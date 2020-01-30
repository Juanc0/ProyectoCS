package controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import javax.swing.table.DefaultTableModel;
import model.ItemModel;
import model.ItemQueries;
import model.Persistence;
import model.UserModel;
import view.MainView;

public class MainController implements ActionListener {
    private Persistence persistence = new Persistence();
    private UserModel currUser;
    private ArrayList<ItemModel> items;
    private ItemQueries itemQueries = new ItemQueries();
//    private UserQueries userQueries = new UserQueries();
    private MainView mainView = new MainView();
    
    public MainController(UserModel currUser) {
        this.currUser = currUser;
        // set new dbUser and password by clients
        persistence.setDbUser("main", "mainPassword");
        System.out.println("ClientController called");
        this.mainView.btnProfile.addActionListener(this);
        this.mainView.btnLogout.addActionListener(this);
        this.mainView.btnItemsRefresh.addActionListener(this);
        this.mainView.setTitle("Cliente");
        this.mainView.setLocationRelativeTo(null);
        this.mainView.setVisible(true);
        this.personalizeView();
    }
    
    private void personalizeView(){
        //this.mainView.tlUsername.setText(this.currUser.getCcnit());
    }
    
    public void clearItemsListTable(){
        ((DefaultTableModel)this.mainView.itemsTable.getModel()).setNumRows(0);
    }
    
    public void refreshItemsListTable(){
        clearItemsListTable();
        this.persistence.openConnection();
        this.items = this.itemQueries.getItems(this.persistence.getConnection(), this.currUser.getClientId());
        this.persistence.closeConnection();
        DefaultTableModel model = (DefaultTableModel) this.mainView.itemsTable.getModel();
        for (ItemModel item : this.items) {
            model.addRow(new Object[]{
                item.getId(),
                item.getAuxId(),
                item.getName(),
                item.getBrand(),
                item.getModel(),
                item.getRange(),
                item.getMagnitude(),
                item.getMaxScope(),
                item.getMinScope(),
                item.getScale()
            });
        }
        this.mainView.itemsTable.setModel(model);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        System.out.println(e.getSource());
        if(e.getSource() == this.mainView.btnLogout){
            this.mainView.dispose();
            new LoginController();
        }else if(e.getSource() == this.mainView.btnProfile){
            if(this.currUser.getClientId() == 0){
                new ProfileController(this.currUser);
            }else{
                new ClientProfileController(this.currUser);
            }
        }else if(e.getSource() == this.mainView.btnItemsRefresh){
            refreshItemsListTable();
        }else if(e.getSource() == this.mainView.btnItemsAdd){
            new ItemController(this, this.currUser.getId());
        }
    }
}
