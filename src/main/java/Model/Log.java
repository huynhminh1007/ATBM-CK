package Model;

import java.sql.Timestamp;

public class Log extends Model {
    private int id;
    private String ipAddress;
    private String url;
    private String nation;
    private String currentValue;
    private String afterValue;
    private String description;
    private LogLevel level;

    public Log(Timestamp dateCreated, Timestamp lastUpdated, int id, String ipAddress, String url, String nation, String currentValue, String afterValue, String description, LogLevel level) {
        super(dateCreated, lastUpdated);
        this.id = id;
        this.ipAddress = ipAddress;
        this.url = url;
        this.nation = nation;
        this.currentValue = currentValue;
        this.afterValue = afterValue;
        this.description = description;
        this.level = level;
    }

    public Log() {
    }

    @Override
    public String toString() {
        return "Log{" +
                "id=" + id +
                ", ipAddress='" + ipAddress + '\'' +
                ", url='" + url + '\'' +
                ", nation='" + nation + '\'' +
                ", currentValue='" + currentValue + '\'' +
                ", afterValue='" + afterValue + '\'' +
                ", description='" + description + '\'' +
                ", level=" + level +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getCurrentValue() {
        return currentValue;
    }

    public void setCurrentValue(String currentValue) {
        this.currentValue = currentValue;
    }

    public String getAfterValue() {
        return afterValue;
    }

    public void setAfterValue(String afterValue) {
        this.afterValue = afterValue;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LogLevel getLevel() {
        return level;
    }

    public void setLevel(LogLevel level) {
        this.level = level;
    }
}
