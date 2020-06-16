package com.yourcloset.user.vo;

public class UserVO {
	private String user_id;
	private String password;
	private String user_name;
	private String user_address;
	private int point = 0;
	private String position; // staff, user
	
	public UserVO() {}
	
	public UserVO(String user_id, String password, String user_name, String user_address) {
		this.user_id = user_id;
		this.password = password;
		this.user_name = user_name;
		this.user_address = user_address;
	}

	public UserVO(String user_id, String password, String user_name, String user_address, int point) {
		this(user_id, password, user_name, user_address);
		this.point = point;
	}
	
	public UserVO(String user_id, String password, String user_name, String user_address, int point, String position) {
		this(user_id, password, user_name, user_address);
		this.point = point;
		this.position = position;
	}


	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
 
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
 
	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

}
