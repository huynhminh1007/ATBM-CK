package Services;

import java.util.List;

import javax.annotation.ManagedBean;
import javax.inject.Inject;

import Model.Product;
import Model.User;
import Database.IUserDAO;
import Utils.BHash;

@ManagedBean
public class UserServices implements IUserService {
    @Inject
    IUserDAO userDAO;

    @Override
    public List<User> findAll() {
        return userDAO.findAll();
    }

    @Override
    public int save(User t) {
        return userDAO.save(t);
    }

    @Override
    public boolean update(User t) {
        return userDAO.update(t);
    }

    @Override
    public boolean delete(User user) {
        return userDAO.delete(user);
    }

    @Override
    public User findUserByEmail(String email) {
        return userDAO.findUserByEmail(email);
    }

    @Override
    public int signUp(User user) {
        return userDAO.save(user);
    }

    @Override
    public boolean updateRole(User user) {
        return userDAO.updateRole(user);
    }

    @Override
    public boolean verify(int userId) {
        User u = userDAO.findUserById(userId);
        u.getStatus().setId(1);
        return update(u);
    }

    @Override
    public User findUserById(int id) {
        User re = userDAO.findUserById(id);
        return re == null ? null : re;
    }

    @Override
    public boolean changePassword(int userId, String newPassword) {
        User user = userDAO.findUserById(userId);
        user.setPasswordHash(BHash.hashWithSalt(newPassword));
        return userDAO.update(user);
    }

    @Override
    public List<User> findAll(int limit, int offSet) {
        // TODO Auto-generated method stub
        return userDAO.findAll();
    }

    @Override
    public List<Product> getWishlist(int id) {
        return userDAO.getWithlist(id);
    }

    @Override
    public boolean addWishlist(int userId, int productId) {
        return userDAO.addWishlist(userId, productId);
    }

    @Override
    public boolean removeWishlist(int userId, int productId) {
        // TODO Auto-generated method stub
        return userDAO.removeWishlist(userId, productId);
    }

    @Override
    public boolean updateStatus(User user) {
        // TODO Auto-generated method stub
        return userDAO.updateStatus(user);
    }
}
