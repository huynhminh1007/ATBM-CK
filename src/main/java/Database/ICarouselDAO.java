package Database;

import java.util.List;

import Model.Carousel;


public interface ICarouselDAO {
	List<Carousel> findCarouselById(int id);

	List<Carousel> findAll();

	boolean update(Carousel carousel);

	int save(Carousel carousel);

	boolean delete(Carousel carousel);
}
