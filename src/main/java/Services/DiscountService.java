package Services;

import java.util.List;

import javax.inject.Inject;

import Database.IDiscountDAO;
import Model.Discounts;

public class DiscountService implements IDiscountService {
	@Inject
	IDiscountDAO discountDAO;

	@Override
	public List<Discounts> findAll(int limit, int offSet) {
		return null;
	}

	@Override
	public List<Discounts> findAll() {
		return discountDAO.findAll();
	}

	@Override
	public List<Discounts> findAllActive() {
		return discountDAO.findAllActive();
	}

	@Override
	public int save(Discounts discounts) {
		return discountDAO.save(discounts);
	}

	@Override
	public boolean update(Discounts discounts) {
		return discountDAO.update(discounts);
	}

	@Override
	public boolean updateQuantity(Discounts discounts) {
		return discountDAO.updateQuantity(discounts);
	}

	@Override
	public boolean delete(Discounts discounts) {
		// TODO Auto-generated method stub
		return discountDAO.delete(discounts);
	}

	@Override
	public Discounts findById(int id) {
		return discountDAO.findById(id);
	}

	@Override
	public Discounts findByCode(String code) {
		return discountDAO.findByCode(code);
	}

	@Override
	public List<Discounts> findActiveDiscounts() {
		return discountDAO.findActiveDiscounts();
	}

	@Override
	public List<Discounts> findByCategoryId(int categoryId) {
		return discountDAO.findByCategoryId(categoryId);
	}

	@Override
	public boolean isApplicable(Discounts discounts, double condition) {
		return discountDAO.isApplicable(discounts, condition);
	}

}
