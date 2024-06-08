package tn.iit.projetjee.dao;

import tn.iit.projetjee.entity.User;

import java.util.List;

public interface UserDao {
    User getUserById(int userId);
    List<User> getAllUsers();
    void addUser(User user);
    void updateUser(User user);
    void deleteUser(int userId);
    User getUserByEmailAndPassword(String email, String password);
    public User getUserByEmail(String email);
    int getUsersCountByRole(String role);
}