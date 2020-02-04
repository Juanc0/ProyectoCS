package controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;
import model.ItemModel;
import model.ItemQueries;
import model.ItemClientModel;
import model.ItemClientQueries;
import model.Persistence;
import view.CreateItemView;

public class CreateItemController implements ActionListener{
    private MainController mainController;
    private int clientId;
    private boolean areMandatoryFieldsFull;
    private int copies;
    private Persistence persistence = new Persistence();
    private CreateItemView createItemView = new CreateItemView();
    private ItemQueries itemQueries = new ItemQueries();
    private ItemClientQueries itemClientQueries = new ItemClientQueries();
    
    public CreateItemController(MainController mainController, int clientId) {
        this.mainController = mainController;
        this.clientId = clientId;
        
        System.out.println("CreateItemController called");
        this.createItemView.btnCancel.addActionListener(this);
        this.createItemView.btnSave.addActionListener(this);
        this.createItemView.setTitle("Crear item");
        this.createItemView.setLocationRelativeTo(null);
        this.createItemView.setVisible(true);
    }
    
    private String checkContent(String value){
        if(value.isEmpty()){
            this.areMandatoryFieldsFull = false;
            return null;
        }
        return value;
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
    
    public boolean createItemAction(){
        this.areMandatoryFieldsFull = true;
        ItemModel newItem = new ItemModel(
            checkContent(this.createItemView.txtName.getText()),
            checkContent(this.createItemView.txtBrand.getText()),
            checkContent(this.createItemView.txtModel.getText()),
            checkContent(this.createItemView.txtMagnitude.getText()),
            (int)this.createItemView.spinMaxRange.getValue(),
            (int)this.createItemView.spinMinRange.getValue(),
            checkContent(this.createItemView.txtScale.getText()),
            (double)this.createItemView.spinPrecision.getValue());
        ItemClientModel newItemClient = new ItemClientModel(
            0,
            clientId,
            checkOptionalContent("txtSerial", this.createItemView.txtSerial.getText()),
            checkOptionalContent("txtInternId", this.createItemView.txtInternId.getText()),
            (int)this.createItemView.spinMaxUseRange.getValue(),
            (int)this.createItemView.spinMinUseRange.getValue(),
            checkOptionalContent("txtUse", this.createItemView.txtUse.getText())
        );
        this.copies = (int) this.createItemView.spinCopies.getValue();
        if(!this.areMandatoryFieldsFull){
            JOptionPane.showMessageDialog(this.createItemView, "there are mandatory fields empty");
        }else{
            this.persistence.openConnection("cliente","clientePassword");
            newItemClient.setItemId(this.itemQueries.createItem(this.persistence.getConnection(), newItem));
            while(this.copies-- > 0)
                this.itemClientQueries.createItemClient(this.persistence.getConnection(), newItemClient);
            this.persistence.closeConnection();
            this.createItemView.dispose();
            this.mainController.refreshItemsListTable();
        }
        return true;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource() == this.createItemView.btnSave){
            this.createItemAction();
        } else if(e.getSource() == this.createItemView.btnCancel){
            this.createItemView.dispose();
        }
    }
}
