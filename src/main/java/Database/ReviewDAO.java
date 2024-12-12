package Database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;

import Model.Review;
import RowMaper.ReviewMapper;
import RowMaper.RowMapper;
import RowMaper.column.ReviewColumn;

public class ReviewDAO extends AbtractDAO<Review> implements IReviewDAO {

	@Override
	public int save(Review review) {
		if(isReviewExists(review.getProductId(), review.getUserId())) return 0;
		String sql = "INSERT INTO reviews(userId,productId,rating,comments) VALUES (?,?,?,?)";
		return save(sql, review.getUserId(), review.getProductId(), review.getRating(), review.getContent());
	}

	@Override
	public boolean update(Review review) {
		String sql = "UPDATE reviews SET rating = ? , comments = ? WHERE userId=? AND productId =?";
		return update(sql, review.getRating(), review.getContent(), review.getUserId(), review.getProductId());
	}

	@Override
	public boolean isReviewExists(int productId, int userId) {
		String sql = "SELECT * FROM reviews WHERE productId = ? AND userId = ?";
		RowMapper<Review> reviewMapper = new RowMapper<Review>() {
			@Override
			public Review map(ResultSet r) {
				Review review = new Review();
				try {
					review.setProductId(r.getInt(ReviewColumn.ProductId.name()));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return review;
			}
		};
		List<Review> reviews =querry(sql, reviewMapper,productId,userId);
		return !reviews.isEmpty();

	}
	
}
