package controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;
import model.ItemModel;
import model.ItemQueries;
import model.Persistence;
import view.UpdateItemView;

public class UpdateItemController implements ActionListener{
    private MainController mainController;
    private ItemModel item;
    private boolean areMandatoryFieldsFull;
    private Persistence persistence = new Persistence();
    private UpdateItemView updateItemView = new UpdateItemView();
    private ItemQueries itemQueries = new ItemQueries();
    
    public UpdateItemController(MainController mainController, ItemModel item) {
        this.mainController = mainController;
        this.item = item;
        System.out.println("UpdateItemController called");
        this.updateItemView.btnCancel.addActionListener(this);
        this.updateItemView.btnSave.addActionListener(this);
        this.updateItemView.setTitle("Modificar item");
        this.updateItemView.setLocationRelativeTo(null);
        this.initializeView();
    }
    
    private void initializeView(){
        this.updateItemView.txtId.setText(String.valueOf(this.item.getId()));
        this.updateItemView.txtName.setText(this.item.getName());
        this.updateItemView.txtBrand.setText(this.item.getBrand());
        this.updateItemView.txtModel.setText(this.item.getModel());
        this.updateItemView.txtMagnitude.setText(this.item.getMagnitude());
        this.updateItemView.spinMaxRange.setValue(this.item.getMaxRange());
        this.updateItemView.spinMinRange.setValue(this.item.getMinRange());
        this.updateItemView.spinPrecision.setValue(this.item.getPrecision());
    }
    
    private String checkContent(String value){
        if(value.isEmpty()){
            this.areMandatoryFieldsFull = false;
            return null;
        }
        return value;
    }
    
    public boolean updateItemAction(){
        this.areMandatoryFieldsFull = true;
        this.item = new ItemModel(
            checkContent(this.updateItemView.txtName.getText()),
            checkContent(this.updateItemView.txtBrand.getText()),
            checkContent(this.updateItemView.txtModel.getText()),
            checkContent(this.updateItemView.txtMagnitude.getText()),
            Integer.parseInt(checkContent(String.valueOf(this.updateItemView.spinMaxRange.getValue()))),
            Integer.parseInt(checkContent(String.valueOf(this.updateItemView.spinMinRange.getValue()))),
            Double.parseDouble(checkContent(String.valueOf(this.updateItemView.spinPrecision.getValue()))));
        if(!this.areMandatoryFieldsFull){
            JOptionPane.showMessageDialog(this.updateItemView, "there are mandatory fields empty");
        }else{
            this.persistence.openConnection("client","clientPassword");
            this.itemQueries.updateItem(this.persistence.getConnection(), this.item);
            this.persistence.closeConnection();
            this.updateItemView.dispose();
            this.mainController.refreshItemsListTable();
        }
        return true;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource() == this.updateItemView.btnSave){
            this.updateItemAction();
        } else if(e.getSource() == this.updateItemView.btnCancel){
            this.updateItemView.dispose();
        }
    }
}
