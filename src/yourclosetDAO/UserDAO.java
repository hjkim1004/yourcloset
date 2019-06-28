package yourclosetDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import yourcloset.util.DBAgent;
import yourclosetDTO.UserDTO;

public class UserDAO {
	public boolean isUser(String userid) {
		DBAgent agent = new DBAgent();
		
		String sql = "select id from user;";
		Statement stmt;
		try {
			stmt = agent.getCon().createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String id = rs.getString("id");
				if(id.toString().equals(userid.toString())) return true;
			}
		} catch (SQLException e) {
			agent.close();
			System.err.println("SQL Error!!");
		}finally {
			agent.close();
		}
		return false;
	}
	public String login(String userId, String password) {
		DBAgent agent = new DBAgent();

		String sql = "SELECT id, md5(pw) FROM user WHERE id = ? AND pw = ?;";

		try {
			PreparedStatement psmt = agent.getCon().prepareStatement(sql);
			psmt.setString(1, userId);
			psmt.setString(2, password);

			ResultSet rs = psmt.executeQuery();

			if (rs.next()) {
				return userId;
			} else
				return null;

		} catch (Exception e) {
			agent.close();
			e.printStackTrace();
			return null;
		} finally {
			agent.close();
		}
	}

	
	public int SignUp(UserDTO user) {
		DBAgent agent = new DBAgent();
		
		String sql = "INSERT INTO user(id,pw,name,address,point,position) VALUES( ? , ? , ? , ? , 0, ?)";
		try {
			PreparedStatement psmt = agent.getCon().prepareStatement(sql);
			psmt.setString(1, user.getId());
			psmt.setString(2, user.getPw());
			psmt.setString(3, user.getName());
			psmt.setString(4, user.getAddress());
			psmt.setString(5, "customer");
			return psmt.executeUpdate();

		} catch (SQLException e) {
			agent.close();
			e.printStackTrace();
		} finally {
			agent.close();
		}
		return 0;
	}

	public String login(String userId, String password, String position) {
		DBAgent agent = new DBAgent();
		
		String sql = "SELECT id, md5(pw) FROM user WHERE id = ? AND pw = ? AND position = ?";

		try {
			PreparedStatement psmt = agent.getCon().prepareStatement(sql);
			psmt.setString(1, userId);
			psmt.setString(2, password);
			psmt.setString(3, position);

			ResultSet rs = psmt.executeQuery();

			if (rs.next())
				return userId;
			else
				return null;

		} catch (Exception e) {
			agent.close();
			e.printStackTrace();
			return null;
		} finally {
			agent.close();
		}
	}
	public UserDTO selectUserByUserId(String userId) {
		DBAgent agent = new DBAgent();

		String sql = "SELECT id,pw,name,address,point,position FROM user WHERE id = ?";

		try {
			PreparedStatement psmt = agent.getCon().prepareStatement(sql);
			psmt.setString(1, userId);

			ResultSet rs = psmt.executeQuery();
			UserDTO user = null;

			// 유저정보 가져오기
			while (rs.next()) {

				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String address = rs.getString("address");
				int point = rs.getInt("point");
				String position = rs.getString("position");
				
				user = new UserDTO(id,pw,name,address,point, position);
			}

			return user;

		} catch (Exception e) {
			agent.close();
			e.printStackTrace();
			return null;

		} finally {
			agent.close();
		}
	}
	public int updateUserInfo(String userid, String column, Object value) {
		DBAgent agent = new DBAgent();
		
		String sql = "update user set "+column+" = ? where id=?;";
		try {
			PreparedStatement psmt = agent.getCon().prepareStatement(sql);
			psmt.setObject(1, value);
			psmt.setString(2, userid);
			return psmt.executeUpdate();
		} catch (SQLException e) {
			agent.close();
			e.printStackTrace();
			return 0;
		}finally {
			agent.close();
		}
	}

	public List<UserDTO> selectAllUser(){
		DBAgent agent = new DBAgent();
		String sql = "SELECT id,pw,name,address,point FROM user where position='customer'"; // 매개변수가 없으므로 Statement 객체로 바꿈

		try {
			Statement stmt = agent.getCon().createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			List<UserDTO> userList = new ArrayList<>();
			while (rs.next()) {

				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String address = rs.getString("address");
				int point = rs.getInt("point");
				
				UserDTO product = new UserDTO(id,pw,name,address,point);
				userList.add(product);
			}
			return userList;
		} catch (Exception e) {
			agent.close();
			e.printStackTrace();
			return null;
		} finally {
				agent.close();
		}
	}

	
}
