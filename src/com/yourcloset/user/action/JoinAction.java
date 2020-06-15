package com.yourcloset.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yourcloset.controller.CommandAction;
import com.yourcloset.user.*;
import com.yourcloset.utils.*;

public class JoinAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		PrintWriter out = response.getWriter();
		UserDAO userDAO = new UserDAOImpl();
		UserVO user = null;
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String password = MD5.getMD5(request.getParameter("password"));
		String address = request.getParameter("address");

		user = new UserVO(id, password, name, address);
		if(userDAO.signUp(user) > 0){
			out.println("<html><head><script>alert('회원가입이 완료되었습니다! 로그인 페이지로 이동합니다.');</script></head></html>");
			return "login.jsp";
		} 
		else {
			out.println("<html><head><script>alert('회원가입에 실패하였습니다.');</script></head></html>");
			return null;
		}
	}

}
