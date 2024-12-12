package Model;

public class Review extends Model{
	private int productId;
	private int userId;
	private String userName;
	private int rating;
	private String content;
	public Review(int productId, String userName, int rating, String content) {
		this.productId = productId;
		this.userName = userName;
		this.rating = rating;
		this.content = content;
	}

	public Review(int productId, int userId , int rating, String content) {
		this.productId = productId;
		this.userId = userId;
		this.rating = rating;
		this.content = content;
	}

	public Review() {
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Review [productId=" + productId + ", userName=" + userName + ", rating=" + rating + ", content="
				+ content + "]";
	}

}
