package com.yourcloset.product.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yourcloset.controller.CommandAction;
import com.yourcloset.product.ProductDAO;
import com.yourcloset.product.ProductDAOImpl;

public class DeleteProductAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		PrintWriter out = response.getWriter();
		ProductDAO productDAO = new ProductDAOImpl();
		
		if (request.getAttribute("product_id") != null) {
			int id = Integer.parseInt((String) request.getAttribute("product_id"));
			if (productDAO.deleteProduct(id) > 0) {
				out.println("<script>alert('상품이 삭제되었습니다!');</script>");
			}
		}
		return "manage/productList.jsp";
	}

}
