package RowMaper;

import java.sql.ResultSet;
import java.sql.SQLException;

import Model.Categories;
import RowMaper.column.CategoriesColumn;

public class CategoryMapper implements RowMapper<Categories> {

	@Override
	public Categories map(ResultSet r) {
		Categories categories = new Categories();
		try {
			categories.setName(r.getString(CategoriesColumn.CategoryName.name()));
			categories.setActive(r.getInt(CategoriesColumn.Active.name()));
			categories.setId(r.getInt(CategoriesColumn.CategoryId.name()));
			Categories child = new Categories();
			String childName = r.getString("child."+CategoriesColumn.CategoryName.name());
			if(childName!=null) {
				child.setName(childName);
				child.setId(r.getInt("child."+CategoriesColumn.CategoryId.name()));
				child.setActive(r.getInt("child."+CategoriesColumn.Active.name()));
				child.setParentCategoryId( r.getInt("parent."+CategoriesColumn.CategoryId.name()));
				categories.setChild(child);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return categories;
	}

}
