package Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.User;

/**
 * Servlet Filter implementation class Authentication_Filter
 */
@WebFilter (filterName = "Authentication_Filter", urlPatterns = { "/tai-khoan.jsp" })
public class Authentication_Filter implements Filter {

    /**
     * Default constructor. 
     */
    public Authentication_Filter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		  	HttpServletRequest httpRequest = (HttpServletRequest) request;
	        HttpServletResponse httpResponse = (HttpServletResponse) response;
	        HttpSession session = httpRequest.getSession();
			User user = (User) session.getAttribute("user");
	        // Kiểm tra xem người dùng đã đăng nhập hay chưa
	        if (user == null) {
	            // Chưa đăng nhập, chuyển hướng đến trang đăng nhập
	            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
	        } else if(user.getRoleId() != 2 ){
	        	httpResponse.sendRedirect(httpRequest.getContextPath() + "/page404.jsp");
				return;
	        }
	        else {
	            // Đã đăng nhập, tiếp tục xử lý
	            chain.doFilter(request, response);
	        }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
