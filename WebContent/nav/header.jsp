<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="yourcloset.util.*, yourclosetDAO.*, yourclosetDTO.*"%>
<%@ include file="/main/header.jsp"%>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-warning fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/yourcloset/nav/index.jsp">Clothes
				Explorer</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="/yourcloset/nav/index.jsp">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/yourcloset/nav/login.jsp">Log-in</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/yourcloset/nav/join.jsp">Join</a></li>
					<li class="nav-item"></li>
					<li class="nav-item"><a class="nav-link"
						href="/yourcloset/nav/about.jsp">About</a></li>
				</ul>
			</div>
		</div>
	</nav>
