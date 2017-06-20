package com.chinasoft.shop.pojo;

import java.util.ArrayList;
import java.util.List;

public class Category {
    private String id;

    private String name;
    
    private Integer goodsNums;
    
    private List<Goods> goodsList =  new ArrayList<Goods>();

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

	public Integer getGoodsNums() {
		return goodsNums;
	}

	public void setGoodsNums(Integer goodsNums) {
		this.goodsNums = goodsNums;
	}

	public List<Goods> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", goodsNums=" + goodsNums + ", goodsList=" + goodsList + "]";
	}
    
	
    
}