<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/common/header.jsp"%>
<%
	BookmarkDAO bookmarkDAO = new BookmarkDAOImpl();
	Map<BookmarkVO, ProductVO> bookmarkMap = bookmarkDAO.selectBookmarkByUserId(user.getUser_id());
	
	request.setAttribute("bookmarkMap", bookmarkMap);
%>

<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="sec-title">
				<br />
				<h2>BOOKMARK LIST</h2>
				<br />

			</div>
			<div class="main-box clearfix">
				<div class="table-responsive">
					<table class="table user-list">
						<thead>
							<tr>
								<th><span>Product Name</span></th>
								<th><span>#</span></th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="entry" items="${bookmarkMap}">
								<tr>
									<td>
										<a href="productDetail.jsp?pid=${entry.key.product_id}" class="user-link">
										${entry.value.product_name}</a>
									</td>
									<td>
										<form action="delBookmark.do" method="POST">
											<input type="hidden" name="bid" value="${entry.key.bookmark_id}"> 
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