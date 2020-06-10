<%@ page language="java" contentType="text/html; charset=EUC-KR"
	import="java.util.*, java.sql.*, yourclosetDTO.*, yourclosetDAO.*, com.yourcloset.utils.*"%>

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
									<th><span>BookMark Number</span></th>

								</tr>
							</thead>
							<tbody>
								<%
									BookMarkDAO bookmarkDAO = new BookMarkDAO();
									List<BookMarkDTO> bookmarklist = bookmarkDAO.selectBookMarkByUserId(user.getId());

									for (BookMarkDTO b : bookmarklist) {
										out.print("<tr>");
										out.print("<td>");
										out.print("<img src=/yourcloset/static/img/" + b.getPid() + ".jpg>");
										out.print("<a href=\"#\" class=\"user-link\">" + b.getPname() + "</a>"); //상품이름
										out.print("</td>");

										out.print("<td>");
										out.print(b.getPid());
										out.print("</td>");

										out.print("<td>");
										out.print(b.getBid());
										out.print("</td>");
										out.print("<td class='text-center'>");
%>
										<form action="bookmark_del.jsp" method="POST">
											<input type="hidden" name="bid" value="<%=b.getBid()%>">
											<input type="submit" class="btn btn-sm btn-danger" value="삭제">
										</form>
									</td>
									<% }
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
			onclick="window.history.back()">Go Back</button>
		<div style="margin-top: 11em;"></div>
	</div>
	<div style="margin-top: 8em;"></div>
</html>