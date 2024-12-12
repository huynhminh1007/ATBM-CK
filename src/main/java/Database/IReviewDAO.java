package Database;

import Model.Review;

public interface IReviewDAO extends GenericDAO<Review>{
	int save (Review review);
	boolean update (Review review);
	boolean isReviewExists(int productId,int userId);
}
