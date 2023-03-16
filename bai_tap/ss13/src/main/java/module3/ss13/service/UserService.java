package module3.ss13.service;

import module3.ss13.dao.UserRepository;
import module3.ss13.model.User;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    UserRepository repository = new UserRepository();
    @Override
    public void insertUser(User user) throws SQLException {
        repository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return repository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return repository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return repository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return repository.updateUser(user);
    }
}

