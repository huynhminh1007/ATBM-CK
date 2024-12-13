package Model.security;

import java.sql.Timestamp;

public class Key {

    private int id;
    private int userId;
    private String key;
    private String algorithm;
    private Timestamp beginDate;
    private Timestamp updateDate;
    private boolean isActive;

    public Key() {

    }

    public Key(int id, int userId, String key, String algorithm, Timestamp beginDate, Timestamp updateDate, boolean isActive) {
        this.id = id;
        this.userId = userId;
        this.key = key;
        this.algorithm = algorithm;
        this.beginDate = beginDate;
        this.updateDate = updateDate;
        this.isActive = isActive;
    }

    public Key(int userId, String key, String algorithm, boolean isActive) {
        this.userId = userId;
        this.key = key;
        this.algorithm = algorithm;
        this.isActive = isActive;
    }

    @Override
    public String toString() {
        return "Key{" +
                "id=" + id +
                ", userId=" + userId +
                ", key='" + key + '\'' +
                ", algorithm='" + algorithm + '\'' +
                ", beginDate=" + beginDate +
                ", updateDate=" + updateDate +
                ", isActive=" + isActive +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getAlgorithm() {
        return algorithm;
    }

    public void setAlgorithm(String algorithm) {
        this.algorithm = algorithm;
    }

    public Timestamp getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(Timestamp beginDate) {
        this.beginDate = beginDate;
    }

    public Timestamp getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Timestamp updateDate) {
        this.updateDate = updateDate;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }
}
