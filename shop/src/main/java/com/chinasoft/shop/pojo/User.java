package com.chinasoft.shop.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class User {
    private String id;

    private String name;

    private String password;

    private String email;

    private String avatar;

    private Double balance;

    private Double total;

    private Integer orderNums;

    private Integer evaluateNums;

    private Integer payNums;

    private Integer receiptNums;

    private String states;

    private String token;
    
    private String phone;
    
    private Date regTime;
    
    private List<Orders> orderList = new ArrayList<Orders>();

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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Integer getOrderNums() {
        return orderNums;
    }

    public void setOrderNums(Integer ordernums) {
        this.orderNums = ordernums;
    }

    public Integer getEvaluateNums() {
        return evaluateNums;
    }

    public void setEvaluateNums(Integer evaluatenums) {
        this.evaluateNums = evaluatenums;
    }

    public Integer getPayNums() {
        return payNums;
    }

    public void setPayNums(Integer paynums) {
        this.payNums = paynums;
    }

    public Integer getReceiptNums() {
        return receiptNums;
    }

    public void setReceiptNums(Integer receiptnums) {
        this.receiptNums = receiptnums;
    }

    public String getStates() {
        return states;
    }

    public void setStates(String states) {
        this.states = states;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getRegTime() {
		return regTime;
	}

	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}

	public List<Orders> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Orders> orderList) {
		this.orderList = orderList;
	}
	
    
	
    
}