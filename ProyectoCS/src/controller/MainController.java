package controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.ArrayList;
import javax.swing.table.DefaultTableModel;
import model.ClientQueries;
import model.ItemClientModel;
import model.ItemClientQueries;
import model.ItemModel;
import model.ItemQueries;
import model.Persistence;
import model.PurchaseOrderModel;
import model.PurchaseOrderQueries;
import model.UserModel;
import model.UserQueries;
import view.MainView;

public class MainController implements ActionListener, MouseListener{
    private Persistence persistence = new Persistence();
    private UserModel currUser;
    private int selectedItemId = 0;
    private int selectedItemClientId = 0;
    private ArrayList<ItemModel> items;
    private ArrayList<ItemClientModel> itemsClient;
    private ArrayList<PurchaseOrderModel> clientPurchaseOrders;
    private ArrayList<PurchaseOrderModel> advisorPurchaseOrders;
    private UserQueries userQueries = new UserQueries();
    private ClientQueries clientQueries = new ClientQueries();
    private PurchaseOrderQueries purchaseOrderQueries = new PurchaseOrderQueries();
    private ItemQueries itemQueries = new ItemQueries();
    private ItemClientQueries itemClientQueries = new ItemClientQueries();
    private MainView mainView = new MainView();
    
    public MainController(UserModel currUser) {
        this.currUser = currUser;
        System.out.println("ClientController called");
        if(!this.currUser.getIsManager()){
            this.mainView.tabs.remove(3);
        }
        if(!this.currUser.getIsAdviser()){
            this.mainView.tabs.remove(2);
        }else{
            this.refreshAdvisorPurchaseOrdersTable();
        }
        if(this.currUser.getClientId() == 0){
            this.mainView.tabs.remove(1);
            this.mainView.tabs.remove(0);
        }else{
            this.refreshItemsListTable();
            this.refreshClientPurchaseOrdersTable();
        }
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
    public void clearClientPurchaseOrdersTable(){
        ((DefaultTableModel)this.mainView.tableClientPurchaseOrders.getModel()).setNumRows(0);
    }
    public void clearAdvisorPurchaseOrdersTable(){
        ((DefaultTableModel)this.mainView.tableAdvisorPurchaseOrders.getModel()).setNumRows(0);
    }
    public void refreshClientPurchaseOrdersTable(){
        this.clearClientPurchaseOrdersTable();
        this.persistence.openConnection("cliente", "clientePassword");
        this.clientPurchaseOrders = this.purchaseOrderQueries.getClientPurchaseOrders(this.persistence.getConnection(), this.currUser.getClientId());
        this.persistence.closeConnection();
        DefaultTableModel model = (DefaultTableModel) this.mainView.tableClientPurchaseOrders.getModel();
        this.persistence.openConnection("cliente", "clientePassword");
        for (PurchaseOrderModel purchaseOrder : this.clientPurchaseOrders) {
            model.addRow(new Object[]{
                purchaseOrder.getId(),
                purchaseOrder.getDate(),
                this.userQueries.getUser(this.persistence.getConnection(), purchaseOrder.getAdvisorId()).getName(),
                purchaseOrder.getFinalPrice(),
                purchaseOrder.getStatus()
            });
        }
        this.mainView.tableClientPurchaseOrders.setModel(model);
    }
    public void refreshAdvisorPurchaseOrdersTable(){
        this.clearAdvisorPurchaseOrdersTable();
        this.persistence.openConnection("asesor", "asesorPassword");
        this.advisorPurchaseOrders = this.purchaseOrderQueries.getAdvisorPurchaseOrders(this.persistence.getConnection(), this.currUser.getId());
        this.persistence.closeConnection();
        this.persistence.openConnection("asesor", "asesorPassword");
        DefaultTableModel model = (DefaultTableModel) this.mainView.tableAdvisorPurchaseOrders.getModel();
        for (PurchaseOrderModel purchaseOrder : this.advisorPurchaseOrders) {
            model.addRow(new Object[]{
                purchaseOrder.getId(),
                purchaseOrder.getDate(),
                this.clientQueries.getClient(this.persistence.getConnection(), purchaseOrder.getClientId()).getCompany(),
                purchaseOrder.getTotalPrice(),
                purchaseOrder.getFinalPrice(),
                purchaseOrder.getStatus()
            });
        }
        this.persistence.closeConnection();
        this.mainView.tableAdvisorPurchaseOrders.setModel(model);
    }
    
    public void refreshItemsListTable(){
        this.mainView.btnItemsDelete.setEnabled(false);
        this.mainView.btnItemsClientAdd.setEnabled(false);
        this.mainView.btnItemsClientDelete.setEnabled(false);
        this.mainView.btnItemsClientRefresh.setEnabled(false);
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
                item.getType(),
                item.getBrand(),
                item.getModel(),
                item.getMagnitude(),
                item.getMaxRange(),
                item.getMinRange(),
                item.getPrecision(),
                item.getScale()
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
        this.mainView.tableItemsClient.setModel(model);
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
            new CreateItemController(this, this.currUser.getClientId());
        }else if(e.getSource() == this.mainView.btnItemsDelete){
            this.persistence.openConnection("cliente", "clientePassword");
            //this.itemClientQueries.deleteItemsClient(this.persistence.getConnection(), selectedItemClientId);
            this.itemQueries.deleteItem(this.persistence.getConnection(), this.selectedItemId);
            this.persistence.closeConnection();
            this.refreshItemsListTable();
        }else if(e.getSource() == this.mainView.btnItemsRefresh){
            this.refreshItemsListTable();
        }
        
        else if(e.getSource() == this.mainView.btnItemsClientAdd){
            new CreateItemClientController(this, this.selectedItemId, this.currUser.getClientId());
        }else if(e.getSource() == this.mainView.btnItemsClientDelete){
            this.persistence.openConnection("cliente", "clientePassword");
            this.itemClientQueries.deleteItemClient(this.persistence.getConnection(), this.selectedItemClientId);
            this.persistence.closeConnection();
            this.refreshItemsClientListTable();
        }else if(e.getSource() == this.mainView.btnItemsClientRefresh){
            this.refreshItemsClientListTable();
        }
    }

    @Override
    public void mouseClicked(MouseEvent e) {
        if(e.getComponent() == this.mainView.tableItems){
            if (e.getClickCount() == 1) {
                int selectedRow = this.mainView.tableItems.getSelectedRow();
                this.selectedItemId = (int) this.mainView.tableItems.getModel().getValueAt(selectedRow, 0);
                this.refreshItemsClientListTable();
                this.mainView.btnItemsDelete.setEnabled(true);
                this.mainView.btnItemsClientAdd.setEnabled(true);
                this.mainView.btnItemsClientRefresh.setEnabled(true);
            }
            if (e.getClickCount() > 1) {
                this.persistence.openConnection("cliente", "clientePassword");
                ItemModel item = this.itemQueries.getItem(this.persistence.getConnection(), this.selectedItemId);
                new UpdateItemController(this, item);
                this.persistence.closeConnection();
            }
        }else if(e.getComponent() == this.mainView.tableItemsClient){
            if (e.getClickCount() == 1) {
                int selectedRow = this.mainView.tableItemsClient.getSelectedRow();
                this.selectedItemClientId = (int) this.mainView.tableItemsClient.getModel().getValueAt(selectedRow, 0);
                this.mainView.btnItemsClientDelete.setEnabled(true);
            }
            if (e.getClickCount() > 1) {
                this.persistence.openConnection("cliente", "clientePassword");
                new UpdateItemClientController(this, this.itemClientQueries.getItemClient(this.persistence.getConnection(), this.selectedItemClientId));
                this.persistence.closeConnection();
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

