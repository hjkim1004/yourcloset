<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*, yourclosetDAO.*, yourclosetDTO.*"%>
    
<%
	ProductDAO productDAO = new ProductDAO();
	ProductDTO product = null;
	
	 request.setCharacterEncoding("euc-kr");  //Set encoding
	 int pid  =    Integer.parseInt(request.getParameter("pid"));        
	 String pname =   request.getParameter("pname");
	 int price =   Integer.parseInt(request.getParameter("price"));
	 String size  =   request.getParameter("size");
	 String category  =   request.getParameter("category");
	 int stock  =   Integer.parseInt(request.getParameter("stock"));
	 int point  =   Integer.parseInt(request.getParameter("point"));
	
	 product = new ProductDTO(pid, pname, price, size, category, stock, point);
	 productDAO.insertProduct(product);
	 pageContext.forward("productList.jsp");
%>

