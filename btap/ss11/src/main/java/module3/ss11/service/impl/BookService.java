package module3.ss11.service.impl;

import module3.ss11.model.Book;
import module3.ss11.repository.IBookRepository;
import module3.ss11.repository.impl.BookRepository;
import module3.ss11.service.IBookService;

import java.util.List;

public class BookService implements IBookService {
    private IBookRepository iBookRepository = new BookRepository();

    @Override
    public List<Book> findAll() {
        return iBookRepository.findAll();
    }

    @Override
    public void save(Book book) {
        iBookRepository.save(book);
    }

    @Override
    public Book findById(int id) {
        return iBookRepository.findById(id);
    }

    @Override
    public void delete(int id) {
        iBookRepository.deleteBook(id);
    }

    @Override
    public void updateBook(int id, Book book) {
        iBookRepository.updateBook(id, book);
    }

    @Override
    public boolean deleteBook(int id) {
        return iBookRepository.deleteBook(id);
    }
}
