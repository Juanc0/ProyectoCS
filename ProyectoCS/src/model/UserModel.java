package model;

public class UserModel {
    private int id;
    private String ccnit;
    private String name;
    private String passwrod;
    private int clientId;
    private boolean isAdviser;
    private boolean isLaboratorian;
    private boolean isMetrologist;
    private boolean isManager;
    private boolean isSu;

    public UserModel() {
        this.id = 0;
        this.ccnit = null;
        this.name = null;
        this.passwrod = null;
        this.clientId = 0;
        this.isAdviser = false;
        this.isLaboratorian = false;
        this.isMetrologist = false;
        this.isManager = false;
        this.isSu = false;
    }
    // for create one
    public UserModel(String ccnit, String name, String passwrod) {
        this();
        this.ccnit = ccnit;
        this.name = name;
        this.passwrod = passwrod;
    }

    public UserModel(int id, String ccnit, String name, String passwrod, int clientId, boolean isAdviser, boolean isLaboratorian, boolean isMetrologist, boolean isManager, boolean isSu) {
        this.id = id;
        this.ccnit = ccnit;
        this.name = name;
        this.passwrod = passwrod;
        this.clientId = clientId;
        this.isAdviser = isAdviser;
        this.isLaboratorian = isLaboratorian;
        this.isMetrologist = isMetrologist;
        this.isManager = isManager;
        this.isSu = isSu;
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
    public boolean getIsAdviser() {
        return this.isAdviser;
    }
    public void setIsAdviser(boolean isAdviser) {
        this.isAdviser = isAdviser;
    }
    public boolean getIsLaboratorian() {
        return this.isLaboratorian;
    }
    public void setIsLaboratorian(boolean isLaboratorian) {
        this.isLaboratorian = isLaboratorian;
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
