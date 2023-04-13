package module3.ss12.service;

import module3.ss12.model.Author;
import module3.ss12.model.Book;
import module3.ss12.model.Category;

import java.sql.SQLException;
import java.util.List;

public interface IBookService {
    List<Book> findByName(String name)throws SQLException;
    List<Book> selectAllBook();
    void save(Book book) throws SQLException;
    Book findById(int id) throws SQLException;
    void delete(int id);
    void updateBook(int id,Book book) throws SQLException;

    boolean deleteBook(int id);
    List<Author> authorList() throws SQLException;
    List<Category> categoryList() throws SQLException;
}
