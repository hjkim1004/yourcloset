package com.yourcloset.user.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.yourcloset.user.vo.UserVO;
import com.yourcloset.utils.JdbcAgent;

public class UserDAOImpl implements UserDAO {
	private JdbcAgent agent = null;
	private PreparedStatement psmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	private String IsUser_SQL = "SELECT user_id from user";
	private String LOGIN_SQL = "SELECT user_id, md5(password) FROM user WHERE user_id = ? AND password = ?";
	private String INSERT_SQL = "INSERT INTO user VALUES (?, ?, ?, ?, 0, 'customer')";
	private String SelectUserByUserId_SQL = "SELECT * FROM user WHERE user_id = ?";
	private String SelectAll_SQL = "SELECT * FROM user WHERE position='customer'";

	public UserDAOImpl() {
		agent = new JdbcAgent();
	}

	@Override
	public boolean isUser(String userid) {
		boolean result = false;
		try {
			stmt = agent.getCon().createStatement();
			rs = stmt.executeQuery(IsUser_SQL);
			if (rs.next())
				result = true;

			rs.close();
			stmt.close();
		} catch (SQLException e) {
			System.err.println("* User Not Found Error; "+e.getMessage());
		}
		return result;
	}

	@Override
	public String login(String user_id, String password) {
		String id = null;
		try {
			psmt = agent.getCon().prepareStatement(LOGIN_SQL);
			psmt.setString(1, user_id);
			psmt.setString(2, password);

			rs = psmt.executeQuery();
			if (rs.next())
				id = user_id;

			rs.close();
			psmt.close();

		} catch (SQLException e) {
			System.err.println("* User Login Error; "+e.getMessage());
		}
		return id;
	}

	@Override
	public int signUp(UserVO user) {
		int result = 0;
		try {
			psmt = agent.getCon().prepareStatement(INSERT_SQL);
			psmt.setString(1, user.getUser_id());
			psmt.setString(2, user.getPassword());
			psmt.setString(3, user.getUser_name());
			psmt.setString(4, user.getUser_address());

			result = psmt.executeUpdate();
			psmt.close();
		} catch (SQLException e) {
			System.err.println("* User Insert Error; " + e.getMessage());
		}
		return result;
	}

	@Override
	public UserVO selectUserByUserId(String userId) {
		UserVO user = null;

		try {
			psmt = agent.getCon().prepareStatement(SelectUserByUserId_SQL);
			psmt.setString(1, userId);

			rs = psmt.executeQuery();

			if (rs.next()) {
				String id = rs.getString("user_id");
				String pw = rs.getString("password");
				String name = rs.getString("user_name");
				String address = rs.getString("user_address");
				int point = rs.getInt("point");
				String position = rs.getString("position");

				user = new UserVO(id, pw, name, address, point, position);
			}
			rs.close();
			psmt.close();
		} catch (SQLException e) {
			System.err.println("* User Select Error; " + e.getMessage());
		}
		return user;
	}

	@Override
	public int updateUserInfo(String user_id, String column, Object value) {
		String sql = "update user set " + column + " = ? where id=?";
		int result = 0;

		try {
			psmt = agent.getCon().prepareStatement(sql);
			psmt.setObject(1, value);
			psmt.setString(2, user_id);

			result = psmt.executeUpdate();
			psmt.close();
		} catch (SQLException e) {
			System.err.println("* User Update Error; " + e.getMessage());
		}
		return result;
	}

	@Override
	public List<UserVO> selectAllUser() {
		List<UserVO> user_list = new ArrayList<>();

		try {
			stmt = agent.getCon().createStatement();
			rs = stmt.executeQuery(SelectAll_SQL);

			while (rs.next()) {
				String id = rs.getString("user_id");
				String password = rs.getString("password");
				String name = rs.getString("user_name");
				String address = rs.getString("user_address");
				int point = rs.getInt("point");

				UserVO user = new UserVO(id, password, name, address, point);
				user_list.add(user);
			}

			rs.close();
			stmt.close();
		} catch (Exception e) {
			System.err.println("* User Select Error; " + e.getMessage());
		}
		return user_list;
	}

}
