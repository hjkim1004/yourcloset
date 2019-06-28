package yourclosetDTO;

public class BookMarkDTO {
	private int bid; // 북마크 번호 - 등록한 순으로 순차생성
	private String pname; // 상품명
	private int pid; // 상품번호
	private String userId; // User ID

	public BookMarkDTO() {} // default 생성자
	public BookMarkDTO(String pname, int pid, String userId) { // 즐겨찾기 등록할 때 사용하는 생성자
		this.pname = pname;
		this.pid = pid;
		this.userId = userId;
	}
	public BookMarkDTO(int bid, String pname, int pid, String userId) { // 정보 받아오는 생성자
		this(pname,pid,userId);
		this.bid = bid;
	}

	@Override
	public String toString() {
		return " Book Mark [북마크 ID =" + bid + ", 제품 이름 =" + pname + ", 고객 ID=" + userId + "]";
	}
	
	public String toCustomer() {
		return " Book Mark [북마크 ID =" + bid+", 상품 ID = "+pid+", 제품 이름 = "+pname+"]";
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
