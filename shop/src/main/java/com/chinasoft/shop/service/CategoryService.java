package com.chinasoft.shop.service;

import java.util.List;

import com.chinasoft.shop.exception.UserException;
import com.chinasoft.shop.pojo.Category;

public interface CategoryService {

	void addCate(Category category);

	List<Category> findAll();

	boolean isCate(String name);

	void isAgain(boolean again) throws UserException;

	Category findById(String id);

	void findByNameId(String name, String id) throws UserException;

	void update(Category category);

	List<Category> findAllGoods();

}
