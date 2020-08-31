package service;

import java.util.List;

import model.Product;

public interface ProductService {

    void insert(Product product);

    void edit(Product product, String path);

    void delete(int id, String path);

    Product get(int id);

    List<Product> getAll();

    List<Product> search(String username);

    List<Product> seachByCategory(int cate_id);

    List<Product> seachByCategorySex(String sex);

    List<Product> seachByCategoryName(String cate_name);

    List<Product> seachByName(String productName);
}
