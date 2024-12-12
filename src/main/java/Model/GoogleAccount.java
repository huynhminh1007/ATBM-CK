package Model;

public class GoogleAccount {
    private String id, email, name;
    private boolean verified_email;

    public GoogleAccount(String id, String email, String name, boolean verified_email) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.verified_email = verified_email;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isVerified_email() {
        return verified_email;
    }

    public void setVerified_email(boolean verified_email) {
        this.verified_email = verified_email;
    }

    @Override
    public String toString() {
        return "GoogleAccount{" +
                "id='" + id + '\'' +
                ", email='" + email + '\'' +
                ", name='" + name + '\'' +
                ", verified_email=" + verified_email +
                '}';
    }
}
