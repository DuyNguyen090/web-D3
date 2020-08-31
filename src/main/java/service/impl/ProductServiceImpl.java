package service.impl;

import java.io.File;
import java.util.List;

import dao.ProductDao;
import dao.impl.ProductDaoImpl;
import model.Product;
import service.ProductService;

public class ProductServiceImpl implements ProductService {

    ProductDao productDao = new ProductDaoImpl();

    @Override
    public void insert(Product product) {
        productDao.insert(product);

    }

    @Override
    public void edit(Product newProduct, String path) {
        Product oldProduct = productDao.get(newProduct.getId());

        oldProduct.setName(newProduct.getName());
        oldProduct.setPrice(newProduct.getPrice());
        oldProduct.setCategory(newProduct.getCategory());
        if (newProduct.getImage() != oldProduct.getImage()) {
            File oldfile = new File(path + "Images/" + productDao.get(oldProduct.getId()).getImage());
            if (oldfile.exists()) {
                oldfile.delete();
            }
            oldProduct.setImage(newProduct.getImage());
        }

        oldProduct.setDes(newProduct.getDes());
        productDao.edit(oldProduct);

    }

    @Override
    public void delete(int id, String path) {
        Product product = productDao.get(id);
        productDao.delete(id);
        if (productDao.get(id) == null) {
            File oldfile = new File(path + "Images/" + product.getImage());
            if (oldfile.exists()) {
                oldfile.delete();
            }
        }
    }

    @Override
    public Product get(int id) {
        return productDao.get(id);
    }

    @Override
    public List<Product> getAll() {
        return productDao.getAll();
    }

    @Override
    public List<Product> search(String product) {
        return productDao.search(product);
    }

    @Override
    public List<Product> seachByCategory(int cate_id) {
        return productDao.seachByCategory(cate_id);
    }

    @Override
    public List<Product> seachByName(String productName) {
        return productDao.seachByName(productName);
    }

    @Override
    public List<Product> seachByCategorySex(String sex) {
        return productDao.seachByCategorySex(sex);
    }

    @Override
    public List<Product> seachByCategoryName(String cate_name) {
       return productDao.seachByCategoryName(cate_name);
    }

}
