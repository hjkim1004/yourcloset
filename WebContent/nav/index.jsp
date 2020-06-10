<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="com.yourcloset.utils.*, yourclosetDAO.*, yourclosetDTO.*"%>
<%@ include file="header.jsp"%>

<div class="container">

	<div class="row">

		<%@ include file="/common/menu.jsp"%>

		<!-- /.col-lg-3 -->

		<div class="col-lg-9">

			<div id="carouselExampleIndicators" class="carousel slide my-4"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid"
							src="/yourcloset/static/img/mainImage_1.JPG" width="900"
							height="350" alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid"
							src="/yourcloset/static/img/mainImage_2.JPG" width="900"
							height="350" alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid"
							src="/yourcloset/static/img/mainImage_3.JPG" width="900"
							height="350" alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>

			<div class="row">

				<%
					ProductDAO product = new ProductDAO();
				List<ProductDTO> productlist = product.selectProductsAll();

				for (ProductDTO p : productlist) {
				%>
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href='#'><img class="card-img-top"
							src="/yourcloset/static/img/<%=p.getPid()%>.jpg" alt="\"></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href='#'>" + p.getPname() + "</a>
							</h4>
							<h5><%=p.getPrice()%></h5>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div>
				<br>
				<%
					}
				%>

			</div>
			<!-- /.row -->

		</div>
		<!-- /.col-lg-9 -->

	</div>
	<!-- /.row -->
</div>

<!-- Bootstrap core JavaScript -->
<script src="/yourcloset/static/vendor/jquery/jquery.min.js"></script>
<script
	src="/yourcloset/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>