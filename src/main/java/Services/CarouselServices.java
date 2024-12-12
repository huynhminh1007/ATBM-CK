package Services;

import java.util.List;

import Database.CarouselDAO;
import Database.ICarouselDAO;
import Model.Carousel;

public class CarouselServices implements ICarouselServices {

	private ICarouselDAO carousel = new CarouselDAO();
	@Override
	public List<Carousel> findAll() {
		// TODO Auto-generated method stub
		return carousel.findAll();
	}

	@Override
	public List<Carousel> findAll(int limit, int offSet) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int save(Carousel t) {
		// TODO Auto-generated method stub
		return carousel.save(t);
	}

	@Override
	public boolean update(Carousel t) {
		// TODO Auto-generated method stub
		return carousel.update(t);
	}

	@Override
	public boolean delete(Carousel carousel) {
		// TODO Auto-generated method stub
		return this.carousel.delete(carousel);
	}

	@Override
	public Carousel findCarouselById(int id) {
		// TODO Auto-generated method stub
		return (Carousel) carousel.findCarouselById(id);
	}

}
