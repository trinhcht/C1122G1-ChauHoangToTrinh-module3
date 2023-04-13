package module3.ss12.repository.impl;

import module3.ss12.model.Author;
import module3.ss12.model.Book;
import module3.ss12.model.Category;
import module3.ss12.repository.IBookRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookRepository implements IBookRepository {
    private static List<Book> bookList = new ArrayList<>();
    private static final String SELECT_BY_ID = "select b_id, title, page_size,authors.a_id,authors.a_name,category.c_id,category.c_name from books\n" +
            "left join category on category.c_id = books.c_id\n" +
            "left join authors on authors.a_id = books.a_id where b_id = ?";
    private static final String SELECT_ALL_BOOK = "select b_id, title, page_size,authors.a_id,authors.a_name,category.c_id,category.c_name from books\n" +
            "left join category on category.c_id = books.c_id\n" +
            "left join authors on authors.a_id = books.a_id";
    private static final String INSERT_BOOK_SQL = "insert into books(title, page_size, books.a_id, books.c_id) values(?,?,?,?)";
    private static final String UPDATE_BOOK_SQL = "update books set title = ?,page_size = ?, a_id = ?, c_id = ? where b_id = ?;";
    private final String DELETE_BOOK = "delete from books where b_id = ?";

    @Override
    public List<Book> findByName(String name) {
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Book> bookList2 = new ArrayList<>();
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("select b_id, title, page_size, books.c_id, books.a_id, category.c_id, category.c_name, authors.a_id, authors.a_name from books " +
                        "left join category on category.c_id = books.c_id " +
                        "left join authors on authors.a_id = books.a_id where books.title =?");
                preparedStatement.setString(1, name);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("b_id");
                    String title = resultSet.getString("title");
                    int pageSize = resultSet.getInt("page_size");
                    int authorId = resultSet.getInt("books.a_id");
                    String authorName = resultSet.getString("authors.a_name");
                    int idCategory = resultSet.getInt("category.c_id");
                    String nameCategory = resultSet.getString("category.c_name");
                    Category category = new Category(idCategory, nameCategory);
                    Author author = new Author(authorId, authorName);
                    bookList2.add(new Book(id, title, pageSize, author, category));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return bookList2;
    }

    @Override
    public List<Book> selectAllBook() {
        List<Book> bookList1 = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BOOK);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("b_id");
                String title = resultSet.getString("title");
                int pageSize = resultSet.getInt("page_size");
                int authorId = resultSet.getInt("authors.a_id");
                String authorName = resultSet.getString("a_name");
                int idCategory = resultSet.getInt("category.c_id");
                String nameCategory = resultSet.getString("c_name");
                Category category = new Category(idCategory, nameCategory);
                Author author = new Author(authorId, authorName);
                Book book = new Book(id, title, pageSize, author, category);
                bookList1.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookList1;
    }

    @Override
    public void save(Book book) throws SQLException {
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BOOK_SQL);
        preparedStatement.setString(1, book.getTitle());
        preparedStatement.setInt(2, book.getPageSize());
        preparedStatement.setInt(3, book.getAuthor().getAuthorId());
        preparedStatement.setInt(4, book.getCategory().getIdCategory());
        preparedStatement.executeUpdate();
    }


    @Override
    public Book findById(int id) throws SQLException {
        PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(SELECT_BY_ID);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            String title = resultSet.getString("title");
            int pageSize = resultSet.getInt("page_size");
            int authorId = resultSet.getInt("a_id");
            String authorName = resultSet.getString("a_name");
            int idCategory = resultSet.getInt("c_id");
            String nameCategory = resultSet.getString("c_name");
            Category category = new Category(idCategory, nameCategory);
            Author author = new Author(authorId, authorName);
            Book book = new Book(title, pageSize, author, category);
            return book;
        }
        return null;
    }


    @Override
    public void updateBook(int id, Book book) throws SQLException {
        Connection connection = BaseRepository.getConnection();
        CallableStatement callableStatement = null;
        if (connection != null) {
            try {
                callableStatement = connection.prepareCall("call update_books(?,?,?,?)");
                callableStatement.setString(1, book.getTitle());
                callableStatement.setInt(2, book.getPageSize());
                callableStatement.setInt(3, book.getAuthor().getAuthorId());
                callableStatement.setInt(4, book.getCategory().getIdCategory());
//                callableStatement.setInt(5, id);
                callableStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    @Override
    public boolean deleteBook(int id) {
        boolean rowDelete = false;
        Connection connection = BaseRepository.getConnection();
        if (connection != null) {
            CallableStatement callableStatement = null;
            try {
                callableStatement = connection.prepareCall("call delete_books(?)");
                callableStatement.setInt(1, id);
                callableStatement.executeUpdate();
                rowDelete = (callableStatement.executeUpdate() > 0);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return rowDelete;
    }

    @Override
    public List<Author> authorList() throws SQLException {
        List<Author> authorList = new ArrayList<>();
        PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement("select * from authors");
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int authorId = resultSet.getInt(1);
            String authorName = resultSet.getString(2);
            Author author = new Author(authorId, authorName);
            authorList.add(author);
        }
        return authorList;
    }

    @Override
    public List<Category> categoryList() throws SQLException {
        List<Category> categoryList = new ArrayList<>();
        PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement("select * from category");
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int idCategory = resultSet.getInt(1);
            String nameCategory = resultSet.getString(2);
            Category category = new Category(idCategory, nameCategory);
            categoryList.add(category);
        }
        return categoryList;
    }
}