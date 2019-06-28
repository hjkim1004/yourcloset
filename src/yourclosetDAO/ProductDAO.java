package yourclosetDAO;

import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import yourcloset.util.DBAgent;
import yourclosetDTO.ProductDTO;

public class ProductDAO {
	public ProductDAO() {} // defalt 객체 생성자

	public ProductDTO selectProductByPid(int pid) {
		DBAgent agent = new DBAgent();
		String sql = "SELECT pname,price,size,category,stock,point FROM product WHERE pid = ?;";

		try {
			PreparedStatement psmt = agent.getCon().prepareStatement(sql);
			psmt.setInt(1, pid);

			ResultSet rs = psmt.executeQuery();
			ProductDTO product = null;

			// 유저정보 가져오기
			while (rs.next()) {

				String pname = rs.getString("pname");
				int price = rs.getInt("price");
				String size = rs.getString("size");
				String category = rs.getString("category");
				int stock = rs.getInt("stock");
				int point = rs.getInt("point");

				product = new ProductDTO(pid, pname, price, size, category, stock, point);
			}
			return product;
		} catch (Exception e) {
			agent.close();
			e.printStackTrace();
			return null;
		} finally {
			agent.close();
		}
	}
	
	public List<ProductDTO> selectProductByCategory(String category) {
		DBAgent agent = new DBAgent();
		String sql = "SELECT pname,price,pid FROM product WHERE category = ?;";

		try {
			PreparedStatement psmt = agent.getCon().prepareStatement(sql);
			psmt.setString(1, category);

			ResultSet rs = psmt.executeQuery();
			List<ProductDTO> productList = new ArrayList<>();
			
			// 유저정보 가져오기
			while (rs.next()) {

				String pname = rs.getString("pname");
				int price = rs.getInt("price");
				int pid = rs.getInt("pid");
				
				ProductDTO product = new ProductDTO(pname,price,pid);
				productList.add(product);
			}
			return productList;
		} catch (Exception e) {
			agent.close();
			e.printStackTrace();
			return null;
		} finally {
			agent.close();
		}
	}
	
	public List<ProductDTO> selectProductAll(){
		DBAgent agent = new DBAgent();
		String sql = "SELECT * FROM product"; // 매개변수가 없으므로 Statement 객체로 바꿈

		try {
			Statement stmt = agent.getCon().createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			List<ProductDTO> productList = new ArrayList<>();
			while (rs.next()) {

				int pid = rs.getInt("pid");
				String pname = rs.getString("pname");
				String size = rs.getString("size");
				int price = rs.getInt("price");
				String category = rs.getString("category");
				int stock = rs.getInt("stock");
				int point = rs.getInt("point");
				
				ProductDTO product = new ProductDTO(pid, pname, price, size, category, stock, point);
				productList.add(product);
			}
			return productList;
		} catch (Exception e) {
			agent.close();
			e.printStackTrace();
			return null;
		} finally {
				agent.close();
		}
	}

	public int insertProduct(ProductDTO product) {
		DBAgent agent = new DBAgent();
		String sql = "insert into product(pname, price, size, category, stock, point) values(?,?,?,?,?,?);";

		try {
			PreparedStatement psmt = agent.getCon().prepareStatement(sql);
			psmt.setString(1, product.getPname());
			psmt.setInt(2, product.getPrice());
			psmt.setString(3, product.getSize());
			psmt.setString(4, product.getCategory());
			psmt.setInt(5, product.getStock());
			psmt.setInt(6, product.getPoint());

			return psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			agent.close();
		}
	}
	
	public int deleteProduct(int pid) {
		DBAgent agent = new DBAgent();
		String sql = "delete from product where pid=?;";
		try {
			PreparedStatement psmt = agent.getCon().prepareStatement(sql);
			psmt.setInt(1, pid);
			return psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
		
		
	}
}
