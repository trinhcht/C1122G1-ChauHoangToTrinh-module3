package module3.ss11.model;

public class Book {
    private Integer id;
    private String title;
    private Integer pageSize;

    private String author;
    private Category category;

    public Book() {
    }

    public Book(Integer id, String title, Integer pageSize, String author, Category category) {
        this.id = id;
        this.title = title;
        this.pageSize = pageSize;
        this.author = author;
        this.category = category;
    }

    public Book(Integer id, String title, Integer pageSize, String author) {
        this.id = id;
        this.title = title;
        this.pageSize = pageSize;
        this.author = author;

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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
