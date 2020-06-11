<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/common/header.jsp"%>
<%
	BookmarkDAO bookmarkDAO = new BookmarkDAOImpl();
	List<BookmarkVO> bookmark_list = bookmarkDAO.selectBookmarkByUserId(user.getUser_id());
	
	ProductDAO productDAO = new ProductDAOImpl();
	request.setAttribute("bookmark_list", bookmark_list);
%>

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
								<th><span>Bookmark Number</span></th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="bookmark" items="${bookmark_list}">
								<tr>
									<td><img src="/yourcloset/static/img/${bookmark.product_id}.jpg" />
										<a href="#" class="user-link">${bookmark.user_id}</a></td>
									<td>{bookmark.product_id}</td>
									<td class='text-center'>
										<form action="bookmark_del.jsp" method="GET">
											<input type="hidden" name="bookmark_id" value="${bookmark.product_id}"> 
											<input type="submit" class="btn btn-sm btn-danger" value="삭제">
										</form>
									</td>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<div style="margin-left: 42em;">
	<button id="loginSubmit" class="btn btn-danger loginFormElement"
		onclick="window.history.back()">Go Back</button>
	<div style="margin-top: 11em;"></div>
</div>
<div style="margin-top: 8em;"></div>
<%@include file="/common/footer.jsp"%>