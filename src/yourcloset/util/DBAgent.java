/*
 * DBAgent Class
 * DBAgent에서 DB와 연결처리
 */

package yourcloset.util;

import java.sql.*;

public class DBAgent {
	private String server = "127.0.0.1:3306"; // 로컬 DBMS 서버주소

	// 접속할 DB, 사용자 ID, 패스워드를 저장
	private String database = "yourcloset";
	private String username = "root";
	private String password = "onlyroot";

	// DBMS 연결, SQL 문장 수행, 결과 처리를 위해 필요한 변수
	private Connection con = null;

	// 코드의
	public DBAgent() {
		try {
			Class.forName("com.mysql.jdbc.Driver");

		} catch (java.lang.ClassNotFoundException e) {
			System.err.println("  !! <JDBC 오류 > Driver load 오류: " + e.getMessage());
			e.printStackTrace();
		}
		// Conncetion 객체 생성 - loadConnect 코드의 중복을 빼기 위해 생성자에서 처리
		try {
			con = DriverManager.getConnection("jdbc:mysql://" + server + "/" + database + "?characterEncoding=euckr",
					username, password);

			System.out.println("");

		} catch (SQLException ex) {

			System.err.println("conn 오류:" + ex.getMessage());
			ex.printStackTrace();
		}
	}

	public void close() {
		try {
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		;

	}

	public Connection getCon() {
		return con;
	}
}
