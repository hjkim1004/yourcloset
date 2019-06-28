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
									<th><span>Order Number</span></th>
									<th><span>Customer ID</span></th>
									<th><span>Delivery State</span></th>

								</tr>
							</thead>
							<tbody>
								<tr>
									<%
										SaleDAO Sale = new SaleDAO();
										List<SaleDTO> salelist = Sale.selectSalesByDeliveryState();

										for (SaleDTO s : salelist) {
									%>
									<%
										out.print("<td class=\"text-center\">" + s.getoId() + "</td>");
											out.print("<td class=\"text-center\">" + s.getUserId() + "</td>");
									%>
									<td><form role="form" action="shippingUpdate.jsp" method="POST">
											<input type="hidden" name="oid" value="<%=s.getoId()%>" >
											<select>
												<%
													String status = s.getDelivery();
														if (status.equals("배송 완료")) {

															out.print("<option value='ready'>배송 준비중</option>");
															out.print("<option value='complete' selected>배송 완료</option>");

														} else {
															out.print("<option value='ready' selected>배송 준비중</option>");
															out.print("<option value='complete'>배송 완료</option>");
														}
												%>
											</select>
											<input type="submit" class="btn btn-sm btn-danger" value="변경">
										</form></td>
								</tr>
								<%
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
	<div style="margin-top: 10em;"></div>
</body>
</html>