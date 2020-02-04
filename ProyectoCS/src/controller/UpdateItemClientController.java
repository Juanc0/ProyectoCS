package controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;
import model.ItemClientModel;
import model.ItemClientQueries;
import model.Persistence;
import view.UpdateItemClientView;

public class UpdateItemClientController implements ActionListener{
    private MainController mainController;
    private ItemClientModel itemClient;
    private boolean areMandatoryFieldsFull;
    private Persistence persistence = new Persistence();
    private UpdateItemClientView updateItemClientView = new UpdateItemClientView();
    private ItemClientQueries itemClientQueries = new ItemClientQueries();
    
    public UpdateItemClientController(MainController mainController, ItemClientModel itemClient) {
        this.mainController = mainController;
        this.itemClient = itemClient;
        
        System.out.println("CreateItemClientController called");
        this.updateItemClientView.btnCancel.addActionListener(this);
        this.updateItemClientView.btnSave.addActionListener(this);
        this.updateItemClientView.setTitle("Crear item cliente");
        this.updateItemClientView.setLocationRelativeTo(null);
        this.updateItemClientView.setVisible(true);
        this.initializeView();
    }
    
    private void initializeView(){
        this.updateItemClientView.txtSerial.setText(this.itemClient.getSerial());
        this.updateItemClientView.txtInternId.setText(this.itemClient.getInternId());
        this.updateItemClientView.txtUse.setText(this.itemClient.getUse());
        this.updateItemClientView.spinMaxUseRange.setValue(this.itemClient.getMaxRange());
        this.updateItemClientView.spinMinUseRange.setValue(this.itemClient.getMinRange());
    }
    
    private String checkOptionalContent(String field, String value){
        if(value.isEmpty()){
            if(     !(field.equals("txtInternId")
                    || field.equals("txtUse"))    ){
                this.areMandatoryFieldsFull = false;
            }
            return null;
        }
        return value;
    }
    
    public boolean updateItemClientAction(){
        this.areMandatoryFieldsFull = true;
        this.itemClient.setSerial(checkOptionalContent("txtSerial", this.updateItemClientView.txtSerial.getText()));
        this.itemClient.setInternId(checkOptionalContent("txtInternId", this.updateItemClientView.txtInternId.getText()));
        this.itemClient.setMaxRange((int)this.updateItemClientView.spinMaxUseRange.getValue());
        this.itemClient.setMinRange((int)this.updateItemClientView.spinMinUseRange.getValue());
        this.itemClient.setUse(checkOptionalContent("txtUse", this.updateItemClientView.txtUse.getText()));
        
        if(!this.areMandatoryFieldsFull){
            JOptionPane.showMessageDialog(this.updateItemClientView, "there are mandatory fields empty");
        }else{
            this.persistence.openConnection("cliente","clientePassword");
            this.itemClientQueries.updateItemClient(this.persistence.getConnection(), this.itemClient);
            this.persistence.closeConnection();
            this.updateItemClientView.dispose();
            this.mainController.refreshItemsListTable();
        }
        return true;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource() == this.updateItemClientView.btnSave){
            this.updateItemClientAction();
        } else if(e.getSource() == this.updateItemClientView.btnCancel){
            this.updateItemClientView.dispose();
        }
    }
}
