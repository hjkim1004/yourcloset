<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
	<!-- Navigation -->
	<%@ include file="header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="main-box clearfix">
					<div class="table-responsive">
						<table class="table user-list">
							<thead>
								<tr>
									<th><span>Product Name</span></th>
									<th><span>Product Number</span></th>
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

								<%
									ProductDAO product = new ProductDAO();
									List<ProductDTO> productlist = product.selectProductAll();

									for (ProductDTO p : productlist) {
										out.print("<tr>");
										out.print("<td>");
										out.print("<img src=/yourcloset/static/img/" + p.getPid() + ".jpg width='200' height='250'>");
										out.print("<a href=\"#\" class=\"user-link\">" + p.getPname() + "</a>"); //상품이름
										out.print("<span class=\"user-subhead\">" + p.getPrice() + "</span>"); //가격
										out.print("</td>");

										out.print("<td>");
										out.print(p.getPid());
										out.print("</td>");

										out.print("<td>");
										out.print(p.getSize());
										out.print("</td>");

										out.print("<td>");
										out.print(p.getCategory());
										out.print("</td>");

										out.print("<td>");
										out.print(p.getStock());
										out.print("</td>");

										out.print("<td>");
										out.print(p.getPoint());
										out.print("</td>");

										out.print("<td>");
										%>
										<form action="productList_del.jsp" method="POST">
											<input type="hidden" name="bid" value="<%=p.getPid()%>">
											<input type="submit" class="btn btn-sm btn-danger" value="삭제">
										</form>
									</td>
									<%}
									out.println("</tr>");
								%>
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
			onclick="window.history.back()">Go
			Back</button>
		<div style="margin-top: 11em;"></div>
	</div>
	<div style="margin-top: 8em;"></div>
</body>
</html>