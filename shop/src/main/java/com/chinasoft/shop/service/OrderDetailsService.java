package com.chinasoft.shop.service;

import java.util.List;

import com.chinasoft.shop.pojo.Goods;
import com.chinasoft.shop.pojo.OrdersDetails;
import com.chinasoft.shop.pojo.User;

public interface OrderDetailsService {

	String addAds(Goods g, double sub,Integer num,User u);

	OrdersDetails findById(String id);

	List<OrdersDetails> findCart(String id);

	void addHotAds(Goods g,User u);

	double totalMoney();

	void update(OrdersDetails od);

	void delete(String id);

	List<OrdersDetails> IsfindCart(User u);

	void deleteCart(String id);

	List<OrdersDetails> findCarts(String[] a);


}
