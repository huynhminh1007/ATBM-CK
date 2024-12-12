package Model;

import java.sql.Timestamp;

public class Blog extends Model {
	private int id;
	private String content;

	public Blog(Timestamp dateCreated, Timestamp lastUpdated, int id, String content) {
		super(dateCreated, lastUpdated);
		this.id = id;
		this.content = content;
	}

	public Blog() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Blog [id=" + id + ", content=" + content + "]";
	}

}
