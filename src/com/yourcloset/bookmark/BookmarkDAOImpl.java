package com.yourcloset.bookmark;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yourcloset.utils.JdbcAgent;

public class BookmarkDAO {
	private JdbcAgent agent = null;
	private String INSERT_SQL = "insert into bookmark(pid, userid) values(?,?);";
	private String SelectBookmarkByUserId_SQL = "SELECT * FROM bookmark WHERE userid = ? order by bookmark_id";
	
	public BookmarkDAO() {
		agent = new JdbcAgent();
	}
	
	public List<BookmarkVO> selectBookmarkByUserId(String userId) {
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<BookmarkVO> bookmark_list = new ArrayList<>();

		try {
			psmt = agent.getCon().prepareStatement(SelectBookmarkByUserId_SQL);
			psmt.setString(1, userId);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int bid = rs.getInt("bookmark_id");
				int pid = rs.getInt("product_id");
				String uid = rs.getString("user_id");

				BookmarkVO bookMark = new BookmarkVO(bid, pid, uid);
				bookmark_list.add(bookMark);
			}
			
			rs.close();
			psmt.close();
		} 
		catch (Exception e) {
			System.err.println("* Bookmark Select Error");
		}
		return bookmark_list;
	}
	
	public int insertBookmark(BookmarkVO bookmark) {
		PreparedStatement psmt = null;
		int result = 0;
		
		try {
			psmt = agent.getCon().prepareStatement(INSERT_SQL);
			psmt.setInt(1, bookmark.getBookmark_id());
			psmt.setString(2, bookmark.getUser_id());
	
			result = psmt.executeUpdate();
			psmt.close();
		} 
		catch (SQLException e) {
			System.err.println("* Bookmark Insert Error");
		}
		return result;
	}
	
	
	public int deleteBookmark(int bookmark_id) {
		PreparedStatement psmt = null;
		int result = 0;
		String DELETE_SQL = "delete from bookmark where bookmark_id =?;";
		try {
			psmt = agent.getCon().prepareStatement(DELETE_SQL);
			psmt.setInt(1, bookmark_id);

			result = psmt.executeUpdate();
			psmt.close();
		} 
		catch(SQLException e) {
			System.err.println("* Bookmark Delete Error");
		}
		return result;
	}

}
