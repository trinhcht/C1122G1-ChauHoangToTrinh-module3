package module3.ss12.service;

import module3.ss12.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    boolean insertUser(User user);

    User selectUser(int id);

    List<User> selectAllUser();

    boolean deleteUser(int id);

    boolean updateUser(User user);

    List<User> selectUserByCountry(String country);

    List<User> sortByNameUser();
}