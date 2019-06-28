package yourclosetDTO;

public class ProductDTO {
	private int pid; // 상품번호
	private String pname; // 상품명
	private int price; // 상품 가격
	private String size; // 상품 사이즈
	private String category; // 카테고리
	private int stock; // 물품 수량
	private int point;

	public ProductDTO() {
	} // default 생성자

	public ProductDTO(String pname, int price, int pid) {
		this.pname = pname;
		this.price = price;
		this.pid = pid;
	} 
	
	public ProductDTO(String pname, int price, String size, String category, int stock, int point) {
		this.pname = pname;
		this.price = price;
		this.size = size;
		this.category = category;
		this.stock = stock;
		this.point = point;
	}
	public ProductDTO(int pid, String pname, int price, String size, String category, int stock, int point) {
		this(pname, price, size, category, stock, point);
		this.pid = pid;

	}

	@Override
	public String toString() {
		return " [ 상품 번호 = " + pid + ", 상품명 = " + pname + ", 가격 = " + price + ", 사이즈 = " + size + ", 카테고리 = " + category
				+ ", 재고 = " + stock + ", 구매시 적립 포인트 = " + point + "]";
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
