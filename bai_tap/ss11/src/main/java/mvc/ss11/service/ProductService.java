package mvc.ss11.service;
import mvc.ss11.model.Product;
import mvc.ss11.repository.IProductRepository;
import mvc.ss11.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
    private static IProductRepository iProductRepository = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return iProductRepository.findAll();
    }

    @Override
    public void save(Product product) {
        iProductRepository.save(product);
    }

    @Override
    public void update(Product product) {
        iProductRepository.update(product);
    }

    @Override
    public Product findById(int id) {
        return iProductRepository.findById(id);
    }

    @Override
    public void delete(Product product) {
        iProductRepository.delete(product);
    }

    @Override
    public List<Product> search(String name) {
        return iProductRepository.search(name);
    }
}