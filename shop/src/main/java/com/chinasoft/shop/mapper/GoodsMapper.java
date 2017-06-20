package com.chinasoft.shop.mapper;

import java.util.List;

import com.chinasoft.shop.pojo.Goods;

public interface GoodsMapper {
	void addGoods(Goods goods);

	List<Goods> findAll();

	Goods findById(String id);

	Goods findById2(String id);

	void update(Goods goods);

	List<Goods> findByLatest();

	List<Goods> findByHottest();

	List<Goods> findByCateId(String id);

	List<Goods> findBySaleNums(String id);

	List<Goods> findByHottest5();
}