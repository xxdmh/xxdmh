package com.chinasoft.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasoft.shop.mapper.OrdersMapper;
import com.chinasoft.shop.pojo.Orders;
import com.chinasoft.shop.service.OrdersService;
@Service
public class OrdersServiceImpl implements OrdersService {
	@Autowired
	private OrdersMapper om;

	@Override
	public List<Orders> LimitFind(String id) {
		return om.LimitFind(id);
	}


}
