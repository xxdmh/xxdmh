package com.chinasoft.shop.mapper;

import java.util.List;

import com.chinasoft.shop.pojo.Orders;

public interface OrdersMapper {

	List<Orders> LimitFind(String id);
	
}