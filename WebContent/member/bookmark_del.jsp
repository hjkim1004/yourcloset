<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.sql.*, yourclosetDAO.*, yourclosetDTO.*, java.util.*"%>

<%
	BookMarkDAO bookmark = new BookMarkDAO();
	String id = (String) request.getAttribute("bid");
	if (id != null) {
		int bid = Integer.parseInt(id);
		bookmark.deleteBookmark(bid);

	}else{
		out.println("<script>alert(' 북마크 삭제 오류! '); location.href='bookmarkList.jsp';</script>");
	}
%>
