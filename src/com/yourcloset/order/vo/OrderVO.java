package com.yourcloset.order.vo;

import java.util.Date;

public class OrderVO {
	private int order_id;
    private int product_id;
    private Date order_time;
    private String address;
    private String payment;
    private String user_id;
    private String delivery;
    private int price;
    
	public OrderVO(int product_id, String address, String payment, String user_id, String delivery,
			int price) {
		this.product_id = product_id;
		this.address = address;
		this.payment = payment;
		this.user_id = user_id;
		this.delivery = delivery;
		this.price = price;
	}

	public OrderVO(int order_id, int product_id, Date order_time, String address, String payment, String user_id,
			String delivery, int price) {
		this.order_id = order_id;
		this.product_id = product_id;
		this.order_time = order_time;
		this.address = address;
		this.payment = payment;
		this.user_id = user_id;
		this.delivery = delivery;
		this.price = price;
	}
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public Date getOrder_time() {
		return order_time;
	}
	public void setOrder_time(Date order_time) {
		this.order_time = order_time;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
    
    
    
}
