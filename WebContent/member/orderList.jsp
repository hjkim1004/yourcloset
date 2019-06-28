<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.sql.*, yourclosetDAO.*, yourclosetDTO.*, yourcloset.util.MD5"%>

<%@ include file="header.jsp"%>

<div class="container" style="margin: 50px;">
	<div class="row">
		<div class="col-12">
			<div class="card">

				<div class="card-body">
					<div class="card-title mb-4">
						<div class="d-flex justify-content-start">
							<div class="image-container">
								<img src="/yourcloset/static/img/profileimg_2.png"
									id="imgProfile" style="width: 150px; height: 150px"
									class="img-thumbnail" />
							</div>
							<!-- 회원 ID -->
							<div class="userData ml-3">
								<h2 class="d-block" style="font-size: 1.5rem; font-weight: bold">
									<a href="javascript:void(0);" style="text-decoration: none;">My
										page</a>
								</h2>
								<h6 class="d-block">
									회원 :
									<%=user.getId()%></h6>

							</div>
							<div class="ml-auto">
								<input type="button" class="btn btn-primary d-none"
									id="btnDiscard" value="Discard Changes" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="profile" data-toggle="tab" href="profile.jsp" role="tab"
									aria-controls="Profile" aria-selected="true">My Page</a></li>
								<li class="nav-item"><a class="nav-link active"
									id="orderlist" data-toggle="tab"
									href="/yourcloset/member/orderList.jsp" role="tab"
									aria-controls="OrderList" aria-selected="true">Order List</a></li>
							</ul>
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
													<%
														SaleDAO sale = new SaleDAO();
														List<SaleDTO> Salelist = sale.selectSalesByUserId(user.getId());

														for (SaleDTO s : Salelist) {
													%>
													<tr>
														<td><%=s.getoId()%></td>
														<td><%=s.getPid()%></td>
														<td class="text-right"><%=s.getPrice()%></td>
														<td class="text-right"><%=s.getPayment()%></td>
														<td class="text-center">
															<form action="orderList_del.jsp" method="POST">
																<input type="hidden" name="oid" value="<%=s.getoId()%>">
																<input type="submit" class="btn btn-sm btn-danger" value="삭제">
															</form>
														</td>
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