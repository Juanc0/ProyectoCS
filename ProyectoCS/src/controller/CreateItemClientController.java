package controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;
import model.ClientModel;
import model.ItemModel;
import model.ItemQueries;
import model.ItemClientModel;
import model.ItemClientQueries;
import model.Persistence;
import model.UserModel;
import view.CreateItemClientView;

public class CreateItemClientController implements ActionListener{
    private MainController mainController;
    private int itemId = 0;
    private int clientUserId = 0;
    private boolean areMandatoryFieldsFull;
    private int copies;
    private Persistence persistence = new Persistence();
    private CreateItemClientView createItemClientView = new CreateItemClientView();
    private ItemClientQueries itemClientQueries = new ItemClientQueries();
    
    public CreateItemClientController(MainController mainController, int itemId, int clientUserId) {
        this.mainController = mainController;
        this.itemId = itemId;
        this.clientUserId = clientUserId;
        
        
        System.out.println("CreateItemClientController called");
        this.createItemClientView.btnCancel.addActionListener(this);
        this.createItemClientView.btnSave.addActionListener(this);
        this.createItemClientView.setTitle("Crear item cliente");
        this.createItemClientView.setLocationRelativeTo(null);
        this.createItemClientView.setVisible(true);
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
    
    public boolean createItemClientAction(){
        this.areMandatoryFieldsFull = true;
        ItemClientModel newItemClient = new ItemClientModel(
            this.itemId,
            this.clientUserId,
            checkOptionalContent("txtSerial", this.createItemClientView.txtSerial.getText()),
            checkOptionalContent("txtInternId", this.createItemClientView.txtInternId.getText()),
            (int)this.createItemClientView.spinMaxUseRange.getValue(),
            (int)this.createItemClientView.spinMinUseRange.getValue(),
            checkOptionalContent("txtUse", this.createItemClientView.txtUse.getText())
        );
        
        this.copies = (int) this.createItemClientView.spinCopies.getValue();
        if(!this.areMandatoryFieldsFull){
            JOptionPane.showMessageDialog(this.createItemClientView, "there are mandatory fields empty");
        }else{
            this.persistence.openConnection("cliente","clientePassword");
            while(this.copies-- > 0)
                this.itemClientQueries.createItemClient(this.persistence.getConnection(), newItemClient);
            this.persistence.closeConnection();
            this.createItemClientView.dispose();
            this.mainController.refreshItemsListTable();
        }
        return true;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource() == this.createItemClientView.btnSave){
            this.createItemClientAction();
        } else if(e.getSource() == this.createItemClientView.btnCancel){
            this.createItemClientView.dispose();
        }
    }
}
