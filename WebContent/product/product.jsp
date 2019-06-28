<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<head>

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="/yourcloset/static/css/product.css">
<!------ Include the above in your HEAD tag ---------->
</head>
<body>
	  <!-- Navigation -->
	<% 
	String header = null;
	if(session == null | !request.isRequestedSessionIdValid()){
		header = "/nav/header.jsp";
	}else {
		
		header = "/member/header.jsp";
	}
	%>
	<jsp:include page="<%= header %>" />

	<%
	int pid = 0;
	if(request.getAttribute("pid") != null)
		pid = Integer.parseInt((String)request.getAttribute("pid"));
	%>

	<div class="container" style="margin: 20px;">
		<br>
		
		<hr>


		<div class="card">
			<div class="row">
				<aside class="col-sm-5 border-right">
					<article class="gallery-wrap">
						<div class="img-big-wrap">
							<div>
								<a href="#"><img
									src="/static/img/1.jpg" width="420" style="margin-top: 1em; margin-left: 1em;"></a>
							</div>
						</div>
					</article>
					<!-- gallery-wrap .end// -->
				</aside>
				<aside class="col-sm-7">
					<article class="card-body p-5">
						<h3 class="title mb-3">상품명</h3>

						<p class="price-detail-wrap">
							<span class="price h3 text-warning">
								<span class="num">13000원</span>
							</span> 
						</p>
						
						<!-- item-property-hor .// -->

						<hr>
						<div class="row">
							
							<!-- col.// -->
							<div class="col-sm-7">
								<dl class="param param-inline">
									<dt>Size:</dt>
									<dd>
										<label class="form-check form-check-inline"> <input
											class="form-check-input" type="radio"
											name="inlineRadioOptions" id="inlineRadio2" value="option2">
											<span class="form-check-label">free</span>
										</label> <label class="form-check form-check-inline"> <input
											class="form-check-input" type="radio"
											name="inlineRadioOptions" id="inlineRadio2" value="option2">
											<span class="form-check-label">S</span>
										</label> <label class="form-check form-check-inline"> <input
											class="form-check-input" type="radio"
											name="inlineRadioOptions" id="inlineRadio2" value="option2">
											<span class="form-check-label">M</span>
										</label> <label class="form-check form-check-inline"> <input
											class="form-check-input" type="radio"
											name="inlineRadioOptions" id="inlineRadio2" value="option2">
											<span class="form-check-label">L</span>
										</label>
									</dd>
								</dl>
								<!-- item-property .// -->
							</div>
							<!-- col.// -->
						</div>
						<!-- row.// -->
						<hr>
						<a href="payment.jsp" class="btn btn-lg btn-danger text-uppercase"> 바로구매하기 </a> 
						<a href="#" class="btn btn-lg btn-outline-primary text-uppercase"> 
							<i class="fas fa-shopping-cart"></i> 즐겨찾기 추가
						</a>
					</article>
					<!-- card-body.// -->
				</aside>
				<!-- col.// -->
			</div>
			<!-- row.// -->
		</div>
		<!-- card.// -->


	</div>
</div>
	<!--container.//-->

<div style="margin-top: 5em;"></div>
<!-- Footer -->
  <%@ include file="/main/footer.jsp" %>

</body>
</html>