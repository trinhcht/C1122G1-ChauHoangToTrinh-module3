package module3.ss11.repository.impl;

import module3.ss11.model.Book;
import module3.ss11.model.Category;
import module3.ss11.repository.IBookRepository;
import module3.ss11.repository.IBookRepository;

import java.util.ArrayList;
import java.util.List;

public class BookRepository implements IBookRepository {
    private static List<Book> bookList = new ArrayList<>();

    static {
        bookList.add(new Book(1, "Toán", 20, "Nguyễn Văn A", new Category(1, "Tự nhiên")));
        bookList.add(new Book(2, "Văn", 34, "Nguyễn Văn B", new Category(2, "Xã hội")));
        bookList.add(new Book(3, "Sử", 78, "Nguyễn Văn C", new Category(2, "Xã hội")));
        bookList.add(new Book(4, "Địa", 33, "Nguyễn Văn D", new Category(2, "Xã hội")));
        bookList.add(new Book(5, "Hóa", 54, "Nguyễn Văn E", new Category(1, "Tự nhiên")));

    }

    @Override
    public List<Book> findAll() {

        List<Book> bookList2 = new ArrayList<>();

        for (int i = 0; i < bookList.size(); i++) {

            bookList2.add(bookList.get(i));

        }
        return bookList2;
    }

    @Override
    public void save(Book book) {
        bookList.add(book);
    }

    @Override
    public Book findById(int id) {
        for (Book book : bookList) {
            if (id == book.getId()) {
                return book;
            }
        }
        return null;
    }

    @Override
    public void updateBook(int id, Book book) {
        for (int i = 0; i < bookList.size(); i++) {
            if (bookList.get(i).getId().equals(id)) {
                bookList.set(i, book);
            }
        }
    }

    @Override
    public boolean deleteBook(int id) {
        for (int i = 0; i < bookList.size(); i++) {
            if (id == bookList.get(i).getId()) {
                id = i;
                break;
            }
        }
        bookList.remove(id);
        return false;
    }
}
