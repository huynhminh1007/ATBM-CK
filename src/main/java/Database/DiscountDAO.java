package Database;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import Model.Discounts;
import RowMaper.DiscountMapper;

public class DiscountDAO extends AbtractDAO<Discounts> implements IDiscountDAO {
	@Override
	public List<Discounts> findAll() {
		String sql = "SELECT * FROM discounts";
		return querry(sql, new DiscountMapper());
	}

	@Override
	public int save(Discounts discounts) {
		String sql = "INSERT INTO discounts(amount,code,type,conditions,expDate,categoryId,description, quantity) VALUES (?,?,?,?,?,?,?,?)";
		return save(sql, discounts.getAmount(), discounts.getCode(), discounts.getType(), discounts.getCondition(),
				discounts.getExpDate(),discounts.getCategoryId(),discounts.getDescription(), discounts.getQuantity());
	}
	@Override
	public List<Discounts> findAllActive() {
		String sql = "SELECT * FROM discounts WHERE quantity > 0";
		return querry(sql, new DiscountMapper());
	}
	@Override
	public boolean update(Discounts discounts) {
		String sql = "UPDATE discounts SET amount =?,code =?,type =?,conditions = ?,expDate = ?,categoryId =?, description=?, quantity=? where discountId =?";
		return update(sql, discounts.getAmount(), discounts.getCode(), discounts.getType(), discounts.getCondition(),
				discounts.getExpDate(),discounts.getCategoryId(), discounts.getDescription(), discounts.getQuantity(), discounts.getId());
	}

	@Override
	public boolean updateQuantity(Discounts discounts) {
		String sql = "UPDATE discounts SET quantity =? where discountId =?";
		return update(sql, discounts.getQuantity(), discounts.getId());
	}


	@Override
	public boolean delete(Discounts discounts) {
		String sql = "DELETE FROM discounts WHERE discountId = ?";
		return update(sql, discounts.getId());
	}

	@Override
	public Discounts findById(int id) {
		String sql = "SELECT * FROM discounts WHERE discountId = ?";
		List<Discounts> discounts = querry(sql, new DiscountMapper(), id);
		return  !discounts.isEmpty() ? discounts.get(0) : null;

	}

	@Override
	public Discounts findByCode(String code) {
		String sql = "SELECT * FROM discounts WHERE code = ?";
		List<Discounts> discounts = querry(sql, new DiscountMapper(), code);
		return  !discounts.isEmpty() ? discounts.get(0) : null;
	}

	@Override
	public List<Discounts> findActiveDiscounts() {
		String sql = "SELECT * FROM discounts WHERE expDate > NOW()";
		return querry(sql, new DiscountMapper());
	}

	@Override
	public List<Discounts> findByCategoryId(int categoryId) {
		String sql = "SELECT * FROM discounts WHERE categoryId = ?";
		return querry(sql, new DiscountMapper(), categoryId);
	}

	@Override
	public boolean isApplicable(Discounts discounts, double condition) {
		if (discounts.getCondition() <= condition && discounts.getExpDate().after(new java.util.Date())) {
			return true;
		}
		return false;
	}

	public static void main(String[] args) throws ParseException {
		DiscountDAO dao = new DiscountDAO();

		// Test findAll
		List<Discounts> allDiscounts = dao.findAll();
//		System.out.println("All Discounts: " + allDiscounts);
//
//		// Test save
//		String selectedDate = "25/01/2024";
//		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
//		java.util.Date date = dateFormat.parse(selectedDate);
//		Date sqlDate = new Date(date.getTime());
//		Discounts newDiscount = new Discounts(0, 10, "NEWCODE", "type1", "description", 100.0, sqlDate, 1, 50);
//		int newDiscountId = dao.save(newDiscount);
////		System.out.println("Saved new discount with ID: " + newDiscountId);
//
//		// Test findById
//		Discounts discountById = dao.findById(newDiscountId);
//		System.out.println("Found Discount by ID: " + discountById);

		// Test findByCode
		Discounts discountByCode = dao.findByCode("LTV10PT");
		System.out.println("Found Discount by Code: " + discountByCode);
//
////		// Test update
//		discountById.setAmount(20);
//		boolean updateResult = dao.update(discountById);
//		System.out.println("Update result: " + updateResult);
//
//		// Test delete
//		boolean deleteResult = dao.delete(discountById);
//		System.out.println("Delete result: " + deleteResult);
//
//		// Test findActiveDiscounts
//		List<Discounts> activeDiscounts = dao.findActiveDiscounts();
//		System.out.println("Active Discounts: " + activeDiscounts);
//
//		// Test findByCategoryId
//		List<Discounts> discountsByCategory = dao.findByCategoryId(1);
//		System.out.println("Discounts by Category: " + discountsByCategory);
//
//		// Test isApplicable
//		boolean applicable = dao.isApplicable(newDiscount, 200.0);
//		System.out.println("Is discount applicable: " + applicable);
	}
}
