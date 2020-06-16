package com.yourcloset.bookmark.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yourcloset.bookmark.vo.BookmarkVO;
import com.yourcloset.product.dao.ProductDAOImpl;
import com.yourcloset.product.vo.ProductVO;
import com.yourcloset.utils.JdbcAgent;

public class BookmarkDAOImpl implements BookmarkDAO {
	private JdbcAgent agent = null;
	private String INSERT_SQL = "INSERT INTO bookmark VALUES(NULL, ?, ?);";
	private String SelectBookmarkByUserId_SQL = "SELECT * FROM bookmark WHERE user_id = ? ORDER BY bookmark_id";
	
	public BookmarkDAOImpl() {
		agent = new JdbcAgent();
	}
	
	@Override
	public Map<BookmarkVO, ProductVO> selectBookmarkByUserId(String user_id) {
		PreparedStatement psmt = null;
		ResultSet rs = null;
		Map<BookmarkVO, ProductVO> bookmarkMap = new HashMap<BookmarkVO, ProductVO>();

		try {
			psmt = agent.getCon().prepareStatement(SelectBookmarkByUserId_SQL);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int bid = rs.getInt("bookmark_id");
				int pid = rs.getInt("product_id");

				BookmarkVO bookmark = new BookmarkVO(bid, pid, user_id);
				ProductVO product = new ProductDAOImpl().selectProductByProductId(pid);
				bookmarkMap.put(bookmark, product);
			}
			
			rs.close();
			psmt.close();
		} 
		catch (Exception e) {
			System.err.println("* Bookmark Select Error; " + e.getMessage());
		}
		return bookmarkMap;
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
