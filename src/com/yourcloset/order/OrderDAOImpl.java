package com.yourcloset.order;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.yourcloset.product.*;
import com.yourcloset.utils.JdbcAgent;

public class OrderDAO {
	private JdbcAgent agent = null;

	private PreparedStatement psmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	private String SelectDelivery_SQL = "select product_id, delivery from orders where order_id =?";

	public OrderDAO() {
		agent = new JdbcAgent();
	}

	public String selectDeliveryStatusByOrderId(int order_id) {
		String status = null;
		try {
			psmt = agent.getCon().prepareStatement(SelectDelivery_SQL);
			psmt.setInt(1, order_id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				int product_id = rs.getInt("product_id");
				String delivery = rs.getString("delivery");

				status = String.format("%d번 상품이 %d 상태에 있습니다.", product_id, delivery);
			}

			rs.close();
			psmt.close();
		} catch (SQLException e) {
			System.err.println("* Order Select Error");
		}
		return status;

	}

	public List<OrderVO> selectOrdersByDeliveryState() {
		String sql = "SELECT * FROM product p, orders s WHERE p.product_id = s.product_id";
		List<OrderVO> order_list = new ArrayList<>();
		try {
			stmt = agent.getCon().createStatement();
			if (stmt.execute(sql) == true) {
				rs = stmt.getResultSet();
				while (rs.next()) {
					int order_id = rs.getInt("order_id");
					int product_id = rs.getInt("product_id");
					String user_id = rs.getString("user_id");
					Date order_time = rs.getDate("order_time");
					String address = rs.getString("address");
					String payment = rs.getString("payment");
					String delivery = rs.getString("delivery");
					int price = rs.getInt("s.price");

					OrderVO order = new OrderVO(order_id, product_id, order_time, address, payment, user_id, delivery,
							price);
					order_list.add(order);
				}
			}
		} catch (SQLException e) {
			System.err.println("* Order Select Error");
		}
		return order_list;
	}

	public List<OrderVO> selectOrdersByUid(String user_id) {
		String sql = "SELECT * FROM product p, orders s WHERE p.product_id = s.product_id AND s.user_id = ?";
		List<OrderVO> order_list = new ArrayList<>();

		try {
			psmt = agent.getCon().prepareStatement(sql);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int order_id = rs.getInt("order_id");
				int product_id = rs.getInt("product_id");
				Date order_time = rs.getDate("order_time");
				String address = rs.getString("address");
				String payment = rs.getString("payment");
				String delivery = rs.getString("delivery");
				int price = rs.getInt("s.price");

				OrderVO order = new OrderVO(order_id, product_id, order_time, address, payment, user_id, delivery,
						price);
				order_list.add(order);
			}

		} catch (SQLException e) {
			System.err.println("* Order Select Error");
		}
		return order_list;
	}

	public ProductVO selectProductByOrderId(int orderId) {
		PreparedStatement psmt = null;
		ResultSet rs = null;
		ProductDAO productDAO = new ProductDAOImpl();
		ProductVO product = null;

		String sql = "select product_id from orders where order_id = ?";
		try {
			psmt = agent.getCon().prepareStatement(sql);
			psmt.setInt(1, orderId);

			rs = psmt.executeQuery();
			if (rs.next()) {
				int product_id = rs.getInt("product_id");
				product = productDAO.selectProductByPid(product_id);
			}
		} catch (SQLException e) {
			System.err.println("* Order Select Error");
		}

		return product;
	}

	public int insertOrder(OrderVO order) {
		String sql = "INSERT INTO orders(product_id, address, payment, user_id, delivery, price, order_time) VALUES (?,?,?,?,?,?, sysdate())";
		PreparedStatement psmt = null;
		int result = 0;
		try {
			psmt = agent.getCon().prepareStatement(sql);
			psmt.setInt(1, order.getProduct_id());
			psmt.setString(2, order.getAddress());
			psmt.setString(3, order.getPayment());
			psmt.setString(4, order.getUser_id());
			psmt.setString(5, order.getDelivery());
			psmt.setInt(6, order.getPrice());

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println("* Order Insert Error");
		}
		return result;
	}

	public int deleteOrder(int order_id) {
		String sql = "delete from orders where order_id = ?";
		PreparedStatement psmt = null;
		int result = 0;

		try {
			psmt = agent.getCon().prepareStatement(sql);
			psmt.setInt(1, order_id);

			result = psmt.executeUpdate();
			psmt.close();
		} catch (SQLException e) {
			System.err.println("* Order Delete Error");
		}
		return result;
	}

	public int updateDeliveryStatus(int order_id, String value) {
		String sql = "update orders set delivery = ? where order_id= ?;";
		PreparedStatement psmt = null;
		int result = 0;

		try {
			psmt = agent.getCon().prepareStatement(sql);
			psmt.setString(1, value);
			psmt.setInt(2, order_id);

			result = psmt.executeUpdate();
			psmt.close();
		} catch (SQLException e) {
			System.err.println("* Order Update Error");
		}
		return result;
	}

	// 상품 당 주문 건수
	public HashMap<Integer, Integer> selectOrderStatus() {
		String sql = "select product_id, count(order_id) as cnt from orders group by product_id;";

		HashMap<Integer, Integer> status = new HashMap<>();
		try {
			stmt = agent.getCon().createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				int cnt = rs.getInt("cnt");
				int product_id = rs.getInt("product_id");
				status.put(product_id, cnt);
			}
		} catch (Exception e) {
			System.err.println("* Order Select Error");
		}
		return status;
	}

}
