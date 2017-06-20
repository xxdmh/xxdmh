package com.chinasoft.shop.service;

import java.util.List;

import com.chinasoft.shop.pojo.Goods;

public interface GoodsService {

	void addGoods(Goods goods);

	List<Goods> findAll();

	Goods findById(String id);

	Goods findById2(String id);

	void update(Goods goods);

	List<Goods> findByLatest();

	List<Goods> finfByHottest();

	void searchGoods();

	List<Goods> findByCateId(String id);

	List<Goods> findBySaleNums(String id);

	List<Goods> findByHottest5();

}
