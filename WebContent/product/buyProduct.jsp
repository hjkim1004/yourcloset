<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.sql.*, yourclosetDAO.*, yourclosetDTO.*,com.yourcloset.utils.MD5"%>

<%
	// 회원가입 DB에 저장되는 부분
	// 회원가입 후 로그인 페이지로 넘어가게 하기 위해서 여기에 구현함
	SaleDAO SaleDAO = new SaleDAO();
	SaleDTO Sale = null;

	request.setCharacterEncoding("euc-kr"); //Set encoding
	int pid = Integer.parseInt(request.getParameter("pid"));
	int price = Integer.parseInt(request.getParameter("price"));
	String password = request.getParameter("password");
	String address = request.getParameter("address");

	//pid, String userId, String address, String payment, int price
	Sale = new SaleDTO();
	SaleDAO.insertSale(Sale);
%>
<%@ include file="/nav/index.jsp" %>