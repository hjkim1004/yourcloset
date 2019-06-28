<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	session.invalidate(); // 세션해제
	response.sendRedirect("/yourcloset/nav/index.jsp"); // index 페이지로 이동
%>