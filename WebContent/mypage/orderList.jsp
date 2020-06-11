<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="customer_header.jsp"%>
<%
	OrderDAO orderDAO = new OrderDAOImpl();
	List<OrderVO> order_list = orderDAO.selectOrdersByUserId(user.getUser_id());
	request.setAttribute("order_list", order_list);
%>

							<div style="margin-top: 2em;"></div>
							<div class="container mb-6">
								<div class="row">
									<div class="col-12">
										<div class="table-responsive">
											<table class="table table-striped">
												<thead>
													<tr>
														<th scope="col">Order Number</th>
														<th scope="col" class="text-center">Product Number</th>
														<th scope="col" class="text-right">Price</th>
														<th scope="col" class="text-right">Payment</th>

														<th></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="order" items="${order_list}">
													<tr>
														<td>${order.order_id }</td>
														<td>${order.product_id }</td>
														<td class="text-right">${order.price }</td>
														<td class="text-right">${order.payment }</td>
														<td class="text-center">
															<form action="deleteOrder.do" method="POST">
																<input type="hidden" name="order_id" value="${order.order_id}">
																<input type="submit" class="btn btn-sm btn-danger" value="삭제">
															</form>
														</td>
													</tr>
													</c:forEach>
													
												</tbody>
											</table>
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>