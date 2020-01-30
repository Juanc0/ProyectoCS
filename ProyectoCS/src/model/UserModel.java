package model;

public class UserModel {
    private int id = 0;
    private String ccnit;
    private String name = null;
    private String passwrod = null;
    private int clientId = 0;
    private int adviserId = 0;
    private int labId = 0;
    private boolean isMetrologist = false;
    private boolean isManager = false;
    private boolean isSu = false;

    // for I have no idea
    public UserModel() {
    }
    // for login
    public UserModel(int id, String ccnit, String passwrod) {
        this.id = id;
        this.ccnit = ccnit;
        this.passwrod = passwrod;
    }
    // for client view background info
    public UserModel(int id, String ccnit, String name, String password, int clientId, int adviserId, int labId, boolean isMetrologist, boolean isManager, boolean isSu) {
        this.id = id;
        this.ccnit = ccnit;
        this.name = name;
        this.passwrod = password;
        this.clientId = clientId;
        this.adviserId = adviserId;
        this.labId = labId;
        this.isMetrologist = isMetrologist;
        this.isManager = isManager;
        this.isSu = isSu;
    }
    // for create one
    public UserModel(String ccnit, String name, String passwrod) {
        this.ccnit = ccnit;
        this.name = name;
        this.passwrod = passwrod;
    }

    
    
    public int getId() {
        return this.id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getCcnit() {
        return this.ccnit;
    }
    public void setCcnit(String ccnit) {
        this.ccnit = ccnit;
    }
    public String getName() {
        return this.name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPasswrod() {
        return this.passwrod;
    }
    public void setPasswrod(String passwrod) {
        this.passwrod = passwrod;
    }
    public int getClientId() {
        return this.clientId;
    }
    public void setClientId(int clientId) {
        this.clientId = clientId;
    }
    public int getAdviserId() {
        return this.adviserId;
    }
    public void setAdviserId(int adviserId) {
        this.adviserId = adviserId;
    }
    public int getLabId() {
        return this.labId;
    }
    public void setLabId(int labId) {
        this.labId = labId;
    }
    public boolean getIsMetrologist() {
        return this.isMetrologist;
    }
    public void setIsMetrologist(boolean isMetrologist) {
        this.isMetrologist = isMetrologist;
    }
    public boolean getIsManager() {
        return this.isManager;
    }
    public void setIsManager(boolean isManager) {
        this.isManager = isManager;
    }
    public boolean getIsSu() {
        return this.isSu;
    }
    public void setIsSu(boolean isSu) {
        this.isSu = isSu;
    }
   
}
