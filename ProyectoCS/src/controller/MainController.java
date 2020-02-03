package controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.ArrayList;
import javax.swing.table.DefaultTableModel;
import model.ItemClientModel;
import model.ItemClientQueries;
import model.ItemModel;
import model.ItemQueries;
import model.Persistence;
import model.UserModel;
import view.MainView;

public class MainController implements ActionListener, MouseListener{
    private Persistence persistence = new Persistence();
    private UserModel currUser;
    private int selectedItemId = 0;
    private ArrayList<ItemModel> items;
    private ArrayList<ItemClientModel> itemsClient;
    private ItemQueries itemQueries = new ItemQueries();
    private ItemClientQueries itemClientQueries = new ItemClientQueries();
//    private UserQueries userQueries = new UserQueries();
    private MainView mainView = new MainView();
    
    public MainController(UserModel currUser) {
        this.currUser = currUser;
        System.out.println("ClientController called");
        this.mainView.btnProfile.addActionListener(this);
        this.mainView.btnLogout.addActionListener(this);
        this.mainView.btnItemsAdd.addActionListener(this);
        this.mainView.btnItemsDelete.addActionListener(this);
        this.mainView.btnItemsRefresh.addActionListener(this);
        this.mainView.tableItems.addMouseListener(this);
        
        this.mainView.btnItemsClientAdd.addActionListener(this);
        this.mainView.btnItemsClientDelete.addActionListener(this);
        this.mainView.btnItemsClientRefresh.addActionListener(this);
        this.mainView.tableItemsClient.addMouseListener(this);
        this.mainView.setTitle("Cliente");
        this.mainView.setLocationRelativeTo(null);
        this.mainView.setVisible(true);
        this.personalizeView();
    }
    
    private void personalizeView(){
        //this.mainView.tlUsername.setText(this.currUser.getCcnit());
    }
    
    public void clearItemsListTable(){
        ((DefaultTableModel)this.mainView.tableItems.getModel()).setNumRows(0);
    }
    public void clearItemsClientListTable(){
        ((DefaultTableModel)this.mainView.tableItemsClient.getModel()).setNumRows(0);
    }
    
    public void refreshItemsListTable(){
        this.mainView.btnItemsDelete.setEnabled(false);
        this.mainView.btnItemsClientAdd.setEnabled(false);
        this.mainView.btnItemsClientDelete.setEnabled(false);
        clearItemsListTable();
        clearItemsClientListTable();
        this.persistence.openConnection("cliente", "clientePassword");
        this.items = this.itemQueries.getItems(this.persistence.getConnection(), this.currUser.getClientId());
        this.persistence.closeConnection();
        DefaultTableModel model = (DefaultTableModel) this.mainView.tableItems.getModel();
        for (ItemModel item : this.items) {
            model.addRow(new Object[]{
                item.getId(),
                item.getName(),
                item.getBrand(),
                item.getModel(),
                item.getMagnitude(),
                item.getMaxRange(),
                item.getMinRange(),
                item.getPrecision()
            });
        }
        this.mainView.tableItems.setModel(model);
    }
    
    public void refreshItemsClientListTable(){
        this.mainView.btnItemsClientDelete.setEnabled(false);
        clearItemsClientListTable();
        
        this.persistence.openConnection("cliente","clientePassword");
        this.itemsClient = this.itemClientQueries.getItemsClient(this.persistence.getConnection(), this.selectedItemId, this.currUser.getClientId());
        this.persistence.closeConnection();
        DefaultTableModel model = (DefaultTableModel) this.mainView.tableItemsClient.getModel();
        for (ItemClientModel itemClient : this.itemsClient) {
            model.addRow(new Object[]{
                itemClient.getId(),
                itemClient.getSerial(),
                itemClient.getInternId(),
                itemClient.getMaxRange(),
                itemClient.getMinRange(),
                itemClient.getUse(),
                itemClient.getDeleted()
            });
        }
        this.mainView.tableItems.setModel(model);
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
        }else if(e.getSource() == this.mainView.btnItemsAdd){
            new CreateItemController(this, this.currUser.getId());
        }else if(e.getSource() == this.mainView.btnItemsDelete){
            // query to "delete"
        }else if(e.getSource() == this.mainView.btnItemsRefresh){
            refreshItemsListTable();
        }
        
        
        else if(e.getSource() == this.mainView.btnItemsClientAdd){
            new CreateItemClientController(this, this.selectedItemId, this.currUser.getClientId());
        }else if(e.getSource() == this.mainView.btnItemsClientDelete){
            // query to "delete"
        }else if(e.getSource() == this.mainView.btnItemsClientRefresh){
            refreshItemsClientListTable();
        }
    }

    @Override
    public void mouseClicked(MouseEvent e) {
        System.out.println("just for fun:\t\t\t"+e.getClickCount());
        if(e.getComponent() == this.mainView.tableItems){
            if (e.getClickCount() == 1) {
                System.out.println("click on the first table\t\tone click");
                // select specifics instances
                // enable three buttons
            }
            if (e.getClickCount() > 1) {
                System.out.println("click on the first table\t\tmultiple clicks");
                // open update Item view
            }
        }else if(e.getComponent() == this.mainView.tableItemsClient){
            if (e.getClickCount() == 1) {
                System.out.println("click on the second table\t\tone click");
                // select specifics instances
                // enable three buttons
            }
            if (e.getClickCount() > 1) {
                System.out.println("click on the second table\t\tmultiple clicks");
                // open update Item view
            }
        }
    }
    

    @Override
    public void mousePressed(MouseEvent e) {}
    @Override
    public void mouseReleased(MouseEvent e) {}
    @Override
    public void mouseEntered(MouseEvent e) {}
    @Override
    public void mouseExited(MouseEvent e) {}
}
