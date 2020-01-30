package model;

public class ItemModel {
    private int id;
    private String auxId;
    private String name;
    private String brand;
    private String model;
    private String scope;
    private String magnitude;
    private String maxRange;
    private String minRange;
    private Double scale;

    public ItemModel(int id, String auxId, String name, String brand, String model, String range, String magnitude, String maxScope, String minScope, double scale) {
        this.id = id;
        this.auxId = auxId;
        this.name = name;
        this.brand = brand;
        this.model = model;
        this.range = range;
        this.magnitude = magnitude;
        this.maxScope = maxScope;
        this.minScope = minScope;
        this.scale = scale;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAuxId() {
        return auxId;
    }

    public void setAuxId(String auxId) {
        this.auxId = auxId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getRange() {
        return range;
    }

    public void setRange(String range) {
        this.range = range;
    }

    public String getMagnitude() {
        return magnitude;
    }

    public void setMagnitude(String magnitude) {
        this.magnitude = magnitude;
    }

    public String getMaxScope() {
        return maxScope;
    }

    public void setMaxScope(String maxScope) {
        this.maxScope = maxScope;
    }

    public String getMinScope() {
        return minScope;
    }

    public void setMinScope(String minScope) {
        this.minScope = minScope;
    }

    public Double getScale() {
        return scale;
    }

    public void setScale(double scale) {
        this.scale = scale;
    }
    
    
    
}
