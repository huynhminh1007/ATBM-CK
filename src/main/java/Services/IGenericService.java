package Services;

import java.util.List;

public interface IGenericService<T> {
	List<T> findAll();
	List<T> findAll(int limit, int offSet);
	int save(T t);
	boolean update(T t);
}
