package RowMaper;

import java.sql.ResultSet;
import java.sql.SQLException;

import Model.Image;
import RowMaper.column.ImagesColumn;

public class ImageMapper implements RowMapper<Image> {

	@Override
	public Image map(ResultSet r) {
		Image image = new Image();
		try {
			int imageId = r.getInt(ImagesColumn.ImageId.name());
			int productId = r.getInt(ImagesColumn.ProductId.name());
			String imageName = r.getString(ImagesColumn.ImageName.name());
			String path = r.getString(ImagesColumn.Path.name());
			image.setId(productId);
			image.setProductId(productId);
			image.setName(imageName);
			image.setPath(path);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return image;
	}

	

}
