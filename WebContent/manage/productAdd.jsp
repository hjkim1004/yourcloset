<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="manager_header.jsp"%>

		<div class="row">
			<div class="col-md-6">
				<h1>Add Product</h1>
			</div>
		</div>

		<div class="row">

			<div class="col-md-6">
				<form action="addProduct.do" role="form" method="POST">
					<div class="form-group">
						<label for="productname" class="productFormElement">Product Category : </label> 
						<select class="form-control" id="category">
							<option>Please Select a Product Group</option>
							<option id="top">Top</option>
							<option id="bottom">Bottom</option>
							<option id="one-piece">One-piece</option>
							<option id="acc">Acc</option>
						</select>
					</div>

					<div class="form-group">
						<label for="productname" class="productFormElement">Product Name : </label> 
						<input class="form-control" id="product_name" type="text">
					</div>

					<div class="form-group">
						<label for="productprice" class="productFormElement">Product Price : </label> 
						<input class="form-control" id="price" type="text">
					</div>

					<div class="form-group">
						<label for="productsize" class="productFormElement">Product Size : </label> 
						<input class="form-control" id="size" type="text">
					</div>

					<div class="form-group">
						<label for="productstock" class="productFormElement">Product Stock : </label> 
						<input class="form-control" id="stock" type="text">
					</div>

					<div class="form-group">
						<label class="loginformelement" for="productdescription">Product Description : </label> 
						<input id="description" class="form-control input-lg" placeholder="Large" type="text">
					</div>

					<div class="form-group">
						<label class="control-label">Product Image : </label> 
						<input class="filestyle" data-icon="false" type="file">
					</div>
					<button type="submit" id="loginSubmit" class="btn btn-danger loginFormElement">Add Product</button>
				</form>

			</div>
		</div>
	</div>
</body>
</html>