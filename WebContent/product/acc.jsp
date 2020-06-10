<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.util.*, java.sql.*, yourclosetDTO.*, yourclosetDAO.*, com.yourcloset.utils.*"%>

<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap core CSS -->
<link href="/yourcloset/static/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="/yourcloset/static/css/shop-homepage.css" rel="stylesheet">
</head>


    <!-- Navigation -->
	<% 
	String header = null;
	if(session == null | !request.isRequestedSessionIdValid()){
		header = "/nav/header.jsp";
	}else{
		header = "/member/header.jsp";
	}
	%>
	<jsp:include page="<%= header %>" />

  <!-- Page Content -->
  <div class="container">
    <div class="row">


	<%@ include file="/common/menu.jsp" %>

      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>

        <div class="row">

<%
		ProductDAO product = new ProductDAO();
		List<ProductDTO> productlist = product.selectProductsByCategory("acc");
		
		  for (ProductDTO p : productlist) { 
%>
			  <div class="col-lg-4 col-md-6 mb-4">
			  <div class="card h-100">
<% 
			  int pid=p.getPid();
			  out.print("<a href='/static/img/"+pid+".jpg'><img class='card-img-top' src=\"/yourcloset/static/img/"+p.getPid()+".jpg\" alt=\"\"></a>");
			  out.print(" <div class=\"card-body\"><h4 class=\"card-title\">");
			  out.print("<a href='product.jsp?pid="+pid+"'>"+p.getPname()+"</a></h4>");
			  out.print("<h5>"+p.getPrice()+"</h5>");
%>

              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>re
            </div>
          </div> <br>
<% } %>			          


        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  </div>
  <!-- /.container -->

  <!-- Footer -->
  <%@ include file="/common/footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="/yourcloset/static/vendor/jquery/jquery.min.js"></script>
  <script src="/yourcloset/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
