package com.yourcloset.bookmark.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yourcloset.bookmark.dao.BookmarkDAO;
import com.yourcloset.bookmark.dao.BookmarkDAOImpl;
import com.yourcloset.controller.CommandAction;

public class DeleteBookmarkAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int id = Integer.parseInt(request.getParameter("bid"));
		BookmarkDAO bookmarkDAO = new BookmarkDAOImpl();
		if(bookmarkDAO.deleteBookmark(id)>0) {
			response.getWriter().println("<html><head><script>alert('삭제가 완료되었습니다!');</script></head></html>");
		}
		return "bookmarkList.jsp";
	}

}
