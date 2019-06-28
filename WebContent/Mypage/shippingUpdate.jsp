<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.util.*, yourcloset.util.*, yourclosetDAO.*, yourclosetDTO.*"%>
<%
	SaleDAO dao = new SaleDAO();
	String ready = (String) request.getAttribute("ready");
	String complete = (String) request.getAttribute("complete");

	String value = null;
	if (ready == null)
		value = complete;
	else
		value = ready;

	String id = (String) request.getAttribute("oid");
	int oid = 0;
	if (id != null) {
		oid = Integer.parseInt(id);
		if (dao.updateDeliveryStatus(oid, value) > 0) {
			out.println("<script>alert(' 배송 정보가 업데이트 되었습니다! '); location.href='shipping.jsp';</script>");
		}
	} else {
		out.println("<script>alert(' 배송 정보 업데이트 오류! '); location.href='shipping.jsp';</script>");
	}
%>