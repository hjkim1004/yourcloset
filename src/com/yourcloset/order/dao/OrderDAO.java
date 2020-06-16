package com.yourcloset.order.dao;

import java.util.HashMap;
import java.util.List;

import com.yourcloset.order.vo.OrderVO;
import com.yourcloset.product.vo.ProductVO;

public interface OrderDAO {

	String selectDeliveryStatusByOrderId(int order_id);
	List<OrderVO> selectOrdersByDeliveryState();
	List<OrderVO> selectOrdersByUserId(String user_id);
	ProductVO selectProductByOrderId(int order_id);

	int insertOrder(OrderVO order);
	int deleteOrder(int order_id);
	int updateDeliveryStatus(int order_id, String value);
	HashMap<ProductVO, Integer> selectOrderStatus(); // 상품 당 주문 건수

}