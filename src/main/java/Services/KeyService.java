package Services;

import Database.KeyDAO;
import Model.security.Key;

import javax.annotation.ManagedBean;
import javax.inject.Inject;
import java.util.List;
@ManagedBean
public class KeyService implements IKeyService{
    @Inject
    KeyDAO keyDAO;

    @Override
    public List<Key> findAll() {
        return List.of();
    }

    @Override
    public List<Key> findAll(int limit, int offSet) {
        return List.of();
    }

    @Override
    public int save(Key key) {
        return 0;
    }

    @Override
    public boolean update(Key key) {
        return false;
    }

    @Override
    public List<Key> findByUsers(int userId) {
        return keyDAO.findByUsers(userId);
    }

    @Override
    public Key findByUser(int userId) {
        return keyDAO.findByUser(userId);
    }

    @Override
    public int disableKey(int keyId) {
        return keyDAO.disableKey(keyId);
    }
}
