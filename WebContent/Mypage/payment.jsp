<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Your Closet</title>
<!-- Bootstrap core CSS -->
<link href="/yourcloset/static/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="/yourcloset/static/css/shop-homepage.css" rel="stylesheet">

</head>
<body>

	<!-- Navigation -->
	<%@ include file="/common/header.jsp"%>

	<div class="container">

		<div class="row">
			<div class="col-md-6">
				<h1>Payment</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-12">
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">Product Name</th>
								<th scope="col">Size</th>
								<th scope="col" class="text-center">Quantity</th>
								<th scope="col" class="text-right">Color</th>
								<th scope="col" class="text-right">Price</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><img src="https://dummyimage.com/50x50/55595c/fff" />
								</td>
								<td>Product Name Dada</td>
								<td>In stock</td>
								<td><input class="form-control" type="text" value="1"
									readonly /></td>
								<td class="text-right">Black</td>
								<td class="text-right">12490</td>
							</tr>

							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>Sub-Total</td>
								<td class="text-right">12490</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>Shipping</td>
								<td class="text-right">2500</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><strong>Total</strong></td>
								<td class="text-right"><strong>14990</strong></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="row">

				<form role="form">
					<div class="form-group">
						<label for="customername" class="productFormElement">Customer
							Name : </label> <input class="form-control" id="customername"
							type="email">
					</div>

					<div class="form-group">
						<label for="totalvolume" class="productFormElement">Total
							volume : </label> <input class="form-control" id="totalvolumee"
							type="email">
					</div>

					<div class="form-group">
						<label for="Address" class="productFormElement">Address :
						</label> <input class="form-control" id="Address" type="email">
					</div>

					<div class="form-group">
						<label for="payment" class="productFormElement">Payment :
						</label> <select class="form-control" id="productSelect"><option>Please
								Select a Product Group</option>
							<option>Top</option>
							<option>Bottom</option>
							<option>One-piece</option>
							<option>Acc</option>
						</select>
					</div>

					<div style="margin-left: 1em;">
						<button type="submit" id="loginSubmit"
							class="btn btn-danger loginFormElement">Submit</button>
					</div>
			</form>
			</div>


		</div>

		<div style="margin-top: 3em;"></div>
	</div>
</body>
</html>