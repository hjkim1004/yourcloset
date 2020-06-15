<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.yourcloset.utils.*"%>

<%@page import="com.yourcloset.user.*, com.yourcloset.product.*, com.yourcloset.order.*, com.yourcloset.bookmark.*"%>
<%@include file="jstl.jsp"%>

<%
	UserVO user = (UserVO) session.getAttribute("user");
%>
<c:set var="user" value="${user}" />

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Your Closet</title>

<!-- Bootstrap core CSS -->
<link href="/yourcloset/static/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/yourcloset/static/css/shop-homepage.css" rel="stylesheet">


</head>
<body>
	<c:set var="path" value="${pageContext.servletContext.contextPath}" />

	<nav class="navbar navbar-expand-lg navbar-dark bg-warning fixed-top">
		<div class="container">
			<a class="navbar-brand" href="${path}/index.jsp">Clothes Explorer</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="${path}/index.jsp">Home <span class="sr-only">(current)</span></a>
					</li>
					<c:choose>
						<c:when test="${user == null}">
							<li class="nav-item"><a class="nav-link"
								href="${path}/login.jsp">Login</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${path}/join.jsp">Join</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link"
								href="${path}/logout.do">Logout</a>
							</li>
							<c:if test="${user.position eq 'staff'}">
								<li><a class="nav-link" href="${path}/manage/profileManager.jsp">Manage</a></li>
							</c:if>
							<c:if test="${user.position eq 'customer'}">
								<li><a class="nav-link" href="${path}/mypage/profile.jsp">My Page</a></li>
								<li class="nav-item"><a class="nav-link" href="${path}/bookmarkList.jsp">Book Mark</a></li>
							</c:if>
						</c:otherwise>
					</c:choose>
					<li class="nav-item"><a class="nav-link"
						href="${path}/about.jsp">About</a></li>
				</ul>
			</div>
		</div>
	</nav>