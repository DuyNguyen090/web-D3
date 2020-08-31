/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import model.User;
import model.UserDetails;

/**
 *
 * @author DUY
 */
public interface UserDetailsService {

    UserDetails getUser(User user);

    UserDetails getUserId(int id);

    UserDetails getId(int id);

    void insert(UserDetails userDetails);

    void edit(UserDetails newUserDetails);

    void delete(int id);
}
