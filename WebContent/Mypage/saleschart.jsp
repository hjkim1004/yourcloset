<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/yourcloset/static/css/productList.css">

</head>
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
									<th><span>Stock</span></th>
									<th><span>SalesChart</span></th>
								</tr>
							</thead>
							<tbody>
								<%
									SaleDAO sale = new SaleDAO();
									HashMap<Integer, Integer> status = sale.selectSalesStatus();
									ProductDAO productDAO = new ProductDAO();

									for (int i : status.keySet()) {
										ProductDTO p = productDAO.selectProductByPid(i);
										out.print("<tr>");
										out.print("<td>");
										out.print("<img src=/yourcloset/static/img/" + i + ".jpg>");
										out.print("<a href=\"#\" class=\"user-link\">" + p.getPname() + "</a>"); //상품이름
										out.print("<span class=\"user-subhead\">" + p.getPrice() + "</span>"); //가격
										out.print("</td>");
										out.print("</td>");
										out.print("<td class=\"text-center\">" + i + "</td>");
										out.print("<td>" + p.getStock() + "</td>");
										out.print("<td>" + status.get(i) + "</td>");
										out.print("</tr>");
									}
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
</body>s
</html>