package com.yourcloset.utils;

import java.sql.*;
import java.util.Enumeration;
import java.util.Properties;
import java.util.ResourceBundle;

public class JdbcAgent {
	private Connection con = null;

	public JdbcAgent() {
		Properties prop = loadProperties("com/yourcloset/properties/database");
		String driverClassName = prop.getProperty("jdbc.driverClassName");
		String url = prop.getProperty("jdbc.url");
		String username = prop.getProperty("jdbc.username");
		String password = prop.getProperty("jdbc.password");

		try {
			Class.forName(driverClassName);
			con = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {
			System.err.println("* Driver Load 오류; " + e.getMessage());
		} catch (SQLException e) {
			System.err.println("* DB 연결 실패; " + e.getMessage());
		} catch (Exception e) {
			System.err.println("* 예상치 못한 오류 발생; " + e.getMessage());
		}
	}

	private Properties loadProperties(String path) {
		ResourceBundle rbHome = ResourceBundle.getBundle(path);// 누구를 실행할지를 rb에
		Enumeration<String> keys = rbHome.getKeys();
		Properties prop = new Properties();

		while (keys.hasMoreElements()) {
			String property = keys.nextElement();
			String value = rbHome.getString(property);
			prop.setProperty(property, value);
		}
		
		return prop;
	}

	public void close() {
		try {
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Connection getCon() {
		return con;
	}

	public static void main(String[] args) throws SQLException {
		/* Connection Test */
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select user_id, user_name from user";
		JdbcAgent agent = new JdbcAgent();

		stmt = agent.getCon().createStatement();
		rs = stmt.executeQuery(sql);

		while (rs.next()) {
			String id = rs.getString("id");
			String name = rs.getString("name");
			System.out.println(String.format("User(ID:%s, NAME:%s)", id, name));
		}

	}
}
