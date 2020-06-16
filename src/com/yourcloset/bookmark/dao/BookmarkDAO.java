package com.yourcloset.bookmark.dao;

import java.util.Map;

import com.yourcloset.bookmark.vo.BookmarkVO;
import com.yourcloset.product.vo.ProductVO;

public interface BookmarkDAO {
	Map<BookmarkVO, ProductVO> selectBookmarkByUserId(String user_id);
	int insertBookmark(BookmarkVO bookmark);
	int deleteBookmark(int bookmark_id);
}