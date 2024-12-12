package Services;

import java.util.List;

import Model.Discounts;

public interface IDiscountService extends IGenericService<Discounts> {
	List<Discounts> findAll();

	List<Discounts> findAllActive();

	int save(Discounts discounts);

	boolean update(Discounts discounts);
	boolean updateQuantity(Discounts discounts);
	boolean delete(Discounts discounts);

	Discounts findById(int id);

	Discounts findByCode(String code);

	List<Discounts> findActiveDiscounts();

	List<Discounts> findByCategoryId(int categoryId);

	boolean isApplicable(Discounts discounts, double condition);
}
