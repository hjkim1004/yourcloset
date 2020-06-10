package yourclosetDAO;

import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yourcloset.utils.JdbcAgent;

import yourclosetDTO.ProductDTO;

public class ProductDAO {
	private JdbcAgent agent;
	private String SelectProductsByCategory_SQL = "SELECT pname,price,pid FROM product WHERE category = ?";
	private String SelectProductByPid_SQL = "SELECT pname,price,size,category,stock,point FROM product WHERE pid = ?";
	private String SelectProductsAll_SQL = "SELECT * FROM product";
	private String INSERT_SQL = "insert into product(pname, price, size, category, stock, point) values(?,?,?,?,?,?)";
	private String DELETE_SQL = "delete from product where pid=?";
	
	public ProductDAO() {
		agent = new JdbcAgent();
	}

	public ProductDTO selectProductByPid(int pid) {
		ProductDTO product = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		try {
			psmt = agent.getCon().prepareStatement(SelectProductByPid_SQL);
			psmt.setInt(1, pid);

			rs = psmt.executeQuery();

			if (rs.next()) {
				String pname = rs.getString("pname");
				int price = rs.getInt("price");
				String size = rs.getString("size");
				String category = rs.getString("category");
				int stock = rs.getInt("stock");
				int point = rs.getInt("point");

				product = new ProductDTO(pid, pname, price, size, category, stock, point);
			}
			rs.close();
			psmt.close();

		} catch (SQLException e) {
			System.err.println("* Product Select Error");
		}

		return product;
	}

	public List<ProductDTO> selectProductsByCategory(String category) {
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<ProductDTO> productList = new ArrayList<>();

		try {
			psmt = agent.getCon().prepareStatement(SelectProductsByCategory_SQL);
			psmt.setString(1, category);

			rs = psmt.executeQuery();

			while (rs.next()) {

				String pname = rs.getString("pname");
				int price = rs.getInt("price");
				int pid = rs.getInt("pid");

				ProductDTO product = new ProductDTO(pname, price, pid);
				productList.add(product);
			}
			rs.close();
			psmt.close();
		} 
		catch (SQLException e) {
			System.err.println("* Product Select Error");
		}
		return productList;
	}

	public List<ProductDTO> selectProductsAll() {
		Statement stmt = null;
		ResultSet rs = null;
		List<ProductDTO> product_list = new ArrayList<ProductDTO>();
		
		try {
			stmt = agent.getCon().createStatement();
			rs = stmt.executeQuery(SelectProductsAll_SQL);

			while (rs.next()) {

				int pid = rs.getInt("pid");
				String pname = rs.getString("pname");
				String size = rs.getString("size");
				int price = rs.getInt("price");
				String category = rs.getString("category");
				int stock = rs.getInt("stock");
				int point = rs.getInt("point");

				ProductDTO product = new ProductDTO(pid, pname, price, size, category, stock, point);
				product_list.add(product);
			}
		} catch (SQLException e) {
			System.err.println("* Product Select Error");
		}
		return product_list;
	}

	public int insertProduct(ProductDTO product) {
		PreparedStatement psmt = null;
		int result = 0;
		
		try {
			psmt = agent.getCon().prepareStatement(INSERT_SQL);
			psmt.setString(1, product.getPname());
			psmt.setInt(2, product.getPrice());
			psmt.setString(3, product.getSize());
			psmt.setString(4, product.getCategory());
			psmt.setInt(5, product.getStock());
			psmt.setInt(6, product.getPoint());

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println("* Product Insert Error");
		}
		
		return result;
	}

	public int deleteProduct(int pid) {
		PreparedStatement psmt = null;
		int result = 0;
		
		try {
			psmt = agent.getCon().prepareStatement(DELETE_SQL);
			psmt.setInt(1, pid);
			result = psmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println("* Product Delete Error");
		}
		return result;
	}
}
