package com.yourcloset.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yourcloset.controller.CommandAction;
import com.yourcloset.user.*;
import com.yourcloset.utils.*;

public class JoinAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		UserDAO userDAO = new UserDAOImpl();
		UserVO user = null;
		
		String userID = request.getParameter("user_id");
		String username = request.getParameter("user_name");
		String password = MD5.getMD5(request.getParameter("password"));
		String address = request.getParameter("address");

		user = new UserVO(userID, password, username, address);
		if(userDAO.signUp(user) > 0){
			return "login.jsp";
		} 
		else return null;
	}

}
