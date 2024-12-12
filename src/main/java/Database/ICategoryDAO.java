package Database;

import java.util.List;

import Model.Categories;

public interface ICategoryDAO extends GenericDAO<Categories> {
	List<Categories> findAll();
	List<Categories> findAllAdmin();
	
	Categories findById(int id);

	int save(Categories categories);

	boolean update(Categories categories);
}
