package com.yourcloset.product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yourcloset.controller.CommandAction;
import com.yourcloset.product.*;

public class ProductDetailAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = (String) request.getAttribute("id");
		if(id == null) return null;
		else {
			int product_id = Integer.parseInt(id.toString());
			ProductDAO productDAO = new ProductDAOImpl();
			ProductVO product = productDAO.selectProductByProductId(product_id);
			request.setAttribute("product", product);
			return "productDetail.jsp";
		}
	}

}
