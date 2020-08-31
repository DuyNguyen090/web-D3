package dao;

import java.util.List;

import model.Category;

public interface CategoryDao {

    void insert(Category category);

    void edit(Category category);

    void delete(int id);

    Category get(int id);

    Category get(String name, String sex);

    List<Category> getByName(String name);

    List<Category> getBySex(String sex);

    List<Category> getAll();

    List<Category> getName();

    List<Category> search(String username);
}
