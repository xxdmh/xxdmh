package com.chinasoft.shop.pojo;

import java.util.Date;

public class Orders {
    private String id;

    private Date time;

    private String uname;

    private String payWay;

    private String sendWay;

    private Double totalMoney;

    private String state;

    private String submit;
    
    private String uid;
    
    private Date sendTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPayWay() {
        return payWay;
    }

    public void setPayWay(String payway) {
        this.payWay = payway;
    }

    public String getSendWay() {
        return sendWay;
    }

    public void setSendWay(String sendway) {
        this.sendWay = sendway;
    }

    public Double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(Double totalmoney) {
        this.totalMoney = totalmoney;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getSubmit() {
        return submit;
    }

    public void setSubmit(String submit) {
        this.submit = submit;
    }

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
    
    
}