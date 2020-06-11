<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/yourcloset/static/css/productList.css">
<%
	ProductDAO product = new ProductDAOImpl();
	List<ProductVO> product_list = product.selectProductsAll();
	request.setAttribute("product_list", product_list);
%>
<%@ include file="manager_header.jsp"%>

							<div class="main-box clearfix">
								<div class="table-responsive">
									<table class="table user-list">
										<thead>
											<tr>
												<th><span>Product Name</span></th>
												<th><span>Price</span></th>
												<th class="text-center"><span>size</span></th>
												<th><span>Category</span></th>
												<th><span>Stock</span></th>
												<th><span>Point</span></th>
												<td class="text-center"><button
														class="btn btn-sm btn-danger"
														onclick="location.href='productAdd.jsp'">상품 추가</button></td>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="product" items="${product_list}">
											<tr>
												<td>
													<a href="${path}/productDetail.do?id=${product.product_id}" class="user-link">
													<img src="/yourcloset/static/img/${product.product_id}.jpg" alt="${product.product_name}" width="300" height="450"/>
													</a>
												</td>
												<td>
													<span class="user-subhead">${product.price }</span>
												</td>
												<td>${product.product_id }</td>
												<td>${product.size }</td>
												<td>${product.category }</td>
												<td>${product.stock }</td>
												<td>
												<form action="${path}/delProduct.do" method="POST">
													<input type="hidden" name="product_id" value="${product.product_id }">
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
<%@include file="/common/footer.jsp"%>