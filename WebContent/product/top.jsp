<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, java.sql.*, yourclosetDTO.*, yourclosetDAO.*, yourcloset.util.*"%>
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

      <div class="col-lg-3">

        <%@ include file="/main/menuList.jsp" %>

      </div>
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
		List<ProductDTO> productlist = product.selectProductByCategory("top");
		
		  for (ProductDTO p : productlist) { 
%>
			  <div class="col-lg-4 col-md-6 mb-4">
			  <div class="card h-100">
<% 
			  out.print("<a href=\"#\"><img class=\"card-img-top\" src=\"/yourcloset/static/img/"+p.getPid()+".jpg\" alt=\"\"></a>");
			  out.print(" <div class=\"card-body\"><h4 class=\"card-title\">");
			  out.print("<a href=\"#\">"+p.getPname()+"</a></h4>");
			  out.print("<h5>"+p.getPrice()+"</h5>");
%>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
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
  <%@ include file="/main/footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="/yourcloset/static/vendor/jquery/jquery.min.js"></script>
  <script src="/yourcloset/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
