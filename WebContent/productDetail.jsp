<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/common/header.jsp" %>
<%
	ProductVO product = (ProductVO) request.getAttribute("product");
	pageContext.setAttribute("product", product);
%>
<head>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="/yourcloset/static/css/product.css">
</head>
<body>
	<div class="container" style="margin: 20px;">
		<br>
		<hr>
		<div class="card">
			<div class="row">
				<aside class="col-sm-5 border-right">
					<article class="gallery-wrap">
						<div class="img-big-wrap">
							<div>
								<a href="#">
								<img src="/static/img/${product.product_id}.jpg" width="420" style="margin-top: 1em; margin-left: 1em;"></a>
							</div>
						</div>
					</article>
				</aside>
				<aside class="col-sm-7">
					<article class="card-body p-5">
						<h3 class="title mb-3">${product.product_name}</h3>

						<p class="price-detail-wrap">
							<span class="price h3 text-warning"> <span class="num">${product.price }</span>
							</span>
						</p>

						<!-- item-property-hor .// -->

						<hr>
						<div class="row">
							<div class="col-sm-7">
								<dl class="param param-inline">
									<dt>Size:</dt>
									<dd>
										<label class="form-check form-check-inline"> 
											<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
											<span class="form-check-label">free</span>
										</label> 
										<label class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
											<span class="form-check-label">S</span>
										</label> 
										<label class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
											<span class="form-check-label">M</span>
										</label> 
										<label class="form-check form-check-inline"> 
											<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
											<span class="form-check-label">L</span>
										</label>
									</dd>
								</dl>
							</div>
						</div>
						<hr>
						<a href="payment.jsp" class="btn btn-lg btn-danger text-uppercase"> 바로구매하기 </a> 
						<a href="addBookmark.do?id=${bookmark.bookmark_id}" class="btn btn-lg btn-outline-primary text-uppercase"> 
							<i class="fas fa-shopping-cart"></i> 즐겨찾기 추가
						</a>
					</article>
				</aside>
			</div>
		</div>

	</div>

	<div style="margin-top: 5em;"></div>
	<!-- Footer -->
	<%@ include file="/common/footer.jsp"%>

</body>
</html>