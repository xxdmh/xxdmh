package com.chinasoft.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasoft.shop.exception.UserException;
import com.chinasoft.shop.mapper.CategoryMapper;
import com.chinasoft.shop.pojo.Category;
import com.chinasoft.shop.service.CategoryService;
import com.chinasoft.shop.utils.Uuid;
@Service
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	private CategoryMapper cm;
	@Override
	public void addCate(Category category) {
		category.setId(Uuid.getUuid());
		category.setGoodsNums(0);
		cm.addCate(category);
	}

	@Override
	public List<Category> findAll() {
		return cm.findAll();
	}

	@Override
	public boolean isCate(String name) {
		Category category = cm.findCateByName(name);
		if (category==null) return false;
		else return true;
	}

	@Override
	public void isAgain(boolean again) throws UserException {
		if (again==true) throw new UserException("不要重复提交");
		
	}

	@Override
	public Category findById(String id) {
		return cm.findById(id);
	}

	@Override
	public void findByNameId(String name, String id) throws UserException {
		Category c1 = cm.findCateByName(name);
		Category c2 = cm.findById(id);
		if (c1!=null&&c2!=null) {
			if (!c1.getName().equals(c2.getName()))
				throw new UserException("商品分类名已存在");
		}
		
	}

	@Override
	public void update(Category category) {
		cm.update(category);
	}

	@Override
	public List<Category> findAllGoods() {
		return cm.findAllGoods2();
	}

}
