package Database;

import java.util.List;

import Model.Carousel;
import RowMaper.CarouselMapper;

public class CarouselDAO extends AbtractDAO<Carousel> implements ICarouselDAO{

	@Override
	public List<Carousel> findCarouselById(int id) {
		String sql = "SELECT * FROM carousel where carouselId = ?";
		return querry(sql, new CarouselMapper(), id);
	}

	@Override
	public List<Carousel> findAll() {
		String sql = "SELECT * FROM carousel";
		return querry(sql, new CarouselMapper());
	}

	@Override
	public boolean update(Carousel carousel) {
		String sql = "UPDATE carousel SET thumb = ? , title = ?, content = ? WHERE carouselId = ?";
		return update(sql, carousel.getThumb(), carousel.getTitle(), carousel.getContent(), carousel.getId());
	}

	@Override
	public int save(Carousel carousel) {
		String sql = "INSERT INTO carousel(thumb, title, content) VALUES(?,?,?)";
		return save(sql, carousel.getThumb(), carousel.getTitle(), carousel.getContent());
	}

	@Override
	public boolean delete(Carousel carousel) {
		String sql = "DELETE FROM carousel WHERE carouselId = ?";
		return update(sql, carousel.getId());
	}
	public static void main(String[] args) {
		CarouselDAO dao = new CarouselDAO();
		System.out.println(dao.save(new Carousel("hsfjnfdg", "abc", "gswrhrshht2")));
	}
}
