<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/yourcloset/static/css/customList.css">
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
									<th><span>User Name</span></th>
									<th><span>ID</span></th>
									<th class="text-center"><span>Point</span></th>
									<th><span>Address</span></th>
								</tr>
							</thead>
							<%
								UserDAO User = new UserDAO();
								List<UserDTO> userlist = User.selectAllUser();

								for (UserDTO u : userlist) {
									out.print("<tbody><tr>");
									out.print("<td>" + u.getName() + "</td>"); //이름
									out.print("<td>" + u.getId() + "</td>"); //id
									out.print("<td>" + u.getPoint() + "</td>"); //포인트
									out.print("<td>" + u.getAddress() + "</td>"); //주소
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
</body>
</html>