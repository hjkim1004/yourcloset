<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="manager_header.jsp"%>
<%
	UserDAO userDAO = new UserDAOImpl();
List<UserVO> user_list = userDAO.selectAllUser();
request.setAttribute("user_list", user_list);
%>
<div class="main-box clearfix">
	<div class="table-responsive">
		<table class="table user-list">
			<thead>
				<tr>
					<th><span>ID</span></th>
					<th><span>User Name</span></th>
					<th><span>Point</span></th>
					<th><span>Address</span></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="users" items="${user_list}">
					<tr>
						<td>${users.user_id}</td>
						<td>${users.user_name}</td>
						<td>${users.point}</td>
						<td>${users.user_address }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
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

<%@ include file="/common/footer.jsp"%>