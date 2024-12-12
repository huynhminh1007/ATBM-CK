package Model;

public class Carousel {
	
	private int id;
	private String thumb;
	private String title;
	private String content;
	public Carousel(int id, String thumb, String title, String content) {
		this.id = id;
		this.thumb = thumb;
		this.title = title;
		this.content = content;
	}
	public Carousel() {
	}
	
	
	public Carousel(String thumb, String title, String content) {
		super();
		this.thumb = thumb;
		this.title = title;
		this.content = content;
	}
	@Override
	public String toString() {
		return "Carousel [id=" + id + ", thumb=" + thumb + ", title=" + title + ", content=" + content + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getThumb() {
		return thumb;
	}
	public void setThumb(String thumb) {
		this.thumb = thumb;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	

}
