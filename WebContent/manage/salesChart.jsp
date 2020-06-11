<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="manager_header.jsp" %>
<%
	OrderDAO orderDAO = new OrderDAOImpl();
	HashMap<ProductVO, Integer> status = orderDAO.selectOrderStatus();
	request.setAttribute("status", status);	
%>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="/yourcloset/static/css/productList.css">

								<div class="main-box clearfix">
									<div class="table-responsive">
										<table class="table user-list">
											<thead>
												<tr>
													<th><span>Product Key</span></th>
													<th><span>Product Name</span></th>
													<th><span>Stock</span></th>
													<th><span>SalesChart</span></th>
												</tr>
											</thead>
											<tbody>
											<c:forEach var="i" items="${status}">
											
												<tr>
													<!-- 상품 키 -->
													<td>${i.key.product_id}</td>
													<!-- 상품 이름 -->
													<td>${i.key.product_name}</td>
													<!-- 재고 -->
													<td>${i.key.stock}</td>
													<!-- 팔린 개수 -->
													<td>${i.value}</td>
												</tr>
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
					<div style="margin-top: 8em;"></div>
				</div>
			</div>
		</div>
	</div>
</body>
s
</html>