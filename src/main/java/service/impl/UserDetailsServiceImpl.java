/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service.impl;

import dao.UserDetailsDao;
import dao.impl.UserDetailsDaoImpl;
import model.User;
import model.UserDetails;
import service.UserDetailsService;

/**
 *
 * @author DUY
 */
public class UserDetailsServiceImpl implements UserDetailsService {

    UserDetailsDao userDetailsDao = new UserDetailsDaoImpl();

    @Override
    public UserDetails getUser(User user) {
        return userDetailsDao.getUser(user);
    }
    
    @Override
    public void insert(UserDetails userDetails) {
        userDetailsDao.insert(userDetails);
    }
    
    @Override
    public void edit(UserDetails newUserDetails) {
        UserDetails oldUserDetails = userDetailsDao.getId(newUserDetails.getId());
        oldUserDetails.setFullName(newUserDetails.getFullName());
        oldUserDetails.setAddress(newUserDetails.getAddress());
        oldUserDetails.setTel(newUserDetails.getTel());
        userDetailsDao.edit(oldUserDetails);
    }

    @Override
    public UserDetails getUserId(int id) {
       return userDetailsDao.getUserId(id);
    }

    @Override
    public UserDetails getId(int id) {
       return userDetailsDao.getId(id);
    }

    @Override
    public void delete(int id) {
        userDetailsDao.delete(id);
    }
    
}
