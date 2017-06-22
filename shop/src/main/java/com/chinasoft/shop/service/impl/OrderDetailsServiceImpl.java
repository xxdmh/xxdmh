package com.chinasoft.shop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasoft.shop.mapper.OrdersDetailsMapper;
import com.chinasoft.shop.pojo.Goods;
import com.chinasoft.shop.pojo.OrdersDetails;
import com.chinasoft.shop.pojo.User;
import com.chinasoft.shop.service.OrderDetailsService;
import com.chinasoft.shop.utils.Uuid;

@Service
public class OrderDetailsServiceImpl implements OrderDetailsService{
	@Autowired
	private OrdersDetailsMapper odm;

	@Override
	public String addAds(Goods g, double sub,Integer num,User u) {
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
		od.setState("0");
		od.setUid(u.getId());
		odm.add(od);
		return id;
	}

	@Override
	public OrdersDetails findById(String id) {
		return odm.findById(id);
	}

	@Override
	public List<OrdersDetails> findCart(String id) {
		return odm.findCart(id);
	}

	@Override
	public void addHotAds(Goods g,User u) {
		OrdersDetails od = odm.findByGoodsId(g.getId());
		if (od==null) {
			od = new OrdersDetails();
			String id = Uuid.getUuid();
			od.setId(id);
			od.setNums(1);
			od.setGid(g.getId());
			od.setGimage(g.getImage());
			od.setGname(g.getName());
			od.setGprice(g.getSalePrice());
			od.setOid("1");
			od.setState("1");
			od.setSubtotal(g.getSalePrice());
			od.setUid(u.getId());
			odm.add(od);
		}else {
			if (od.getState().equals("0")) {
				od.setState("1");
				od.setOid("1");
			}else {
			od.setNums(od.getNums()+1);
			od.setSubtotal(od.getGprice()*od.getNums());
			odm.update(od);
			}
		}

		
		
	}

	@Override
	public double totalMoney() {
		return odm.totalMoney();
	}

	@Override
	public void update(OrdersDetails od) {
		odm.update(od);
		
	}

	@Override
	public void delete(String id) {
		odm.delete(id);
	}

	@Override
	public List<OrdersDetails> IsfindCart(User u) {
		if (u!=null) {
		return odm.IsfindCart(u.getId());	
		}else {
		return null;
		}
	}
	@Override
	public void deleteCart(String id) {
	odm.deleteCart(id);	
	}

	@Override
	public List<OrdersDetails> findCarts(String[] a) {
		List<OrdersDetails> list = new ArrayList<OrdersDetails>();
		for (int i = 0; i < a.length; i++) {
			list.add(odm.findById(a[i]));
		}
		return list;
	}
}
