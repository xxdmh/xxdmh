package com.chinasoft.shop.mapper;

import java.util.List;

import com.chinasoft.shop.pojo.User;

public interface UserMapper {
	User isName(String name);

	User isEmail(String email);

	void addUser(User user);

	User findUserByToken(String token);

	void delete(String id);

	void update(User u);

	User findUserByNamePass(User user);

	User findById(String id);

	List<User> findAll();
}