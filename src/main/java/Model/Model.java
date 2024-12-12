package Model;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Locale;

public class Model {
	private Timestamp dateCreated;
	private Timestamp lastUpdated;

	public Model(Timestamp dateCreated, Timestamp lastUpdated) {
		this.dateCreated = dateCreated;
		this.lastUpdated = lastUpdated;
	}

	public Model() {
	}

	public Timestamp getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Timestamp dateCreated) {
		this.dateCreated = dateCreated;
	}

	public Timestamp getLastUpdated() {
		return lastUpdated;
	}

	public void setLastUpdated(Timestamp lastUpdated) {
		this.lastUpdated = lastUpdated;
	}
	public String getDateCreatedString() {
		SimpleDateFormat sdf = new SimpleDateFormat("d 'tháng' M 'năm' YYYY" , new Locale("vi"));
		String vietnameseDate = sdf.format(this.dateCreated);
		return vietnameseDate;
	}
	@Override
	public String toString() {
		return "Model [dateCreated=" + dateCreated + ", lastUpdated=" + lastUpdated + "]";
	}

	
}
