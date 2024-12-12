package RowMaper;

import java.sql.ResultSet;
import java.sql.SQLException;

import Model.Review;
import RowMaper.column.ReviewColumn;
import RowMaper.column.UsersColumn;

public class ReviewMapper implements RowMapper<Review>{

	@Override
	public Review map(ResultSet r) {
		Review review = new Review();
		try {
			review.setProductId(r.getInt(ReviewColumn.ProductId.name()));
			review.setContent(r.getString(ReviewColumn.Comments.name()));
			review.setRating(r.getInt(ReviewColumn.Rating.name()));
			review.setUserId(r.getInt(ReviewColumn.UserId.name()));
			review.setUserName(r.getString(UsersColumn.FullName.name()));
			review.setDateCreated(r.getTimestamp(ReviewColumn.DateCreated.name()));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return review;
				
	}

}
