package module3.ss11.repository;

import module3.ss11.model.Category;

import java.util.List;

public interface ICategoryRepository {
    List<Category> findAllCategory();
    List<Category> bookCategoryList ();
    Category findByID(int id);
}
