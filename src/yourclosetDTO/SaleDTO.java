package yourclosetDTO;

public class SaleDTO {
	private int oId;
	private int pid;
	private String address;		// User �ּ�
	private String payment;		// ���� ��� - card, cash
	private String userId;		// User ID
	private String delivery="N"; // ��� ��� - default : N 	
	private int price;
	
	public SaleDTO() {} // default ������ 
	public SaleDTO(int pid, String userId, String address, String payment) {
		this.pid = pid;
		this.address = address;
		this.payment = payment;
		this.userId = userId;
	}
	public SaleDTO(int pid, String userId, String address, String payment, int price) { // ������ ���� ����
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
		return "�ֹ� [�Ǹ� ��ȣ = " + oId + ", �ֹ��� ID = "+userId+ ", ��ǰ��ȣ = " + pid + ", ������ �ּ� = " + address
				+ ", ���� ���� = " + price+", ���� ��� = " + payment + "]";
	}
	public String toStaff() {
		return "�ֹ� [�Ǹ� ��ȣ = " + oId + ", �ֹ��� ID = "+userId+ ", ��ǰ��ȣ = " + pid + ", ��ۻ��� = "+delivery+"]";
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
