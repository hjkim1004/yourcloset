package com.yourcloset.utils;

import java.sql.*;

public class JdbcAgent {
	private String server = "127.0.0.1";
	private String port = "3306";
	private String database = "yourcloset";
	private String username = "root";
	private String password = "Mysql123!@#";
	private String query = "serverTimezone=Asia/Seoul&characterEncoding=utf-8";
	private String url = String.format("jdbc:mysql://%s:%s/%s?%s", server, port, database, query);
	
	private Connection con = null;

	public JdbcAgent() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
		}
		catch (ClassNotFoundException e) {
			System.err.println("* Driver Load 오류; " + e.getMessage());
		}
		catch (SQLException e) {
			System.err.println("* DB 연결 실패; " + e.getMessage());
		}
		catch(Exception e) {
			System.err.println("* 예상치 못한 오류 발생; " + e.getMessage());
		}
	}

	public void close() {
		try {
			if (con != null) con.close();
		} 
		catch (SQLException e) {
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
		
		String sql = "select id, name from user";
		JdbcAgent agent = new JdbcAgent();
		
		stmt = agent.getCon().createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			String id = rs.getString("id");
			String name = rs.getString("name");
			System.out.println(String.format("User(ID:%s, NAME:%s)", id, name));
		}
		
	}
}

