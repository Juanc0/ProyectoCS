package model;

public class ItemModel {
    private int id;
    private String name;
    private String type;
    private String brand;
    private String model;
    private String magnitude;
    private int maxRange;
    private int minRange;
    private double precision;
    private String scale;
    private boolean deleted;
    
    
    public ItemModel() {
        this.id = 0;
        this.name = null;
        this.type = null;
        this.brand = null;
        this.model = null;
        this.magnitude = null;
        this.maxRange = 0;
        this.minRange = 0;
        this.precision = 0.0;
        this.scale = null;
        this.deleted = false;
    }
    public ItemModel(String name, String brand, String model, String magnitude, int maxRange, int minRange, String scale, double precision ) {
        this.id = 0;
        this.name = name;
        this.type = null;
        this.brand = brand;
        this.model = model;
        this.magnitude = magnitude;
        this.maxRange = maxRange;
        this.minRange = minRange;
        this.precision = precision;
        this.scale = scale;
        this.deleted = false;
    }
    public ItemModel(int id, String name, String type, String brand, String model, String magnitude, int maxRange, int minRange, double precision, String scale, boolean deleted) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.brand = brand;
        this.model = model;
        this.magnitude = magnitude;
        this.maxRange = maxRange;
        this.minRange = minRange;
        this.precision = precision;
        this.scale = scale;
        this.deleted = deleted;
    }

    public int getId() {
        return this.id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return this.name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getType() {
        return this.type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public String getBrand() {
        return this.brand;
    }
    public void setBrand(String brand) {
        this.brand = brand;
    }
    public String getModel() {
        return this.model;
    }
    public void setModel(String model) {
        this.model = model;
    }
    public String getMagnitude() {
        return this.magnitude;
    }
    public void setMagnitude(String magnitude) {
        this.magnitude = magnitude;
    }
    public int getMaxRange() {
        return this.maxRange;
    }
    public void setMaxRange(int maxRange) {
        this.maxRange = maxRange;
    }
    public int getMinRange() {
        return this.minRange;
    }
    public void setMinRange(int minRange) {
        this.minRange = minRange;
    }
    public double getPrecision() {
        return this.precision;
    }
    public void setPrecision(double precision) {
        this.precision = precision ;
    }
    public String getScale() {
        return this.scale;
    }
    public void setScale(String scale) {
        this.scale = scale;
    }
    public boolean getDeleted() {
        return this.deleted;
    }
    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }
}
