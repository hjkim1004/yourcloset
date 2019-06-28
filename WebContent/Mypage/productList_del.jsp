<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.util.*, yourcloset.util.*, yourclosetDAO.*, yourclosetDTO.*"%>
<%
	ProductDAO dao = new ProductDAO();
	String id = (String) request.getAttribute("pid");
	int pid = 0;
	if (id != null) {
		pid = Integer.parseInt(id);
		if (dao.deleteProduct(pid) > 0) {
			out.println("<script>alert(' 상품이 삭제되었습니다! '); location.href='productList.jsp';</script>");
		}
	} else {
		out.println("<script>alert(' 상품 삭제 오류! '); location.href='productList.jsp';</script>");
	}
%>