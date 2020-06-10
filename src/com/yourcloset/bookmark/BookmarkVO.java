package com.yourcloset.bookmark;

public class BookmarkVO {
	private int bookmark_id;
	private int product_id;
	private String user_id;
	
	public BookmarkVO() {}
	
	public BookmarkVO(int product_id, String user_id) {
		super();
		this.product_id = product_id;
		this.user_id = user_id;
	}

	public BookmarkVO(int bookmark_id, int product_id, String user_id) {
		super();
		this.bookmark_id = bookmark_id;
		this.product_id = product_id;
		this.user_id = user_id;
	}

	public int getBookmark_id() {
		return bookmark_id;
	}

	public void setBookmark_id(int bookmark_id) {
		this.bookmark_id = bookmark_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}
