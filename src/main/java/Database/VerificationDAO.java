package Database;

import java.util.List;

import Model.Verification;
import RowMaper.VerificationMapper;

public class VerificationDAO extends AbtractDAO<Verification> implements IVerificationDAO {
	public static final int EXPIRE_SECOND = 60 * 1000;

	@Override
	public int save(Verification verification) {
		String sql = "INSERT INTO verification(userId,token,expDate) VALUES (?,?,?)";
		return save(sql, verification.getUserId(), verification.getToken(), verification.getExpDate());
	}

	@Override
	public List<Verification> findById(int id) {
		String sql = "SELECT * FROM verification WHERE userId =?";
		return querry(sql, new VerificationMapper(), id);
	}

	@Override
	public int verify(int userId, String token) {
		String sql = "SELECT * FROM verification WHERE userId =? and token =?";
		List<Verification> re = querry(sql, new VerificationMapper(), userId, token);
		long now = System.currentTimeMillis();
		if (re.size()==0)
			return 0;
		Verification verification = re.get(0);
		/**
		 * 0: Sai mã xác nhận 1: Thành công 2: Hết hạn
		 */

		if (now - verification.getExpDate() > EXPIRE_SECOND)
			return 2;
		return 1;
	}
public static void main(String[] args) {
	VerificationDAO dao = new VerificationDAO();
	Verification verification = new Verification(123, "34563", 13333);
	System.out.println(dao.save(verification));
}
}
