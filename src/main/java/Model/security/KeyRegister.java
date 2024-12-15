package Model.security;

public class KeyRegister {

    private String userEmail;
    private String algorithm;
    private String publicKey;
    private String usedBy;

    public KeyRegister() {}

    public KeyRegister(String userEmail, String algorithm, String publicKey, String usedBy) {
        this.userEmail = userEmail;
        this.algorithm = algorithm;
        this.publicKey = publicKey;
        this.usedBy = usedBy;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getAlgorithm() {
        return algorithm;
    }

    public void setAlgorithm(String algorithm) {
        this.algorithm = algorithm;
    }

    public String getPublicKey() {
        return publicKey;
    }

    public void setPublicKey(String publicKey) {
        this.publicKey = publicKey;
    }

    public String getUsedBy() {
        return usedBy;
    }

    public void setUsedBy(String usedBy) {
        this.usedBy = usedBy;
    }
}
