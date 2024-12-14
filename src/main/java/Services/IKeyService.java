package Services;

import Model.security.Key;

import java.util.List;

public interface IKeyService extends IGenericService<Key>{
    List<Key> findByUsers(int userId);
    Key findByUser(int userId);
    int disableKey(int keyId);
}
