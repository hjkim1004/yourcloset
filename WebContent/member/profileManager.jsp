<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
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
								<div class="userData ml-3">
									<h2 class="d-block"
										style="font-size: 1.5rem; font-weight: bold">
										<a href="javascript:void(0);" style="text-decoration: none;">My
											page</a>
									</h2>
									<h6 class="d-block">
										관리자 :
										<%=user.getId()%></h6>

								</div>

							</div>
						</div>

						<div class="row">
							<div class="col-12">
								<ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
									<li class="nav-item"><a class="nav-link active"
										id="profile" data-toggle="tab" href="/yourcloset/Mypage/profileManager.jsp" role="tab"
										aria-controls="Profile" aria-selected="true">My Page</a>
									</li>
									<ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
										<li class="nav-item"><a class="nav-link active"
											id="customerlist" data-toggle="tab"
											href="/yourcloset/Mypage/customList.jsp" role="tab"
											aria-controls="CustomerList" aria-selected="true">Customer
												List</a></li>

										<li class="nav-item"><a class="nav-link active"
											id="saleslist" data-toggle="tab"
											href="/yourcloset/Mypage/saleschart.jsp" role="tab"
											aria-controls="SalesList" aria-selected="true">Sales List</a>
										</li>
										<li class="nav-item"><a class="nav-link active"
											id="shipping" data-toggle="tab"
											href="/yourcloset/Mypage/shipping.jsp" role="tab"
											aria-controls="Shipping" aria-selected="true">Delivery
												List</a></li>
										<li class="nav-item"><a class="nav-link active"
											id="productList" data-toggle="tab"
											href="/yourcloset/Mypage/productList.jsp" role="tab"
											aria-controls="ProductList" aria-selected="true">Product
												List</a></li>


									</ul>
								</ul>
								<div class="tab-content ml-1" id="myTabContent">
									<div class="tab-pane fade show active" id="profile"
										role="tabpanel" aria-labelledby="profile-tab">

										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;">ID</label>
											</div>
											<div class="col-md-8 col-6">
												<%= user.getId() %>
												<!--id 입력-->
											</div>
										</div>
										<hr />

										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;">NAME</label>
											</div>
											<div class="col-md-8 col-6">
												<%= user.getName() %>
												<!--이름 입력-->
											</div>
										</div>
										<hr />
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;">ADDRESS</label>
											</div>
											<div class="col-md-8 col-6">
												<%= user.getAddress() %>
												<!--주소입력-->
											</div>
										</div>
										<hr />
										<div class="row">
											<div class="col-sm-3 col-md-2 col-5">
												<label style="font-weight: bold;">POINT</label>
											</div>
											<div class="col-md-8 col-6">
											<%= user.getPoint() %><!--포인트 입력-->
											</div>
										</div>


									</div>
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
