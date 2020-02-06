package model;

import java.util.Date;

public class PurchaseOrderModel {
    private int id;
    private int advisorId;
    private int clientId;
    private int totalPrice;
    private int finalPrice;
    private Date date;
    private String status;

    public PurchaseOrderModel(int id, int advisorId, int clientId, int totalPrice, int finalPrice, Date date, String status) {
        this.id = id;
        this.advisorId = advisorId;
        this.clientId = clientId;
        this.totalPrice = totalPrice;
        this.finalPrice = finalPrice;
        this.date = date;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAdvisorId() {
        return advisorId;
    }

    public void setAdvisorId(int advisorId) {
        this.advisorId = advisorId;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getFinalPrice() {
        return finalPrice;
    }

    public void setFinalPrice(int finalPrice) {
        this.finalPrice = finalPrice;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    
    
    
}
