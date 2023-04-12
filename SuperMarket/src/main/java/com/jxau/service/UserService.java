package com.jxau.service;

import com.jxau.entity.User;

public interface UserService {
    public User findUser(String username, String password);
}
