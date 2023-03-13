package mvc.ss11.service;

import mvc.ss11.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void save(Product product);

    void update(Product product);

    Product findById(int id);

    void delete(Product product);

    List<Product> search(String name);

}