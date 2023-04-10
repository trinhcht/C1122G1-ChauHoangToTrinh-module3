package module3.ss11.service;

import module3.ss11.model.Category;

import java.util.List;

public interface ICategoryService {
    List<Category> findAllCategory();
    List<Category> bookCategoryList ();
    Category findByID(int id);
}
