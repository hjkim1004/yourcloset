package com.yourcloset.user;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.yourcloset.utils.JdbcAgent;

public class UserDAOImpl implements UserDAO {
	private JdbcAgent agent = null;
	private String IsUser_SQL = "select id from user;";
	private String LOGIN_SQL = "SELECT id, md5(pw) FROM user WHERE id = ? AND pw = ?";
	private String INSERT_SQL = "INSERT INTO user(id,pw,name,address,point,position) VALUES( ? , ? , ? , ? , 0, ?)";
	private String SelectUserByUserId_SQL = "SELECT id,pw,name,address,point,position FROM user WHERE id = ?";
	private String SelectAll_SQL="SELECT * FROM user WHERE position='customer'";
	
	public UserDAOImpl() {
		agent = new JdbcAgent();
	}
	
	@Override
	public boolean isUser(String userid) {
		Statement stmt = null;
		ResultSet rs = null;
		boolean result = false;
		try {
			stmt = agent.getCon().createStatement();
			rs = stmt.executeQuery(IsUser_SQL);
			if (rs.next()) result = true;
			
			rs.close();
			stmt.close();
		} 
		catch (SQLException e) {
			System.err.println("* User Not Found Error");
		}
		return result;
	}

	
	@Override
	public String login(String userId, String password) {
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String id = null;
		try {
			psmt = agent.getCon().prepareStatement(LOGIN_SQL);
			psmt.setString(1, userId);
			psmt.setString(2, password);

			rs = psmt.executeQuery();
			if (rs.next()) id = userId;
			
			rs.close();
			psmt.close();

		} catch (SQLException e) {
			System.err.println("* User Login Error");
		}
		return id;
	}

	
	@Override
	public int signUp(UserVO user) {
		PreparedStatement psmt = null;
		int result = 0;
		try {
			psmt = agent.getCon().prepareStatement(INSERT_SQL);
			psmt.setString(1, user.getId());
			psmt.setString(2, user.getPassword());
			psmt.setString(3, user.getName());
			psmt.setString(4, user.getAddress());
			psmt.setString(5, "customer");
			
			result = psmt.executeUpdate();
			psmt.close();
		} 
		catch (SQLException e) {
			System.err.println("* User Insert Error");
		}
		return result;
	}

	
	@Override
	public UserVO selectUserByUserId(String userId) {
		PreparedStatement psmt = null;
		ResultSet rs = null;
		UserVO user = null;
		
		try {
			psmt = agent.getCon().prepareStatement(SelectUserByUserId_SQL);
			psmt.setString(1, userId);

			rs = psmt.executeQuery();
			
			if (rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String address = rs.getString("address");
				int point = rs.getInt("point");
				String position = rs.getString("position");

				user = new UserVO(id, pw, name, address, point, position);
			}
			rs.close();
			psmt.close();
		}
		catch (SQLException e) {
			System.err.println("* User Select Error");
		}
		return user;
	}

	
	@Override
	public int updateUserInfo(String userid, String column, Object value) {
		String sql = "update user set " + column + " = ? where id=?";
		PreparedStatement psmt = null;
		int result = 0;
		
		try {
			psmt = agent.getCon().prepareStatement(sql);
			psmt.setObject(1, value);
			psmt.setString(2, userid);
			
			result = psmt.executeUpdate();
			psmt.close();
		} catch (SQLException e) {
			System.err.println("* User Update Error");
		}
		return result;
	}

	
	@Override
	public List<UserVO> selectAllUser() {
		Statement stmt = null;
		ResultSet rs = null;
		List<UserVO> user_list = new ArrayList<>();
		
		try {
			stmt = agent.getCon().createStatement();
			rs = stmt.executeQuery(SelectAll_SQL);
			
			while (rs.next()) {
				String id = rs.getString("id");
				String password = rs.getString("pw");
				String name = rs.getString("name");
				String address = rs.getString("address");
				int point = rs.getInt("point");

				UserVO user = new UserVO(id, password, name, address, point);
				user_list.add(user);
			}
			
			rs.close();
			stmt.close();
		} catch (Exception e) {
			System.err.println("* User Select Error");
		}
		return user_list;
	}

}
