package com.chinasoft.shop.service;

import java.util.List;

import com.chinasoft.shop.exception.UserException;
import com.chinasoft.shop.pojo.User;

public interface UserService {

	boolean isName(String name);

	boolean isEmail(String email);

	boolean isVerify(String vcode, String vc);

	boolean isFlag(boolean flag) throws UserException;

	void addUser(User user);

	void updateState(String token) throws UserException;

	User findUserByNamePass(User user0) throws UserException;

	void update(User user);

	User findById(String id);

	List<User> findAll();

}
