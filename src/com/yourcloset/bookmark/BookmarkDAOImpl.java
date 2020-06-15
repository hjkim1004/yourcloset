package com.yourcloset.bookmark;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yourcloset.utils.JdbcAgent;

public class BookmarkDAOImpl implements BookmarkDAO {
	private JdbcAgent agent = null;
	private String INSERT_SQL = "INSERT INTO bookmark VALUES(NULL, ?,?);";
	private String SelectBookmarkByUserId_SQL = "SELECT * FROM bookmark WHERE user_id = ? ORDER BY bookmark_id";
	
	public BookmarkDAOImpl() {
		agent = new JdbcAgent();
	}
	
	@Override
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

				BookmarkVO bookmark = new BookmarkVO(bid, pid, uid);
				bookmark_list.add(bookmark);
			}
			
			rs.close();
			psmt.close();
		} 
		catch (Exception e) {
			System.err.println("* Bookmark Select Error; " + e.getMessage());
		}
		return bookmark_list;
	}
	
	@Override
	public int insertBookmark(BookmarkVO bookmark) {
		PreparedStatement psmt = null;
		int result = 0;
		
		try {
			psmt = agent.getCon().prepareStatement(INSERT_SQL);
			psmt.setInt(1, bookmark.getBookmarkId());
			psmt.setString(2, bookmark.getUser_id());
	
			result = psmt.executeUpdate();
			psmt.close();
		} 
		catch (SQLException e) {
			System.err.println("* Bookmark Insert Error; " + e.getMessage());
		}
		return result;
	}
	
	
	@Override
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
			System.err.println("* Bookmark Delete Error; " + e.getMessage());
		}
		return result;
	}

}
