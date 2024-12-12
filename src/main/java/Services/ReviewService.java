package Services;

import java.util.List;

import javax.inject.Inject;

import Database.IReviewDAO;
import Model.Review;

public class ReviewService implements IReviewService{
	@Inject
	IReviewDAO reviewDAO;
	@Override
	public List<Review> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int save(Review review) {
		return reviewDAO.save(review);
	}

	@Override
	public boolean update(Review review) {
		return reviewDAO.update(review);
	}

	@Override
	public List<Review> findAll(int limit, int offSet) {
		// TODO Auto-generated method stub
		return null;
	}

}
