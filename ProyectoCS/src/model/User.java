package model;

public class User {
    private int id;
    private String username;
    private String rol;
    private String status;
    private String clientId;
    private int adviserId;
    private int labId;

    public User() {
    }
    
    
    public User(int id, String username, String rol, String status, String clientId, int adviserId, int labId) {
        this.id = id;
        this.username = username;
        this.rol = rol;
        this.status = status;
        this.clientId = clientId;
        this.adviserId = adviserId;
        this.labId = labId;
    }
    public int getId() {
        return this.id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getUsername() {
        return this.username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getRol() {
        return this.rol;
    }
    public void setRol(String rol) {
        this.rol = rol;
    }
    public String getStatus() {
        return this.status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getClientId() {
        return this.clientId;
    }
    public void setClientId(String clientId) {
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
    
}
