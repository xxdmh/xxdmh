package com.chinasoft.shop.pojo;

public class OrdersDetails {
    private String id;

    private Integer nums;

    private String oid;

    private String gid;

    private String gname;

    private Double gprice;

    private Double subtotal;
    
    private String gimage;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getNums() {
        return nums;
    }

    public void setNums(Integer nums) {
        this.nums = nums;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public String getGid() {
        return gid;
    }

    public void setGid(String gid) {
        this.gid = gid;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public Double getGprice() {
        return gprice;
    }

    public void setGprice(Double gprice) {
        this.gprice = gprice;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

	public String getGimage() {
		return gimage;
	}

	public void setGimage(String gimage) {
		this.gimage = gimage;
	}

	@Override
	public String toString() {
		return "OrdersDetails [id=" + id + ", nums=" + nums + ", oid=" + oid + ", gid=" + gid + ", gname=" + gname
				+ ", gprice=" + gprice + ", subtotal=" + subtotal + "]";
	}
    
}