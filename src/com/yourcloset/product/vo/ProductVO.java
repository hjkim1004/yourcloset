package com.yourcloset.product.vo;

public class ProductVO {
	private int product_id;
	private String product_name;
	private int price;
	private String size;
	private String category;
	private int stock;
	private int point;
	private String description;
	
	public ProductVO() {}

	public ProductVO(String product_name, int price, int product_id) {
		this.product_name = product_name;
		this.price = price;
		this.product_id = product_id;
	}

	public ProductVO(String product_name, int price, String size, String category, int stock, int point) {
		this.product_name = product_name;
		this.price = price;
		this.size = size;
		this.category = category;
		this.stock = stock;
		this.point = point;
	}

	public ProductVO(int product_id, String product_name, int price, String size, String category, int stock, int point) {
		this(product_name, price, size, category, stock, point);
		this.product_id = product_id;
	}
	

	public ProductVO(int product_id, String product_name, int price, String size, String category, int stock, int point,
			String description) {
		this(product_id, product_name, price, size, category, stock, point);
		this.description = description;
	}

	@Override
	public String toString() {
		return "ProductVO [product_id=" + product_id + ", product_name=" + product_name + ", price=" + price + ", size="
				+ size + ", category=" + category + ", stock=" + stock + ", point=" + point + ", description="
				+ description + "]";
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
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
