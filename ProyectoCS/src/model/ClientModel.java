package model;

public class ClientModel {
    private int id;
    private String nit;
    private String company;
    private String job;
    private String phone;
    private String fax;
    private String email;
    private String city;
    private String address;
    private String type;

    // for create one
    
    public ClientModel() {
        this.id = 0;
        this.nit = null;
        this.company = null;
        this.job = null;
        this.phone = null;
        this.fax = null;
        this.email = null;
        this.city = null;
        this.address = null;
        this.type = null;
    }
    public ClientModel(String nit, String company, String job, String phone, String fax, String email, String city, String address, String type) {
        this();
        this.nit = nit;
        this.company = company;
        this.job = job;
        this.phone = phone;
        this.fax = fax;
        this.email = email;
        this.city = city;
        this.address = address;
        this.type = type;
    }
    // for show his information
    public ClientModel(int id, String nit, String company, String job, String phone, String fax, String email, String city, String address, String type) {
        this.id = id;
        this.nit = nit;
        this.company = company;
        this.job = job;
        this.phone = phone;
        this.fax = fax;
        this.email = email;
        this.city = city;
        this.address = address;
        this.type = type;
    }

    public int getId() {
        return this.id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNit() {
        return this.nit;
    }
    public void setNit(String nit) {
        this.nit = nit;
    }
    public String getCompany() {
        return this.company;
    }
    public void setCompany(String company) {
        this.company = company;
    }
    public String getJob() {
        return this.job;
    }
    public void setJob(String job) {
        this.job = job;
    }
    public String getPhone() {
        return this.phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getFax() {
        return this.fax;
    }
    public void setFax(String fax) {
        this.fax = fax;
    }
    public String getEmail() {
        return this.email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getCity() {
        return this.city;
    }
    public void setCity(String city) {
        this.city = city;
    }
    public String getAddress() {
        return this.address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getType() {
        return this.type;
    }
    public void setType(String type) {
        this.type = type;
    }
}
