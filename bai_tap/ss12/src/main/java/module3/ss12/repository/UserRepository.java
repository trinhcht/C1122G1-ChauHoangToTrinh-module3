package module3.ss12.repository;

import module3.ss12.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3307/demo_ss12";
    private String jdbcUserName = "root";
    private String jdbcPassword = "123456";
    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String SEARCH_BY_COUNTRY = "select * from users where country like concat('%',?,'%');";
    private static final String SQL_INSERT = "insert into employee (name, salary, created_date) values (?,?,?)";
    private static final String SQL_UPDATE = "update employee set salary=? where name=?";
    private static final String SQL_TABLE_CREATE = "create table employee"
            + "("
            + " id serial,"
            + " name varchar(100) not null,"
            + " salary numeric(15, 2) not null,"
            + " created_date timestamp,"
            + " primary key (id)"
            + ")";
    private static final String SQL_TABLE_DROP = "drop table if exists employee";

    public UserRepository() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    @Override
    public void createUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)){
           preparedStatement.setString(1,user.getName());
           preparedStatement.setString(2,user.getEmail());
           preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        //b1 : thiết lập kết nối
        try (Connection connection = getConnection(); PreparedStatement preparedStatement=connection.prepareStatement(SELECT_USER_BY_ID)){
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id,name,email,country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> selectAllUser(String country) {
        List<User> users = new ArrayList<>();
        if (country == null){
            country = "";
        }try {
            CallableStatement callableStatement = getConnection().prepareCall("call list_user(?)");
            callableStatement.setString(1,country);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country1 = resultSet.getString("country");
                users.add(new User(id,name,email,country1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDelete;
        try (Connection connection = getConnection(); PreparedStatement statement=connection.prepareStatement("call delete_user(?)")){
             statement.setInt(1,id);
             rowDelete = statement.executeUpdate() > 0;
        }
        return rowDelete;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdate;
        try(Connection connection = getConnection(); PreparedStatement statement=connection.prepareStatement("call edit_user(?,?,?,?)")){
            statement.setInt(1, user.getId());
            statement.setString(2,user.getName());
            statement.setString(3,user.getEmail());
            statement.setString(4,user.getCountry());
            rowUpdate = statement.executeUpdate()>0;
        }
        return rowUpdate;
    }

    @Override
    public List<User> sortByName() {
        boolean sortByName;
//        try {(Connection connection = getConnection(); PreparedStatement statement = connection().prepareStatement("call "))
//
//        }
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
