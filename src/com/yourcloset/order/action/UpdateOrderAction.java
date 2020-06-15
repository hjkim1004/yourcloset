package com.yourcloset.order.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yourcloset.controller.CommandAction;
import com.yourcloset.order.*;

public class UpdateOrderAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		OrderDAO dao = new OrderDAOImpl();
		int id = (int) request.getAttribute("oid");
		String value = (String) request.getAttribute("status");
		
		if (dao.updateDeliveryStatus(id, value) > 0) {
			response.getWriter().println("<html><head><script>alert('업데이트가 완료되었습니다.');</script></head></html>");
		}
		return "/manage/delivery.jsp";
	}

}
