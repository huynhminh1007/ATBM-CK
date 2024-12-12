package Services;

import java.util.List;
import java.util.Random;

import javax.inject.Inject;

import Database.IVerificationDAO;
import Database.VerificationDAO;
import EmailService.EmailService;
import EmailService.IEmailService;
import Model.Verification;
import Utils.TokenGenerator;

public class VerificationService implements IVerificationService {
	@Inject
	IVerificationDAO verificationDAO;
	@Inject
	IUserService userService;
	@Inject
	IEmailService emailService;

	@Override
	public List<Verification> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int save(Verification t) {
		return verificationDAO.save(t);
	}

	@Override
	public boolean update(Verification t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean sendVerificationEmail(String to, Verification verification) {
		String body = "<div style=\"font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto;\">\r\n"
				+ "        <h2>Xác thực mã OTP</h2>\r\n" + "        <p>Chào bạn,</p>\r\n"
				+ "        <p>Đây là mã OTP (One-Time Password) của bạn để xác thực tài khoản:</p>\r\n"
				+ "        <p style=\"font-size: 24px; font-weight: bold;\">Mã OTP của bạn là: "
				+ verification.getToken() + "</p>\r\n"
				+ "        <p>Vui lòng không chia sẻ mã này với bất kỳ ai khác. Hãy sử dụng mã này ngay để hoàn thành quá trình xác thực.</p>\r\n"
				+ "        <p>Trân trọng,<br> Website Lương Thực Việt</p>\r\n" + "    </div>";
		String subject = "Kích hoạt tài khoản LTV";
		return emailService.send(to, subject, body);

	}

	public boolean sendResetPasswordEmail(String to, Verification verification) {
		String body = "<div style=\"font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto;\">\r\n"
				+ "        <h2>Thiết lập lại mật khẩu của tài khoản khách hàng</h2>\r\n"
				+ "        <p>Chào bạn,</p>\r\n"
				+ "        <p>Chúng tôi nhận được yêu cầu lấy lại mật khẩu từ tài khoản của bạn tại Lương Thực Việt</p>\r\n"
				+ "        <p style=\"font-size: 24px; font-weight: bold;\">Mã OTP của bạn là: "
				+ verification.getToken() + "</p>\r\n"
				+ "        <p>Vui lòng không chia sẻ mã này với bất kỳ ai khác. Hãy sử dụng mã này ngay để hoàn thành quá trình xác thực.</p>\r\n"
				+

				"        <p>Trân trọng,<br> Website Lương Thực Việt</p>\r\n" + "</div>";
		String subject = "Thiết lập lại mật khẩu của tài khoản";
		return emailService.send(to, subject, body);

	}

	@Override
	public int verify(int userId, String token) {
		int status = verificationDAO.verify(userId, token);
		if (status == 1) {
			userService.verify(userId);
		}
		return status;
	}

	@Override
	public Verification findById(int id) {
		return verificationDAO.findById(id).get(0) == null ? null : verificationDAO.findById(id).get(0);
	}

	@Override
	public Verification create(int userId) {
		Verification verification = new Verification();
		verification.setUserId(userId);
		verification.setToken(TokenGenerator.generateNewToken());
		verification.setExpDate(System.currentTimeMillis());
		return verification;
	}

	@Override
	public int verifyForgotPassword(int userId, String token, String newPassword) {
		int status = verificationDAO.verify(userId, token);
		if (status == 1) {
			userService.changePassword(userId, newPassword);
		}
		return status;
	}

	@Override
	public List<Verification> findAll(int limit, int offSet) {
		return null;
	}

}
