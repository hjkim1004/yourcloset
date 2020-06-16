package com.yourcloset.bookmark.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yourcloset.bookmark.dao.BookmarkDAO;
import com.yourcloset.bookmark.dao.BookmarkDAOImpl;
import com.yourcloset.bookmark.vo.BookmarkVO;
import com.yourcloset.controller.CommandAction;
import com.yourcloset.user.vo.UserVO;

public class AddBookmarkAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pid = Integer.parseInt(request.getParameter("pid"));
		UserVO user = (UserVO) request.getSession().getAttribute("user");
		if(user == null) {
			response.getWriter().println("<html><head><script>alert('로그인 후 북마크 추가가 가능합니다!');</script></head></html>");
			return "login.jsp";
		}
		
		BookmarkDAO bookmarkDAO = new BookmarkDAOImpl();
		BookmarkVO bookmark = new BookmarkVO(pid, user.getUser_id());
		if(bookmarkDAO.insertBookmark(bookmark)>0) {
			response.getWriter().println("<html><head><script>alert('북마크 추가가 완료되었습니다!');</script></head></html>");
		}else {
			response.getWriter().println("<html><head><script>alert('이미 있는 북마크입니다!');</script></head></html>");
		}
		return "bookmarkList.jsp";
	}

}
