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
									id="profile" data-toggle="tab" href="#profile" role="tab"
									aria-controls="Profile" aria-selected="true">My Page</a></li>
								<li class="nav-item"><a class="nav-link active"
									id="orderlist" data-toggle="tab"
									href="/yourcloset/member/orderList.jsp" role="tab"
									aria-controls="OrderList" aria-selected="true">Order List</a></li>
							</ul>
							<div class="tab-content ml-1" id="myTabContent">
								<div class="tab-pane fade show active" id="profile"
									role="tabpanel" aria-labelledby="profile-tab">

									<div class="row">
										<div class="col-sm-3 col-md-2 col-5">
											<label style="font-weight: bold;">ID</label>
										</div>
										<div class="col-md-8 col-6">
											<%=user.getId()%>
											<!--id 입력-->
										</div>
									</div>
									<hr />

									<div class="row">
										<div class="col-sm-3 col-md-2 col-5">
											<label style="font-weight: bold;">NAME</label>
										</div>
										<div class="col-md-8 col-6">
											<%=user.getName()%>
											<!--이름 입력-->
										</div>
									</div>
									<hr />
									<div class="row">
										<div class="col-sm-3 col-md-2 col-5">
											<label style="font-weight: bold;">ADDRESS</label>
										</div>
										<div class="col-md-8 col-6">
											<%=user.getAddress()%><!-- 주소 입력 -->
										</div>
									</div>
									<hr />
									<div class="row">
										<div class="col-sm-3 col-md-2 col-5">
											<label style="font-weight: bold;">POINT</label>
										</div>
										<div class="col-md-8 col-6">
											<%=user.getPoint()%>
											<!--포인트 입력-->
										</div>
									</div>


								</div>
								<div class="tab-pane fade" id="other-services" role="tabpanel"
									aria-labelledby="oher-services">Facebook, Google, Twitter
									Account that are connected to this account</div>
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
