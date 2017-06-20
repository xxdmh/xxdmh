package com.chinasoft.shop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasoft.shop.mapper.OrdersDetailsMapper;
import com.chinasoft.shop.pojo.Goods;
import com.chinasoft.shop.pojo.OrdersDetails;
import com.chinasoft.shop.service.OrderDetailsService;
import com.chinasoft.shop.utils.Uuid;

@Service
public class OrderDetailsServiceImpl implements OrderDetailsService{
	@Autowired
	private OrdersDetailsMapper odm;

	@Override
	public String addAds(Goods g, double sub,Integer num) {
    	OrdersDetails od = new OrdersDetails();
    	od.setGid(g.getId());
    	od.setGname(g.getName());
    	od.setGprice(g.getSalePrice());
    	String id = Uuid.getUuid();
    	od.setId(id);
    	od.setNums(num);
		od.setSubtotal(sub);
		od.setGimage(g.getImage());
		od.setOid("0");
		odm.add(od);
		return id;
	}

	@Override
	public OrdersDetails findById(String id) {
		return odm.findById(id);
	}
}
