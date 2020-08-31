package service;

import java.util.List;

import model.User;

public interface UserService {
	void insert(User user);

	void edit(User user, String path);

	void delete(int id, String path);

	User get(String username);
	
	User get(int id);
	
	User login(String username, String password);
	
	boolean register(String email, String password, String username);

	List<User> getAll();

	List<User> search(String keyword);
	
	boolean checkExistEmail(String email);
	
	boolean checkExistUsername(String username);
	
}
