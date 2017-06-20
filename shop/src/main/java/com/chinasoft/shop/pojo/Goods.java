package com.chinasoft.shop.pojo;

public class Goods {
    private String id;

    private String name;

    private Double salePrice;

    private Double marketPrice;

    private Integer stock;

    private String num;

    private String image;

    private Integer total;

    private Integer commentNums;

    private String cid;

    private String description;
    
    private int latest;
    
    private int hottest;
    
    private int saleNums;
    
    private Category cate = new Category();

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

    public Double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(Double salePrice) {
        this.salePrice = salePrice;
    }

    public Double getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(Double marketPrice) {
        this.marketPrice = marketPrice;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getCommentNums() {
        return commentNums;
    }

    public void setCommentNums(Integer commentnums) {
        this.commentNums = commentnums;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

	public Category getCate() {
		return cate;
	}

	public void setCate(Category cate) {
		this.cate = cate;
	}
	
	public int getLatest() {
		return latest;
	}

	public void setLatest(int latest) {
		this.latest = latest;
	}

	public int getHottest() {
		return hottest;
	}

	public void setHottest(int hottest) {
		this.hottest = hottest;
	}
	
	public int getSaleNums() {
		return saleNums;
	}

	public void setSaleNums(int saleNums) {
		this.saleNums = saleNums;
	}

	@Override
	public String toString() {
		return "Goods [id=" + id + ", name=" + name + ", salePrice=" + salePrice + ", marketPrice=" + marketPrice
				+ ", stock=" + stock + ", num=" + num + ", image=" + image + ", total=" + total + ", commentNums="
				+ commentNums + ", cid=" + cid + ", description=" + description + ", cate=" + cate + "]";
	}

	
}