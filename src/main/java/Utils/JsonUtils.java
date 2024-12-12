package Utils;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

public class JsonUtils {
	
	public static void sendJsonResponse(HttpServletResponse resp, int status, String message) throws ServletException, IOException {
	    resp.setContentType("application/json");
	    resp.setCharacterEncoding("UTF-8");
	    resp.setStatus(status);
	    resp.getWriter().write(message);
	}
}
