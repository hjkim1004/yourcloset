package yourclosetDTO;

public class SaleDTO {
	private int oId;			// 판매내역 고유번호
	private int pid;			// 상품번호
	private String address;		// User 주소
	private String payment;		// 결제 방식 - card, cash
	private String userId;		// User ID
	private String delivery="N"; // 배달 방식 - default : N 	
	private int price;
	
	public SaleDTO() {} // default 생성자 
	public SaleDTO(int pid, String userId, String address, String payment) {
		this.pid = pid;
		this.address = address;
		this.payment = payment;
		this.userId = userId;
	}
	public SaleDTO(int pid, String userId, String address, String payment, int price) { // 구매한 가격 포함
		this(pid, userId, address, payment);
		this.price = price;
	}
	
	public int getPrice(){
		return this.price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public SaleDTO(int oId, int pid, String userId, String address, String payment, int price, String delivery) {
		this(pid,userId,address, payment, price);
		this.oId = oId;
		this.delivery = delivery;
		
	}
	
	@Override
	public String toString() {
		return "주문 [판매 번호 = " + oId + ", 주문자 ID = "+userId+ ", 상품번호 = " + pid + ", 받으실 주소 = " + address
				+ ", 구매 가격 = " + price+", 지불 방식 = " + payment + "]";
	}
	public String toStaff() {
		return "주문 [판매 번호 = " + oId + ", 주문자 ID = "+userId+ ", 상품번호 = " + pid + ", 배송상태 = "+delivery+"]";
	}
	
	public int getoId() {
		return oId;
	}
	public void setoId(int oId) {
		this.oId = oId;
	}
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
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
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	
	
}
