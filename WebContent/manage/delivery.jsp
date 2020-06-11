<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="manager_header.jsp"%>
<%
	OrderDAO orderDAO = new OrderDAOImpl();
	List<OrderVO> order_list = orderDAO.selectOrdersByDeliveryState();
	request.setAttribute("order_list", order_list);
%>
							<div class="main-box clearfix">
								<div class="table-responsive">
									<table class="table user-list">
										<thead>
											<!-- order_id, product_id, order_time, address, payment, user_id, delivery, price -->
											<tr>
												<th><span>Order Number</span></th>
												<th><span>Customer ID</span></th>
												<th><span>Delivery State</span></th>
												<th>#</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="order" items="${order_list}">
											<tr>
												<td>${order.order_id}</td>
												<td>${order.user_id}</td>
												<td>${order.delivery}</td>
												<td>
													<form action="updateOrder.do" method="post">
														<input type="hidden" name="oid" value="${order.order_id}">
														<select class="form-control" id="status">
															<option value="product_ready">상품 준비중</option>
															<option value="delivery_ready">배송 준비중</option>
															<option value="start">배송 시작</option>
															<option value="complete">배송 완료</option>
														</select>
														<input type="submit" class="btn btn-sm btn-danger" value="변경">
													</form>
												</td>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div style="margin-left: 42em;">
					<button type="submit" id="loginSubmit"
						class="btn btn-danger loginFormElement"
						onclick="window.history.back()">Go Back</button>
					<div style="margin-top: 11em;"></div>
				</div>
				<div style="margin-top: 10em;"></div>
			</div>
		</div>
	</div>
</div>
</body>
</html>