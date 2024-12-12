package Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

public class Wishlist {
	
	private Map<Integer, Product> wishlist;

	public Wishlist(List<Product> productList) {
		super();
		this.wishlist = productList.stream().collect(Collectors.toMap(Product::getId, p -> p));
	}
	
	public Wishlist() {
		this.wishlist = new HashMap<Integer, Product>();
	}
	
	public List<Product> getWishlist() {
		return wishlist.values().stream().collect(Collectors.toList());
	}
	
	public Set<Integer> getWishListId() {
		return wishlist.keySet();
	}
	
	public boolean add(Product product) {
		int id = product.getId();
		
		if(wishlist.containsKey(id)) {
			wishlist.remove(id);
			return false;
		}
		wishlist.put(id, product);
		return true;
	}
	
	public int size() {
		return wishlist.size();
	}
}
