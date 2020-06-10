package com.yourcloset.user;

public class UserVO {
	private String id;
	private String password;
	private String name;
	private String address;
	private int point = 0;
	private String position; // staff, user
	
	public UserVO() {}
	
	public UserVO(String id, String password, String name, String address) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
	}

	public UserVO(String id, String password, String name, String address, int point) {
		this(id, password, name, address);
		this.point = point;
	}
	
	public UserVO(String id, String password, String name, String address, int point, String position) {
		this(id, password, name, address);
		this.point = point;
		this.position = position;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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
