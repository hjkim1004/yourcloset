package com.yourcloset.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yourcloset.controller.CommandAction;
import com.yourcloset.user.*;
import com.yourcloset.utils.MD5;

public class LoginAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		PrintWriter out = response.getWriter();

		String id = request.getParameter("id");
		String password = MD5.getMD5(request.getParameter("password"));
		
		UserDAO userDAO = new UserDAOImpl();
		UserVO user = null;

		out.println("<html><head><script>");
		if (userDAO.login(id, password) != null) {
			user = userDAO.selectUserByUserId(id);
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			
			out.println("alert('로그인 성공! 사용자 페이지로 이동합니다.')");
			out.println("</script></head></html>");

			if (user.getPosition().equals("customer"))
				return "/mypage/profile.jsp"; 
			else return "/manage/profileManager.jsp";

		} else{
			out.println("alert(' 로그인 실패! 로그인 페이지로 이동합니다. ')");
			out.println("location.href='login.jsp'");	
			out.println("</script></head></html>");
			return "login.jsp";
		}
	}

}
