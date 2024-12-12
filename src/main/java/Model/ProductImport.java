package Model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ProductImport implements Serializable {

    private int productId;
    private String productName;
    private double weight;
    private double costPrice;
    private int quantity;
    private Timestamp dateCreated;

    public ProductImport() {

    }

    public ProductImport(int productId, String productName, double weight, double costPrice, int quantity, Timestamp dateCreated) {
        this.productId = productId;
        this.productName = productName;
        this.weight = weight;
        this.costPrice = costPrice;
        this.quantity = quantity;
        this.dateCreated = dateCreated;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public double getCostPrice() {
        return costPrice;
    }

    public void setCostPrice(double costPrice) {
        this.costPrice = costPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Timestamp getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Timestamp dateCreated) {
        this.dateCreated = dateCreated;
    }

    @Override
    public String toString() {
        return "ProductImport{" +
                "productId=" + productId +
                ", productName='" + productName + '\'' +
                ", weight=" + weight +
                ", costPrice=" + costPrice +
                ", quantity=" + quantity +
                ", dateCreated=" + dateCreated +
                '}';
    }
}