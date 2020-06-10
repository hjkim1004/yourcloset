package com.yourcloset.product;

public class ProductVO {
	private int pid;
	private String pname;
	private int price;
	private String size;
	private String category;
	private int stock;
	private int point;

	public ProductVO() {}

	public ProductVO(String pname, int price, int pid) {
		this.pname = pname;
		this.price = price;
		this.pid = pid;
	}

	public ProductVO(String pname, int price, String size, String category, int stock, int point) {
		this.pname = pname;
		this.price = price;
		this.size = size;
		this.category = category;
		this.stock = stock;
		this.point = point;
	}

	public ProductVO(int pid, String pname, int price, String size, String category, int stock, int point) {
		this(pname, price, size, category, stock, point);
		this.pid = pid;
	}
	
	
	@Override
	public String toString() {
		return "ProductVO [pid=" + pid + ", pname=" + pname + ", price=" + price + ", size=" + size + ", category="
				+ category + ", stock=" + stock + ", point=" + point + "]";
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

}
