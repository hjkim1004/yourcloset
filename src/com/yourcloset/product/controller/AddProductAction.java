package com.yourcloset.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yourcloset.controller.CommandAction;
import com.yourcloset.product.*;
import com.yourcloset.product.dao.ProductDAO;
import com.yourcloset.product.dao.ProductDAOImpl;
import com.yourcloset.product.vo.ProductVO;

public class AddProductAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		ProductDAO productDAO = new ProductDAOImpl();
		ProductVO product = null;

		int pid = Integer.parseInt(request.getParameter("product_id"));
		String pname = request.getParameter("product_name");
		int price = Integer.parseInt(request.getParameter("price"));
		String size = request.getParameter("size");
		String category = request.getParameter("category");
		int stock = Integer.parseInt(request.getParameter("stock"));
		int point = Integer.parseInt(request.getParameter("point"));
		String description = request.getParameter("description");

		product = new ProductVO(pid, pname, price, size, category, stock, point, description);
		productDAO.insertProduct(product);
		return "manage/productList.jsp";
	}

}
