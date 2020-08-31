package service;

import java.util.List;

import model.Category;

public interface CategoryService {

    void insert(Category category);

    void edit(Category category);

    void delete(int id);

    Category get(int id);

    Category get(String name, String sex);

    List<Category> getByName(String name);

    List<Category> getAll();
      List<Category> getName();

    List<Category> search(String username);
}
