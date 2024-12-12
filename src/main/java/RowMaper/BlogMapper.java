package RowMaper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import Model.Blog;
import RowMaper.column.BlogsColumn;

public class BlogMapper implements RowMapper<Blog> {

	@Override
	public Blog map(ResultSet r) {
		Blog blog = new Blog();
		try {
			int blogId = r.getInt(BlogsColumn.BlogId.name());
			String content = r.getString(BlogsColumn.Content.name());
			Timestamp createdAt = r.getTimestamp("createdAt");
			blog.setId(blogId);
			blog.setContent(content);
			blog.setDateCreated(createdAt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return blog;
	}

}
