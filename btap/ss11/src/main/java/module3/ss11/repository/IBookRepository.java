package module3.ss11.repository;

import module3.ss11.model.Book;

import java.util.List;

public interface IBookRepository {
    List<Book> findAll();

    void save(Book books);

    Book findById(int id);

    void updateBook(int id, Book book);

    boolean deleteBook(int id);
}
