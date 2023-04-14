package module3.ss11.repository.impl;

import module3.ss11.model.Book;
import module3.ss11.model.Category;
import module3.ss11.repository.ICategoryRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepository implements ICategoryRepository {
    private static List<Category> categoryList = new ArrayList<>();

    static {
        categoryList.add(new Category(1, "Tự nhiên"));
        categoryList.add(new Category(2, "Xã hội"));
        categoryList.add(new Category(3, "Truyện"));
        categoryList.add(new Category(4, "Tiểu thuyết"));
        categoryList.add(new Category(5, "khác"));

    }

    @Override
    public List<Category> findAllCategory() {
        return categoryList;
    }

    @Override
    public List<Category> bookCategoryList() {
        List<Category> bookcategoryList = new ArrayList<>();
        for (int i = 0; i < categoryList.size(); i++) {
            bookcategoryList.add(categoryList.get(i));
        }
        return bookcategoryList;
    }

    @Override
    public Category findByID(int id) {
        for (Category category : categoryList) {
            if (category.getIdCategory() == id) {
                return category;
            }
        }
        return null;
    }

}