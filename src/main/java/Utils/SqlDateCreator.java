package Utils;

import java.sql.Date;

public class SqlDateCreator {
	public static Date getTime() {
		java.util.Date date = new java.util.Date();
		return new Date(date.getTime());
	}
}
