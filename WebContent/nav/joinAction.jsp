<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.sql.*, yourclosetDAO.*, yourclosetDTO.*,com.yourcloset.utils.MD5"%>

<%
	response.setContentType("text/html; charset=euc-kr");
	
	// 회원가입 DB에 저장되는 부분
	// 회원가입 후 로그인 페이지로 넘어가게 하기 위해서 여기에 구현함
	UserDAO userDAO = new UserDAO();
	UserDTO user = null;
	
	request.setCharacterEncoding("euc-kr"); //Set encoding
	String userID = request.getParameter("userID");
	String username = request.getParameter("username");
	String password = MD5.getMd5(request.getParameter("password"));
	String address = request.getParameter("address");

	user = new UserDTO(userID, password, username, address, "customer");
	if(userDAO.SignUp(user)!=0){
		//response.getWriter().println("<script>alert(' 회원 가입이 완료되었습니다.\n 로그인 페이지로 이동합니다!'); location.href='login.jsp';</script>");
		response.sendRedirect("login.jsp");
	}else{
		response.getWriter().println("<script>alert('회원 가입에 실패하였습니다.\n 회원가입 페이지로 돌아갑니다.');</script>");
		//response.sendRedirect("join.jsp");
	}
%>

