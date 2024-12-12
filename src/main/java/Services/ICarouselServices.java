package Services;

import Model.Carousel;

public interface ICarouselServices extends IGenericService<Carousel>{
	boolean delete(Carousel carousel);
	Carousel findCarouselById(int id);

}
