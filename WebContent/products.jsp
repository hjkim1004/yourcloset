<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@include file="/common/header.jsp"%>
<%
	String category = request.getParameter("category");
	ProductDAO productDAO = new ProductDAOImpl();
	List<ProductVO> product_list = productDAO.selectProductsByCategory(category);
	request.setAttribute("product_list", product_list);
%>

<div class="container" style="padding-top: 40px">
	<div class="row">

		<%@ include file="/common/category.jsp"%>

		<div class="col-lg-9">

			<div id="carouselExampleIndicators" class="carousel slide my-4"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid" src="/yourcloset/static/img/mainImage_1.JPG" width="900" height="350" alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="/yourcloset/static/img/mainImage_2.JPG" width="900" height="350" alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="/yourcloset/static/img/mainImage_3.JPG" width="900" height="350" alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev"> 
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
					<span class="sr-only">Previous</span>
				</a> 
				<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next"> 
					<span class="carousel-control-next-icon" aria-hidden="true"></span> 
					<span class="sr-only">Next</span>
				</a>
			</div>

			<div class="row">

				<c:forEach items="${product_list}" var="product">
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="${path}/productDetail.jsp?id=${product.product_id}">
								<img class="card-img-top" src="/yourcloset/static/img/${product.product_id}.jpg" alt="\"></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="${path}/productDetail.jsp?id=${product.product_id}">${product.product_name}</a>
								</h4>
								<h5>${product.price}</h5>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
							</div>
						</div>
					</div>

				</c:forEach>

			</div>
		</div>
	</div>
</div>
<!-- /.container -->

<!-- Footer -->
<%@ include file="/common/footer.jsp"%>

<!-- Bootstrap core JavaScript -->
<script src="/yourcloset/static/vendor/jquery/jquery.min.js"></script>
<script src="/yourcloset/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
