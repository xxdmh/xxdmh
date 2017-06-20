package com.chinasoft.shop.pojo;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private Integer goodsNum;
	
	private String gid;

	private List<Goods> goodsList = new ArrayList<Goods>();
	
	public Integer getGoodsNum() {
		return goodsNum;
	}

	public void setGoodsNum(Integer goodsNum) {
		this.goodsNum = goodsNum;
	}

	public String getGid() {
		return gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public List<Goods> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
	
	

}
