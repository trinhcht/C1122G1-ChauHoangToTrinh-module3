package module3.ss12.model;

public class Book {
    private Integer id;
    private String title;
    private Integer pageSize;

    private Author author;
    private Category category;

    public Book(Integer id, String title, Integer pageSize, Author author, Category category) {
        this.id = id;
        this.title = title;
        this.pageSize = pageSize;
        this.author = author;
        this.category = category;
    }

    public Book(String title, Integer pageSize, Author author, Category category) {
        this.title = title;
        this.pageSize = pageSize;
        this.author = author;
        this.category = category;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
