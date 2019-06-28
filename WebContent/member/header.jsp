<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.util.*, yourcloset.util.*, yourclosetDAO.*, yourclosetDTO.*"%>

<!-- 여기서 멤버 세션 관리 -->
<%
	UserDTO user = (UserDTO) session.getAttribute("user");
%>
<%@ include file="/main/header.jsp"%>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-warning fixed-top">
	<div class="container">
		<a class="navbar-brand" href="/yourcloset/member/member_index.jsp">Clothes
			Explorer</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link"
					href="/yourcloset/member/member_index.jsp">Home<span
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/yourcloset/member/logoutAction.jsp">Log-out</a></li>
				<li class="nav-item">
					<!-- 관리자면 profileManager.jsp 실행되도록 수정 --> 
					<% if (user.getPosition().equals("staff")){%> 
						<a class="nav-link" href="/yourcloset/member/profileManager.jsp">My Page</a>
					<% } else {%>
						<a class="nav-link" href="/yourcloset/member/profile.jsp">My Page</a>
					<%} %>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="/yourcloset/member/bookmarkList.jsp">Book Mark</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/yourcloset/member/about.jsp">About</a></li>
			</ul>
		</div>
	</div>
	</nav>