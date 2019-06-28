<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<body>
	<!-- Navigation -->
	<%@ include file="header.jsp"%>

	<div class="container">

		<div class="row">
			<div class="col-md-6">
				<h1>Add Product</h1>
			</div>
		</div>

		<div class="row">

			<div class="col-md-6">
				<form action="productList.jsp" role="form">

					<select class="form-control" id="productSelect">
						<option>PleaseSelect a Product Group</option>
						<option>Top</option>
						<option>Bottom</option>
						<option>One-piece</option>
						<option>Acc</option>
					</select>

					<div class="form-group">
						<label for="productname" class="productFormElement">Product
							Name : </label> <input class="form-control" id="productname" type="text">
					</div>

					<div class="form-group">
						<label for="productprice" class="productFormElement">Product
							Price : </label> <input class="form-control" id="productprice"
							type="text">
					</div>

					<div class="form-group">
						<label for="productsize" class="productFormElement">Product
							Size : </label> <input class="form-control" id="productsize" type="text">
					</div>

					<div class="form-group">
						<label for="productcolor" class="productFormElement">Product
							Color : </label> <input class="form-control" id="productcolor"
							type="text">
					</div>

					<div class="form-group">
						<label for="productstock" class="productFormElement">Product
							Stock : </label> <input class="form-control" id="productstock"
							type="text">
					</div>

					<div class="form-group">
						<label class="loginformelement" for="productdescription">Product
							Description</label> <input id="productdescription"
							class="form-control input-lg" placeholder="Large" type="text">
						<div class="container"></div>

						<div class="form-group">

							<label class="control-label">Product Image</label> <input
								class="filestyle" data-icon="false" type="file">

						</div>


						<button type="submit" id="loginSubmit"
							class="btn btn-danger loginFormElement">Add Product</button>

					</div>
				</form>

			</div>
		</div>
	</div>
</body>
</html>