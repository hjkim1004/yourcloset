package com.yourcloset.user.action;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
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

		String id = request.getParameter("user_id");
		String pass = request.getParameter("password");
		String password = MD5.getMD5(pass);
		
		UserDAO userDAO = new UserDAOImpl();
		UserVO user = null;

		out.println("<script>");
		if (userDAO.login(id, password) != null) {
			user = userDAO.selectUserByUserId(id);
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			
			out.println("alert('로그인 성공! 사용자 페이지로 이동합니다.')");
			out.println("<script>");

			if (user.getPosition().equals("customer"))
				return "profile.jsp"; 
			else return "profileManager.jsp";

		} else{
			out.println("alert(' 로그인 실패! 로그인 페이지로 이동합니다. ')");
			out.println("location.href='login.jsp'");	
			out.println("<script>");
			return "login.jsp";
		}
	}

}
