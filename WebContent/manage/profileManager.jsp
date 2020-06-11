<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.yourcloset.utils.*"%>

<%@ include file="manager_header.jsp"%>

							<div class="tab-content ml-1" id="myTabContent">
								<div class="tab-pane fade show active" id="profile"
									role="tabpanel" aria-labelledby="profile-tab">

									<div class="row">
										<div class="col-sm-3 col-md-2 col-5">
											<label style="font-weight: bold;">ID</label>
										</div>
										<div class="col-md-8 col-6">
											${user.user_id}
											<!--id 입력-->
										</div>
									</div>
									<hr />
									
									<div class="row">
										<div class="col-sm-3 col-md-2 col-5">
											<label style="font-weight: bold;">PASSWORD</label>
										</div>
										<div class="col-md-8 col-6">
											${user.password}
											<!--id 입력-->
										</div>
									</div>
									<hr />

									<div class="row">
										<div class="col-sm-3 col-md-2 col-5">
											<label style="font-weight: bold;">NAME</label>
										</div>
										<div class="col-md-8 col-6">
											${user.user_name}
											<!--이름 입력-->
										</div>
									</div>
									<hr />
									
									<div class="row">
										<div class="col-sm-3 col-md-2 col-5">
											<label style="font-weight: bold;">ADDRESS</label>
										</div>
										<div class="col-md-8 col-6">
											${user.user_address }
										</div>
									</div>
									<hr />
									<div class="row">
										<div class="col-sm-3 col-md-2 col-5">
											<label style="font-weight: bold;">POINT</label>
										</div>
										<div class="col-md-8 col-6">
											${user.point }
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
<%@ include file="/common/footer.jsp"%>
