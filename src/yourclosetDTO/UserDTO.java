package yourclosetDTO;

public class UserDTO {
	private String id;		// User의 ID
	private String pw;		// User의 비밀번호
	private String name;	// User의 이름
	private String address;	// User의 주소
	private int point = 0;	// User의 누적 포인트
	private String position; // 관리자와 고객 분리 - staff, user
	
	public UserDTO() {} // default 생성자
	public UserDTO(String id, String pw, String name, String address, String position){ // 회원가입시 사용하는 생성자
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.address = address;
		this.position = position;
	}
	public UserDTO(String id, String pw, String name, String address, int point, String position){ // 정보를 받아올때 사용하는 생성자
		this(id,pw,name,address,position);
		this.point = point;
	}
	
	public UserDTO(String id, String pw, String name, String address, int point) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.address = address;
		this.point = point;
	}
	
	

	@Override
	public String toString() {
		return "User [아이디 = " + id + ", 이름 = " + name + ", 주소 = " + address + ", 잔액 포인트 = " + point + "]";
	}


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}


	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
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

	public void addPoint(int point) {
		this.point += point;
	}
	public void minusPoint(int point) { // 포인트 차감시 사용
		this.point -= point;
	}
	public int getPoint() // point는 구매시 올라 가기 때문에 따로 setter 지정 X
	{
		return point;
	}
	
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
}
