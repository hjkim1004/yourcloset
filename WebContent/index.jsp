<%@page import="com.yourcloset.product.ProductDAO"%>
<%@ page language="java" pageEncoding="UTF-8"
	import="com.yourcloset.utils.*, com.yourcloset.product.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Closet</title>
</head>
<body>
	<%
		ProductDAO productDAO = new ProductDAOImpl();
		List<ProductVO> product_list = productDAO.selectProductsAll();
		request.setAttribute("product_list", product_list);
		for(ProductVO product: product_list){
			System.out.println(product);
		}
	%>

	<%@ include file="/common/header.jsp"%>
	<div class="container">

		<div class="row">

			<%@ include file="/common/menu.jsp"%>

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

					<c:forEach var="product" items="product_list">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href='#'><img class="card-img-top"
									src="/yourcloset/static/img/${product.id }.jpg" alt="\"></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href='#'>${product.name}</a>
									</h4>
									<h5>${product.price }</h5>
								</div>
								<div class="card-footer">
									<small class="text-muted">&#9733; &#9733; &#9733;
										&#9733; &#9734;</small>
								</div>
							</div>
						</div>

					</c:forEach>

				</div>
			</div>
		</div>
	</div>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>