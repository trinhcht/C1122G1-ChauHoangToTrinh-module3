package module3.ss12.service;

import module3.ss12.model.User;
import module3.ss12.repository.IUserRepository;
import module3.ss12.repository.impl.UserRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements IUserService {
    IUserRepository userRepository = new UserRepositoryImpl();

    @Override
    public boolean insertUser(User user) {
        try {
            this.userRepository.insertUser(user);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public User selectUser(int id) {
        return this.userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUser() {
        return userRepository.selectAllUser();
    }

    @Override
    public boolean deleteUser(int id) {
        try {
            this.userRepository.deleteUser(id);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateUser(User user) {
        try {
            this.userRepository.updateUser(user);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<User> selectUserByCountry(String country) {
        return this.userRepository.selectUserByCountry(country);
    }

    @Override
    public List<User> sortByNameUser() {
        return this.userRepository.sortByNameUser();
    }
}