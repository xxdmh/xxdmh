package com.chinasoft.shop.mapper;

import java.util.List;

import com.chinasoft.shop.pojo.Category;

public interface CategoryMapper {

	void addCate(Category category);

	List<Category> findAll();

	Category findCateByName(String name);

	Category findById(String id);

	void update(Category category);

	List<Category> findAllGoods2();

  
}