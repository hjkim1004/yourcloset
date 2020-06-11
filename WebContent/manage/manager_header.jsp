<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>

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
								<h2 class="d-block" style="font-size: 1.5rem; font-weight: bold">
									<a href="javascript:void(0);" style="text-decoration: none;">My
										page</a>
								</h2>
								<h6 class="d-block">${user.user_id}</h6>

							</div>

						</div>
					</div>

					<div class="row">
						<div class="col-12">
							<ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="profile" data-toggle="tab" href="${path}/mypage/profileManager.jsp" role="tab"
									aria-controls="Profile" aria-selected="true">My Page</a></li>
								<ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
									<li class="nav-item"><a class="nav-link active"
										id="customerlist" data-toggle="tab"
										href="${path}/mypage/customList.jsp" role="tab"
										aria-controls=CustomerList " aria-selected="true">Customer
											List</a></li>

									<li class="nav-item"><a class="nav-link active"
										id="saleslist" data-toggle="tab"
										href="${path}/mypage/saleschart.jsp" role="tab"
										aria-controls="SalesList" aria-selected="true">Sales List</a>
									</li>
									<li class="nav-item"><a class="nav-link active"
										id="shipping" data-toggle="tab"
										href="${path}/mypage/shipping.jsp" role="tab"
										aria-controls="Shipping" aria-selected="true">Delivery
											List</a></li>
									<li class="nav-item"><a class="nav-link active"
										id="productList" data-toggle="tab"
										href="${path}/mypage/productList.jsp" role="tab"
										aria-controls="ProductList" aria-selected="true">Product
											List</a></li>
								</ul>
							</ul>