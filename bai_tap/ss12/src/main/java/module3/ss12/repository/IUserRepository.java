package module3.ss12.repository;

import module3.ss12.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    void createUser(User user) throws SQLException;
    User selectUser(int id);
    List<User> selectAllUser(String country);
    boolean deleteUser(int id) throws SQLException;
    boolean updateUser(User user) throws SQLException;
    List<User> sortByName();
    User getUserById(int id);
    void insertUserStore(User user) throws SQLException;
    void addUserTransaction (User user,int[] permision);
    void insertUpdateWithoutTransaction();
    void insertUpdateUserTransaction();
}
