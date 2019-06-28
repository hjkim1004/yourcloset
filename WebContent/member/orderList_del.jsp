<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.util.*, yourcloset.util.*, yourclosetDAO.*, yourclosetDTO.*"%>
<%
	SaleDAO dao = new SaleDAO();
	String id = (String)request.getAttribute("oid");
	int oid=0;
	if(id != null){
		oid = Integer.parseInt(id);
		System.out.println(oid);
		if(dao.deleteSale(oid)>0){
			out.println("<script>alert(' 구매가 취소되었습니다! '); location.href='orderList.jsp';</script>");
		}		
	}else{
		out.println("<script>alert(' 구매 취소 오류! '); location.href='orderList.jsp';</script>");
	}
%>