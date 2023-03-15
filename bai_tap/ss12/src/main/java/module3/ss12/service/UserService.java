package module3.ss12.service;

import module3.ss12.model.User;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService{
    @Override
    public void createUser(User user) throws SQLException {

    }

    @Override
    public void selectUser(int id) {

    }

    @Override
    public List<User> selectAllUser(String country) {
        return null;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return false;
    }

    @Override
    public List<User> sortByName() {
        return null;
    }

    @Override
    public User getUserById(int id) {
        return null;
    }

    @Override
    public void insertUserStore(User user) throws SQLException {

    }

    @Override
    public void addUserTransaction(User user, int[] permision) {

    }

    @Override
    public void insertUpdateWithoutTransaction() {

    }

    @Override
    public void insertUpdateUserTransaction() {

    }
}
