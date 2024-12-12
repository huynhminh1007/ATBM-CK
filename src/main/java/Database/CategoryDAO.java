package Database;

import java.util.ArrayList;
import java.util.List;

import Model.Categories;
import RowMaper.CategoryMapper;

public class CategoryDAO extends AbtractDAO<Categories> implements ICategoryDAO {
	@Override
	public List<Categories> findAll() {
		String sql = "SELECT parent.*, child.* " + "FROM categories parent "
				+ "LEFT JOIN categories child ON parent.categoryId = child.parentCategoryId "
				+ "WHERE parent.parentCategoryId = 0 AND parent.active != 0 AND (child.active != 0 or child.active is NULL) ORDER BY  parent.categoryId asc ";
		List<Categories> categories = querry(sql, new CategoryMapper());
		List<Categories> children = new ArrayList<Categories>();
		for (Categories c : categories) {
			if (c.getChild() != null) {
				children.add(c.getChild());
			}
		}
		for (Categories p : categories) {
			for (Categories c : children) {
				if (p.getId() == c.getParentCategoryId()) {
					p.addToChildren(c);
				}
			}
		}
		List<Categories> re = new ArrayList<Categories>();
		for (int i = 0; i < categories.size() - 1; i++) {
			if (categories.get(i).getId() != categories.get(i + 1).getId()) {
				re.add(categories.get(i));
			}
		}
		return re;
	}


	@Override
	public int save(Categories categories) {
		String sql = "INSERT INTO categories(parentCategoryId,categoryName,active)" + " VALUES(?,?,?)";
		return save(sql, categories.getParentCategoryId(), categories.getName(), categories.getActive());
	}

	@Override
	public boolean update(Categories categories) {

		String sql = "UPDATE categories SET parentCategoryId = ?,  categoryName =?"
				+ ",  active = ? WHERE categoryId = ?";
		return update(sql, categories.getParentCategoryId(), categories.getName(), categories.getActive(),
				categories.getId());
	}

	@Override
	public Categories findById(int id) {
		String sql = "SELECT * FROM categories WHERE categoryId = ?";
		List<Categories> categories = querry(sql, new CategoryMapper(), id);
		return categories.isEmpty() ? null : categories.get(0);
	}

	public static void main(String[] args) {
		ICategoryDAO categoryDAO = new CategoryDAO();
//		Categories categories = new Categories();
//		categories.setActive(1);
//		categories.setId(16);
//		categories.setParentCategoryId(1);
//		categories.setName("Gạo Đồng Tháp Vip");
		categoryDAO.findAll().forEach(System.out::println);
	}

	@Override
	public List<Categories> findAllAdmin() {
		String sql = "SELECT parent.*, child.* " + "FROM categories parent "
				+ "LEFT JOIN categories child ON parent.categoryId = child.parentCategoryId "
				+ "WHERE parent.parentCategoryId = 0  ORDER BY  parent.categoryId asc ";
		List<Categories> categories = querry(sql, new CategoryMapper());
		List<Categories> children = new ArrayList<Categories>();
		for (Categories c : categories) {
			if (c.getChild() != null) {
				children.add(c.getChild());
			}
		}
		for (Categories p : categories) {
			for (Categories c : children) {
				if (p.getId() == c.getParentCategoryId()) {
					p.addToChildren(c);
				}
			}
		}
		List<Categories> re = new ArrayList<Categories>();
		for (int i = 0; i < categories.size() - 1; i++) {
			if (categories.get(i).getId() != categories.get(i + 1).getId()) {
				re.add(categories.get(i));
			}
		}
		return re;
	}

}
