package com.chinasoft.shop.mapper;

import java.util.List;

import com.chinasoft.shop.pojo.OrdersDetails;

public interface OrdersDetailsMapper {

	void add(OrdersDetails ordersDetails);

	OrdersDetails findById(String id);

	List<OrdersDetails> findCart(String id);

	OrdersDetails findByGoodsId(String id);

	void update(OrdersDetails ordersDetails);

	double totalMoney();

	void delete(String id);

	List<OrdersDetails> IsfindCart(String id);

	void deleteCart(String id);
}