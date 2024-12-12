package Controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Address;
import Model.Log;
import Model.User;
import Services.IAddressService;
import Services.IUserService;
import Services.LogServiceManager;
import Services.MLogFactory;
import Utils.BHash;

/**
 * Servlet implementation class UserInfo
 */
@WebServlet("/UserInfo")
public class UserInfo extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Inject
    IAddressService addressService;

    @Inject
    IUserService userService;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : request.getParameter("action").trim();
        switch (action) {
            case "changePassword" -> changePassword(request, response);
            case "addAddress" -> addAddress(request, response);
            case "changeAddress" -> changeAddress(request, response);
            case "deleteAddress" -> deleteAddress(request, response);
            case "updateInfo" -> updateInfo(request, response);
            default -> throw new IllegalArgumentException("Unexpected value: " + action);
        }
    }

    private void updateInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String newFullName = request.getParameter("newFullName");
        String newPhone = request.getParameter("newPhone");
        System.out.println(newPhone);
        User user = (User) request.getSession().getAttribute("user");
        user.setFullName(newFullName);
        user.setPhone(newPhone);
        userService.update(user);
        LogServiceManager.getLogService().saveLog(MLogFactory
                .getLog(request, this, 2,
                        "Người dùng cập nhập thông tin: Họ và tên mới  " + newFullName + ", số điện thoại mới: " + newPhone));
        request.getSession().setAttribute("user", user);
        request.getRequestDispatcher("tai-khoan.jsp").forward(request, response);
    }

    private void deleteAddress(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int index = Integer.valueOf(request.getParameter("indexAddress")) - 1;
        String menu = request.getParameter("menu");
        request.setAttribute("menu", menu);
        User user = (User) request.getSession().getAttribute("user");
        Address address = user.getAddresses().get(index);
        addressService.delete(address);
        user = userService.findUserById(user.getId());
        LogServiceManager.getLogService().saveLog(MLogFactory.getLog(request, this, 4, "Người dùng xóa địa chỉ "));
        request.getSession().setAttribute("user", user);
        request.getRequestDispatcher("tai-khoan.jsp").forward(request, response);
    }

    private void changeAddress(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("fullName");
        String phone = request.getParameter("PhoneNumber");
        String province = request.getParameter("Province");
        String districts = request.getParameter("District");
        String wards = request.getParameter("Ward");
        String description = request.getParameter("Description");
        boolean isDefault = request.getParameter("default") != null;
        int index = Integer.valueOf(request.getParameter("pos")) - 1;
        String menu = request.getParameter("menu");
        request.setAttribute("menu", menu);
        User user = (User) request.getSession().getAttribute("user");
        Address address = new Address();
        // bỏ địa chỉ mặc địn hiện tại
        if (isDefault) {
            addressService.updateDefaultAddress(user.getId());
        }
        var currentAddress = user.getAddresses().get(index);
        address.setId(user.getAddresses().get(index).getId());
        address.setUserId(user.getId());
        address.setNameUser(name);
        address.setPhoneUser(phone);
        address.setDefault(isDefault);
        address.setProvince(province);
        address.setDistricts(districts);
        address.setWards(wards);
        address.setDescription(description);
        addressService.update(address);
        user = userService.findUserById(user.getId());
        LogServiceManager.getLogService().saveLog(MLogFactory.getLog(request, this, 3, currentAddress, address));
        request.getSession().setAttribute("user", user);
        request.setAttribute("success", "Cập nhật địa chỉ thành công");
        request.getRequestDispatcher("tai-khoan.jsp").forward(request, response);

    }

    private void addAddress(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("fullName");
        boolean isDefault = request.getParameter("default") != null;
        String phone = request.getParameter("PhoneNumber");
        String province = request.getParameter("Province");
        String districts = request.getParameter("District");
        String wards = request.getParameter("Ward");
        String description = request.getParameter("Description");
        String menu = request.getParameter("menu");
        request.setAttribute("menu", menu);

        User user = (User) request.getSession().getAttribute("user");
        // bỏ địa chỉ mặc định hiện tại
        if (isDefault) {
            addressService.updateDefaultAddress(user.getId());
        }
        Address address = new Address();
        address.setUserId(user.getId());
        address.setDefault(isDefault);
        address.setNameUser(name);
        address.setPhoneUser(phone);
        address.setProvince(province);
        address.setDistricts(districts);
        address.setWards(wards);
        address.setDescription(description);
        int addressId = addressService.save(address);
        address.setId(addressId);
        user = userService.findUserById(user.getId());
        request.getSession().setAttribute("user", user);
        request.setAttribute("success", "Thêm địa chỉ thành công");
        Log log = MLogFactory.getLog(request, this, 2, address);
        log.setDescription("Người dùng thêm địa chỉ mới");
        LogServiceManager.getLogService().saveLog(log);
        request.getRequestDispatcher("tai-khoan.jsp").forward(request, response);
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String OldPassword = request.getParameter("oldPassword");
        String Password = request.getParameter("newPassword");
        String ConfirmPassword = request.getParameter("confirmPass");
        User user = (User) request.getSession().getAttribute("user");
        String status = "";
        String url = "tai-khoan.jsp";
        if (!BHash.login(OldPassword, user.getPasswordHash())) {
            status = "Bạn đã nhập sai mật khẩu cũ. Vui lòng nhập lại!";
        } else if (!Password.equals(ConfirmPassword)) {
            status = "Xác nhận lại mật khẩu đăng nhập";
        } else if (OldPassword.equals(Password)) {
            status = "Mật khẩu mới không được trùng với mật khẩu cũ!";
        } else {
            status = "Đổi mật khẩu thành công.";
            LogServiceManager.getLogService().saveLog(MLogFactory.getLog(request, this, 3, "Người dùng đổi mật khẩu"));
            String newPasswordHash = BHash.hashWithSalt(Password);
            user.setPasswordHash(newPasswordHash);
            userService.update(user);
            request.getSession().setAttribute("user", user);
        }

        response.getWriter().append(status);
//		request.getRequestDispatcher(url).forward(request, response);

    }

}
