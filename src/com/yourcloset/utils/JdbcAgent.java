/*
 * DBAgent Class
 * DBAgent���� DB�� ����ó��
 */

package com.yourcloset.utils;

import java.sql.*;

public class JdbcAgent {
	private String server = "127.0.0.1:3306";

	private String database = "yourcloset";
	private String username = "root";
	private String password = "Mysql123!@#";

	private Connection con = null;

	public JdbcAgent() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://" + server + "/" + database + 
					"?serverTimeZone=Asia/Seoul&characterEncoding=utf-8", username, password);
		}
		catch (java.lang.ClassNotFoundException e) {
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
}
