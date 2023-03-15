package mvc.ss11.repository;
import mvc.ss11.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void save(Product product);

    void update(Product product);

    Product findById(int id);

    void delete(int id);

    List<Product> search(String name);
}