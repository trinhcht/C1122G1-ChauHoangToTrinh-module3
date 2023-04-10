package module3.ss11.service.impl;

import module3.ss11.model.Category;
import module3.ss11.repository.ICategoryRepository;
import module3.ss11.repository.impl.CategoryRepository;
import module3.ss11.service.ICategoryService;

import java.util.List;

public class CategoryService implements ICategoryService {
    private ICategoryRepository iCategoryRepository= new CategoryRepository();
    @Override
    public List<Category> findAllCategory() {
        return iCategoryRepository.findAllCategory();
    }

    @Override
    public List<Category> bookCategoryList() {
        return iCategoryRepository.bookCategoryList();
    }

    @Override
    public Category findByID(int id) {
        return iCategoryRepository.findByID(id);
    }
}