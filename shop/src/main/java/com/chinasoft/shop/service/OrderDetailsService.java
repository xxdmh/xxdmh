package com.chinasoft.shop.service;

import com.chinasoft.shop.pojo.Goods;
import com.chinasoft.shop.pojo.OrdersDetails;

public interface OrderDetailsService {

	String addAds(Goods g, double sub,Integer num);

	OrdersDetails findById(String id);


}
