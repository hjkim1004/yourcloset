package com.yourcloset.bookmark;

import java.util.List;

public interface BookmarkDAO {
	List<BookmarkVO> selectBookmarkByUserId(String user_id);
	int insertBookmark(BookmarkVO bookmark);
	int deleteBookmark(int bookmark_id);
}