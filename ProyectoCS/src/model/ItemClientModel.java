package model;

public class ItemClientModel {
    private int id;
    private int itemId;
    private int clientId;
    private String serial;
    private String internId;
    private int maxRange;
    private int minRange;
    private String use;
    private boolean deleted;

    public ItemClientModel(int itemId, int clientId, String serial, String internId, int maxRange, int minRange, String use) {
        this.id = 0;
        this.itemId = itemId;
        this.clientId = clientId;
        this.serial = serial;
        this.internId = internId;
        this.maxRange = maxRange;
        this.minRange = minRange;
        this.use = use;
        this.deleted = false;
    }
    
    public ItemClientModel(int id, int itemId, int clientId, String serial, String internId, int maxRange, int minRange, String use, boolean deleted) {
        this.id = id;
        this.itemId = itemId;
        this.clientId = clientId;
        this.serial = serial;
        this.internId = internId;
        this.maxRange = maxRange;
        this.minRange = minRange;
        this.use = use;
        this.deleted = deleted;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }

    public String getSerial() {
        return serial;
    }

    public void setSerial(String serial) {
        this.serial = serial;
    }

    public String getInternId() {
        return internId;
    }

    public void setInternId(String internId) {
        this.internId = internId;
    }

    public int getMaxRange() {
        return maxRange;
    }

    public void setMaxRange(int maxRange) {
        this.maxRange = maxRange;
    }

    public int getMinRange() {
        return minRange;
    }

    public void setMinRange(int minRange) {
        this.minRange = minRange;
    }

    public String getUse() {
        return use;
    }

    public void setUse(String use) {
        this.use = use;
    }

    public boolean getDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }
    
    
}
