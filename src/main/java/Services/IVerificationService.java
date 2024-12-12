package Services;

import Model.Verification;

public interface IVerificationService extends IGenericService<Verification> {
	int verify(int userId, String token);
	int verifyForgotPassword(int userId, String token,String newPassword);
	Verification findById(int id);
	boolean sendVerificationEmail(String email, Verification verification);
	boolean sendResetPasswordEmail(String email, Verification verification);
	Verification create(int userId);
}
