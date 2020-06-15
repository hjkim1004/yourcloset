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

public class OrderDAOImpl implements OrderDAO {
	private JdbcAgent agent = null;

	private PreparedStatement psmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	private String SelectDelivery_SQL = "SELECT product_id, delivery FROM orders WHERE order_id =?";
	private String SelectOrders_SQL = "SELECT * FROM product p, orders s WHERE p.product_id = s.product_id";
	private String SelectOrdersByUserId_SQL = "SELECT * FROM product p, orders s WHERE p.product_id = s.product_id AND s.user_id = ?";
	private String INSERT_SQL = "INSERT INTO orders(product_id, address, payment, user_id, delivery, price, order_time) VALUES (?,?,?,?,?,?, sysdate())";
	private String DELETE_SQL = "DELETE FROM orders WHERE order_id = ?";
	private String SelectOrderStatus_SQL = "SELECT product_id, count(order_id) as cnt FROM orders GROUP BY product_id;";

	public OrderDAOImpl() {
		agent = new JdbcAgent();
	}

	@Override
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

	@Override
	public List<OrderVO> selectOrdersByDeliveryState() {
		List<OrderVO> order_list = new ArrayList<>();
		
		try {
			stmt = agent.getCon().createStatement();
			rs = stmt.executeQuery(SelectOrders_SQL);

			while (rs.next()) {
				int order_id = rs.getInt("order_id");
				int product_id = rs.getInt("product_id");
				String user_id = rs.getString("user_id");
				Date order_time = rs.getDate("order_time");
				String address = rs.getString("address");
				String payment = rs.getString("payment");
				String delivery = rs.getString("delivery");
				int price = rs.getInt("s.price");

				OrderVO order = new OrderVO(order_id, product_id, order_time, address, payment, user_id, delivery, price);
				order_list.add(order);
			}
		} 
		catch (SQLException e) {
			System.err.println("* Order Select Error");
		}
		return order_list;
	}

	@Override
	public List<OrderVO> selectOrdersByUserId(String user_id) {
		List<OrderVO> order_list = new ArrayList<>();

		try {
			psmt = agent.getCon().prepareStatement(SelectOrdersByUserId_SQL);
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

				OrderVO order = new OrderVO(order_id, product_id, order_time, address, payment, user_id, delivery, price);
				order_list.add(order);
			}
			
			rs.close();
			psmt.close();
		} 
		catch (SQLException e) {
			System.err.println("* Order Select Error");
		}
		return order_list;
	}

	@Override
	public ProductVO selectProductByOrderId(int order_id) {
		ProductDAO productDAO = new ProductDAOImpl();
		ProductVO product = null;

		String sql = "select product_id from orders where order_id = ?";
		try {
			psmt = agent.getCon().prepareStatement(sql);
			psmt.setInt(1, order_id);

			rs = psmt.executeQuery();
			if (rs.next()) {
				int product_id = rs.getInt("product_id");
				product = productDAO.selectProductByProductId(product_id);
			}
			
			rs.close();
			psmt.close();
		} 
		catch (SQLException e) {
			System.err.println("* Order Select Error");
		}

		return product;
	}

	@Override
	public int insertOrder(OrderVO order) {
		int result = 0;
		try {
			psmt = agent.getCon().prepareStatement(INSERT_SQL);
			psmt.setInt(1, order.getProduct_id());
			psmt.setString(2, order.getAddress());
			psmt.setString(3, order.getPayment());
			psmt.setString(4, order.getUser_id());
			psmt.setString(5, order.getDelivery());
			psmt.setInt(6, order.getPrice());

			result = psmt.executeUpdate();
			psmt.close();
		} 
		catch (SQLException e) {
			System.err.println("* Order Insert Error");
		}
		return result;
	}

	@Override
	public int deleteOrder(int order_id) {
		int result = 0;

		try {
			psmt = agent.getCon().prepareStatement(DELETE_SQL);
			psmt.setInt(1, order_id);

			result = psmt.executeUpdate();
			psmt.close();
		} catch (SQLException e) {
			System.err.println("* Order Delete Error");
		}
		return result;
	}

	@Override
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
	@Override
	public HashMap<ProductVO, Integer> selectOrderStatus() {
		HashMap<ProductVO, Integer> status = new HashMap<>();
		ProductDAO productDAO = new ProductDAOImpl();
		
		try {
			stmt = agent.getCon().createStatement();
			rs = stmt.executeQuery(SelectOrderStatus_SQL);
			while (rs.next()) {
				int cnt = rs.getInt("cnt");
				ProductVO product = productDAO.selectProductByProductId(rs.getInt("product_id"));
				status.put(product, cnt);
			}
		} catch (Exception e) {
			System.err.println("* Order Select Error");
		}
		return status;
	}

}
