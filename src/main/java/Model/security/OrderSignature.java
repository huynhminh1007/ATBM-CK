package Model.security;


import java.sql.Timestamp;

public class OrderSignature {

    private int id;
    private int keyId;
    private String signatureBase64;
    private int orderId;
    private String hash;
    private Timestamp signedDate;

    public OrderSignature() {}

    public OrderSignature(int id, int keyId, String signatureBase64, int orderId, String hash, Timestamp signedDate) {
        this.id = id;
        this.keyId = keyId;
        this.signatureBase64 = signatureBase64;
        this.orderId = orderId;
        this.hash = hash;
        this.signedDate = signedDate;
    }

    public OrderSignature(int keyId, String signatureBase64, int orderId, String hash) {
        this.keyId = keyId;
        this.signatureBase64 = signatureBase64;
        this.orderId = orderId;
        this.hash = hash;
    }

    @Override
    public String toString() {
        return "OrderSignature{" +
                "id=" + id +
                ", keyId=" + keyId +
                ", signatureBase64='" + signatureBase64 + '\'' +
                ", orderId=" + orderId +
                ", hash='" + hash + '\'' +
                ", signedDate=" + signedDate +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getKeyId() {
        return keyId;
    }

    public void setKeyId(int keyId) {
        this.keyId = keyId;
    }

    public String getSignatureBase64() {
        return signatureBase64;
    }

    public void setSignatureBase64(String signatureBase64) {
        this.signatureBase64 = signatureBase64;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }

    public Timestamp getSignedDate() {
        return signedDate;
    }

    public void setSignedDate(Timestamp signedDate) {
        this.signedDate = signedDate;
    }
}
