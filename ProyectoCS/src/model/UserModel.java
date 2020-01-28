package model;

public class UserModel {
    private int id = 0;
    private String ccnit;
    private String name = null;
    private String passwrod = null;
    private String clientNit = null;
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
    public UserModel(int id, String ccnit, String name, String clientNit, int adviserId, int labId, boolean isMetrologist, boolean isManager, boolean isSu) {
        this.id = id;
        this.ccnit = ccnit;
        this.name = name;
        this.clientNit = clientNit;
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
    public String getClientNit() {
        return this.clientNit;
    }
    public void setClientNit(String clientNit) {
        this.clientNit = clientNit;
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
    public boolean isIsMetrologist() {
        return this.isMetrologist;
    }
    public void setIsMetrologist(boolean isMetrologist) {
        this.isMetrologist = isMetrologist;
    }
    public boolean isIsManager() {
        return this.isManager;
    }
    public void setIsManager(boolean isManager) {
        this.isManager = isManager;
    }
    public boolean isIsSu() {
        return this.isSu;
    }
    public void setIsSu(boolean isSu) {
        this.isSu = isSu;
    }
   
}
