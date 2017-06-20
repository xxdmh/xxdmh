package com.chinasoft.shop.pojo;

public class Address {
    private String id;

    private String uname;

    private String area;

    private String street;

    private String phone;

    private String code;

    private String cellPhone;

    private String state;

    private String uid;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCellPhone() {
        return cellPhone;
    }

    public void setCellPhone(String cellphone) {
        this.cellPhone = cellphone;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

	@Override
	public String toString() {
		return "Address [id=" + id + ", uname=" + uname + ", area=" + area + ", street=" + street + ", phone=" + phone
				+ ", code=" + code + ", cellPhone=" + cellPhone + ", state=" + state + ", uid=" + uid + "]";
	}
    
}