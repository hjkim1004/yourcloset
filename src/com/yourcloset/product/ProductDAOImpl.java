package com.yourcloset.product;

import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yourcloset.utils.JdbcAgent;

public class ProductDAOImpl implements ProductDAO {
	private JdbcAgent agent;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;
	
	private String SelectProductsByCategory_SQL = "SELECT * FROM product WHERE category = ?";
	private String SelectProductByProductId_SQL = "SELECT * FROM product WHERE product_id = ?";
	private String SelectProductsAll_SQL = "SELECT * FROM product";
	private String INSERT_SQL = "insert into product(product_name, price, size, category, stock, point) values(?,?,?,?,?,?)";
	private String DELETE_SQL = "delete from product where product_id=?";
	
	public ProductDAOImpl() {
		agent = new JdbcAgent();
	}

	@Override
	public ProductVO selectProductByProductId(int product_id) {
		ProductVO product = null;

		try {
			psmt = agent.getCon().prepareStatement(SelectProductByProductId_SQL);
			psmt.setInt(1, product_id);

			rs = psmt.executeQuery();

			if (rs.next()) {
				String product_name = rs.getString("product_name");
				int price = rs.getInt("price");
				String size = rs.getString("size");
				String category = rs.getString("category");
				int stock = rs.getInt("stock");
				int point = rs.getInt("point");

				product = new ProductVO(product_id, product_name, price, size, category, stock, point);
			}
			rs.close();
			psmt.close();

		} catch (SQLException e) {
			System.err.println("* Product Select Error");
		}

		return product;
	}

	@Override
	public List<ProductVO> selectProductsByCategory(String category) {
		List<ProductVO> productList = new ArrayList<ProductVO>();

		try {
			psmt = agent.getCon().prepareStatement(SelectProductsByCategory_SQL);
			psmt.setString(1, category);

			rs = psmt.executeQuery();

			while (rs.next()) {
				int product_id = rs.getInt("product_id");
				String product_name = rs.getString("product_name");
				int price = rs.getInt("price");
				String size = rs.getString("size");
				int stock = rs.getInt("stock");
				int point = rs.getInt("point");

				ProductVO product = new ProductVO(product_id, product_name, price, size, category, stock, point);
				productList.add(product);
			}
			rs.close();
			psmt.close();
		} 
		catch (SQLException e) {
			System.err.println("* Product Select Error; "+e.getMessage());
		}
		return productList;
	}

	@Override
	public List<ProductVO> selectProductsAll() {
		Statement stmt = null;
		ResultSet rs = null;
		List<ProductVO> product_list = new ArrayList<ProductVO>();
		
		try {
			stmt = agent.getCon().createStatement();
			rs = stmt.executeQuery(SelectProductsAll_SQL);

			while (rs.next()) {

				int product_id = rs.getInt("product_id");
				String product_name = rs.getString("product_name");
				String size = rs.getString("size");
				int price = rs.getInt("price");
				String category = rs.getString("category");
				int stock = rs.getInt("stock");
				int point = rs.getInt("point");

				ProductVO product = new ProductVO(product_id, product_name, price, size, category, stock, point);
				product_list.add(product);
			}
		} catch (SQLException e) {
			System.err.println("* Product Select Error; "+e.getMessage());
		}
		return product_list;
	}

	@Override
	public int insertProduct(ProductVO product) {
		PreparedStatement psmt = null;
		int result = 0;
		
		try {
			psmt = agent.getCon().prepareStatement(INSERT_SQL);
			psmt.setString(1, product.getProduct_name());
			psmt.setInt(2, product.getPrice());
			psmt.setString(3, product.getSize());
			psmt.setString(4, product.getCategory());
			psmt.setInt(5, product.getStock());
			psmt.setInt(6, product.getPoint());

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println("* Product Insert Error; "+e.getMessage());
		}
		
		return result;
	}

	@Override
	public int deleteProduct(int product_id) {
		PreparedStatement psmt = null;
		int result = 0;
		
		try {
			psmt = agent.getCon().prepareStatement(DELETE_SQL);
			psmt.setInt(1, product_id);
			result = psmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println("* Product Delete Error; "+e.getMessage());
		}
		return result;
	}
}
