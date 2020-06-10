package yourclosetDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.yourcloset.utils.JdbcAgent;

import yourclosetDTO.ProductDTO;
import yourclosetDTO.SaleDTO;

public class SaleDAO {
	public String selectDeliveryByOrderId(int oid) {
		JdbcAgent agent = new JdbcAgent();
		
		String sql = "select pid, delivery from sale where oid =?;";
		int pid = 0;
		String delivery = null;
		try {
			PreparedStatement psmt = agent.getCon().prepareStatement(sql);
			psmt.setInt(1, oid);
			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				pid = rs.getInt("pid");
				delivery = rs.getString("delivery");
			}
			return "�ֹ���ȣ = " + oid + ", ��ǰ��ȣ = " + pid + ", ��ۻ��� = " + delivery;
		
		} catch (SQLException e) {
			agent.close();
			e.printStackTrace();
			return " * Failed! can't bring delivery state! confirm your order id";
		} finally {
			agent.close();
		}

	}
	public List<SaleDTO> selectSalesByDeliveryState(){
		JdbcAgent agent = new JdbcAgent();
		String sql = "SELECT * FROM product p, sale s WHERE p.pid = s.pid";
		try {
			List<SaleDTO> salesList = new ArrayList<>();
			Statement stmt = agent.getCon().createStatement();
			if(stmt.execute(sql) == true) {
				ResultSet rs = stmt.getResultSet();
				while(rs.next()) {
					int oid = rs.getInt("oid");
					int pid = rs.getInt("pid");
					String userId = rs.getString("userid");
					String address = rs.getString("address");
					String payment = rs.getString("payment");
					String delivery = rs.getString("delivery");
					int price = rs.getInt("price");

					SaleDTO sale = new SaleDTO(oid, pid, userId, address, payment, price, delivery);
					salesList.add(sale);
				}
				return salesList;
			}
		} catch(SQLException e) {
			agent.close();
			e.printStackTrace();
		}finally {
			agent.close();
		}
		return null;
	}
	// user uid�� �̿��� ���� ��� return
	public List<SaleDTO> selectSalesByUserId(String userId) {
		JdbcAgent agent = new JdbcAgent();
		String sql = "SELECT * FROM product p, sale s WHERE p.pid = s.pid AND s.userid = ?";

		try {
			PreparedStatement psmt = agent.getCon().prepareStatement(sql);
			psmt.setString(1, userId);
			ResultSet rs = psmt.executeQuery();

			List<SaleDTO> salesList = new ArrayList<>();

			while (rs.next()) {
				int oid = rs.getInt("oid");
				int pid = rs.getInt("pid");
				String address = rs.getString("address");
				String payment = rs.getString("payment");
				String delivery = rs.getString("delivery");
				int price = rs.getInt("s.price");

				SaleDTO sale = new SaleDTO(oid, pid, userId, address, payment, price, delivery);

				salesList.add(sale);
			}
			return salesList;

		} catch (SQLException e) {
			agent.close();
			e.printStackTrace();
		} finally {
			agent.close();
		}
		return null;
	}

	// user �ֹ���ȣ�� ���� product ��ǰ ���� �޾ƿ���
	public ProductDTO selectProductByOrderId(int orderId) { 
		JdbcAgent agent = new JdbcAgent();
		ProductDAO productDAO = new ProductDAO();
		ProductDTO product = null;
		String sql = "select pid from sale where oid = ?";
		try {
			PreparedStatement psmt = agent.getCon().prepareStatement(sql);
			psmt.setInt(1, orderId);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				int pid = rs.getInt("pid");
				product = productDAO.selectProductByPid(pid);
			}
			return product;
		} catch (SQLException e) {
			agent.close();
			e.printStackTrace();
			return null;
		} finally {
			agent.close();
		}

	}

	// user ���� �߰�
	public int insertSale(SaleDTO sale) {
		JdbcAgent agent = new JdbcAgent();
		String sql = "INSERT INTO sale(pid,address,payment,userid,delivery,price) VALUES (?,?,?,?,?,?);";

		try {
			PreparedStatement psmt = agent.getCon().prepareStatement(sql);
			psmt.setInt(1, sale.getPid());
			psmt.setString(2, sale.getAddress());
			psmt.setString(3, sale.getPayment());
			psmt.setString(4, sale.getUserId());
			psmt.setString(5, sale.getDelivery());
			psmt.setInt(6, sale.getPrice());

			return psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			agent.close();
		}
	}

	// user ���� ���
	public int deleteSale(int oid) {
		JdbcAgent agent = new JdbcAgent();
		String sql = "delete from sale where oid = "+oid+";";
		try {
			Statement stmt = agent.getCon().createStatement();
			
			return stmt.executeUpdate(sql);

		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			agent.close();
		}

	}
	
	// staff ��� ���� ����
	public int updateDeliveryStatus(int oid, String value) {
		JdbcAgent agent = new JdbcAgent();
		String sql = "update sale set delivery = ? where oid= ?;";
		try {
			PreparedStatement psmt = agent.getCon().prepareStatement(sql);
			psmt.setString(1, value);
			psmt.setInt(2, oid);
			return psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
		
	}

	// �Ǹ� ��Ȳ
	public HashMap<Integer, Integer> selectSalesStatus() {
		JdbcAgent agent = new JdbcAgent();
		String sql = "select pid, count(oid) from sale group by pid;";
		HashMap<Integer, Integer> status = new HashMap<>();
		try {
			Statement stmt = agent.getCon().createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			// ���� ��������
			while (rs.next()) {
				int oidCnt = rs.getInt("count(oid)");
				int pid = rs.getInt("pid");
				status.put(pid, oidCnt);
			}
			return status;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			agent.close();
		}	
	}

}
