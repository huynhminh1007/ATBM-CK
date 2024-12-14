package Database;

import Model.security.Key;
import RowMaper.security.KeyMapper;

import java.util.Optional;

public class KeyDAO extends AbtractDAO<Key> {

    public Key findByUser(int userId) {
        String sql = "SELECT * FROM `keys` WHERE userId = ? ORDER BY begin_date DESC LIMIT 1";
        return Optional.ofNullable(querry(sql, new KeyMapper(), userId))
                .filter(keys -> !keys.isEmpty())
                .map(keys -> keys.get(0))
                .orElse(null);
    }

    public int insert(Key key) {
        String sql = "INSERT INTO `keys` (userId, `key`, algorithm, is_active) VALUES (?, ?, ?, ?)";

        return save(sql, key.getUserId(), key.getKey(), key.getAlgorithm(), key.isActive() ? 1 : 0);
    }

    public int update(Key key) {
        String sql = "UPDATE `keys` SET `key` = ?, algorithm = ?, is_active = ? WHERE keyId = ?";
        return save(sql, key.getKey(), key.getAlgorithm(), key.isActive() ? 1 : 0, key.getId());
    }

    public int disableKey(int keyId) {
        String sql = "UPDATE `keys` SET is_active = 0 WHERE keyId = ?";
        return save(sql, keyId);
    }

    public int disableLatestKey(int userId) {
        Key latestKey = findByUser(userId);
        System.out.println(latestKey);
        return disableKey(latestKey.getId());
    }

    public static void main(String[] args) {
        KeyDAO dao = new KeyDAO();
//        Key key = dao.findByUser(13);
//        System.out.println(key);
        dao.disableLatestKey(13);
    }
}