package GoogleLogin;


import java.util.Base64;

public class Constants {
    public static final String GOOGLE_CLIENT_ID = "590343439409-4lslffgpgrj4apstvj4plsu3864bf6iv.apps.googleusercontent.com";
    public static final String GOOGLE_CLIENT_SECRET_KEY = new String(Base64.getDecoder().decode("R09DU1BYLWRHazc2UmhDem5WcHFNekY0ZnQ0cVRaUGFDbWo="));
    public static final String GOOGLE_REDIRECT_URI = "http://localhost:8080/GoogleLogin";
    public static final String GOOGLE_GRANT_TYPE = "authorization_code";
    public static final String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static final String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    public static void main(String[] args) {
        System.out.println(GOOGLE_CLIENT_SECRET_KEY);
    }
}
