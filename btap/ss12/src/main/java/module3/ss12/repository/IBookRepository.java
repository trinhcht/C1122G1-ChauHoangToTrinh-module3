package module3.ss12.repository;

import module3.ss12.model.Author;
import module3.ss12.model.Book;
import module3.ss12.model.Category;

import java.sql.SQLException;
import java.util.List;

public interface IBookRepository {
    List<Book> findAll(String name) throws SQLException;

    void save(Book book) throws SQLException;

    Book findById(int id) throws SQLException;

    void updateBook(int id, Book book) throws SQLException;

    boolean deleteBook(int id);
    List<Author> authorList() throws SQLException;
    List<Category> categoryList() throws SQLException;
}
