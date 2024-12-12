package RowMaper;

import java.sql.ResultSet;
import java.sql.SQLException;

import Model.Carousel;
import RowMaper.column.CarouselColumn;

public class CarouselMapper implements RowMapper<Carousel>{

	@Override
	public Carousel map(ResultSet r) {
		Carousel carousel = new Carousel();
		try {
			carousel.setId(r.getInt(CarouselColumn.CarouselId.name()));
			carousel.setThumb(r.getString(CarouselColumn.Thumb.name()));
			carousel.setTitle(r.getString(CarouselColumn.Title.name()));
			carousel.setContent(r.getString(CarouselColumn.Content.name()));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return carousel;
	}

}
