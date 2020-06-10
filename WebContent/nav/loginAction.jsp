<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.sql.*, yourclosetDAO.*, yourclosetDTO.*,com.yourcloset.utils.MD5"%>
<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String password = MD5.getMd5(pass);
	
	UserDAO userDAO = new UserDAO();
	UserDTO user = null;

	if (userDAO.login(id, password) != null) {
		user = userDAO.selectUserByUserId(id);
		session.isNew();
		session.setAttribute("user", user);
		out.println("<script>alert(' 로그인 성공! 사용자 페이지로 이동합니다. ')</script>");
		if (user.getPosition().equals("customer"))
			pageContext.forward("/member/profile.jsp");
		else
			pageContext.forward("/member/profileManager.jsp");

	} else{
		out.println("<script>alert(' 로그인 실패! 로그인 페이지로 이동합니다. ')</script>");
		out.println("<script>location.href='login.jsp'</script>");	
	}
%>

