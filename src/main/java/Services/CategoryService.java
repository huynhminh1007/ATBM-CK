package Services;

import java.util.List;

import javax.inject.Inject;

import Database.ICategoryDAO;
import Model.Categories;

public class CategoryService implements ICategoryService{
	@Inject
	ICategoryDAO categoryDAO;
	@Override
	public List<Categories> findAll(int limit, int offSet) {
		// TODO Auto-generated method stub
		return categoryDAO.findAll();
	}

	@Override
	public List<Categories> findAll() {
		// TODO Auto-generated method stub
		return categoryDAO.findAll();
	}

	@Override
	public Categories findById(int id) {
		// TODO Auto-generated method stub
		return categoryDAO.findById(id);
	}

	@Override
	public int save(Categories categories) {
		return categoryDAO.save(categories);
	}

	@Override
	public boolean update(Categories categories) {
		// TODO Auto-generated method stub
		return categoryDAO.update(categories);
	}

	@Override
	public List<Categories> findAllAdmin() {
		return categoryDAO.findAllAdmin();
	}


}
