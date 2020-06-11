<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<link rel="stylesheet" href="/yourcloset/static/css/customerList.css">

<div class="container" style="margin: 50px;">
	<div class="row">
		<div class="col-12">
			<div class="card">

				<div class="card-body">
					<div class="card-title mb-4">
						<div class="d-flex justify-content-start">
							<div class="image-container">
								<img src="/yourcloset/static/img/profileimg_2.png" id="imgProfile" style="width: 150px; height: 150px"
									class="img-thumbnail" />
							</div>
							<!-- 회원 ID -->
							<div class="userData ml-3">
								<h2 class="d-block" style="font-size: 1.5rem; font-weight: bold">
									<a href="javascript:void(0);" style="text-decoration: none;">My page</a>
								</h2>
								<h6 class="d-block"> 회원</h6>

							</div>
							<div class="ml-auto">
								<input type="button" class="btn btn-primary d-none" id="btnDiscard" value="Discard Changes" />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-12">
							<ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
								<li class="nav-item">
									<a class="nav-link active" id="profile" data-toggle="tab" href="${path}/mypage/profile.jsp" role="tab"
									aria-controls="Profile" aria-selected="true">My Page</a>
								</li>
								<li class="nav-item">
									<a class="nav-link active" id="orderlist" data-toggle="tab" href="${path}/mypage/orderList.jsp" role="tab"
									aria-controls="OrderList" aria-selected="true">Order List</a></li>
							</ul>
							