package com.chinasoft.shop.service;

import java.util.List;

import com.chinasoft.shop.pojo.Goods;
import com.chinasoft.shop.pojo.Orders;

public interface OrdersService {

	List<Orders> LimitFind(String id);

	void addAds(Goods g, double sub, Integer num);

}
