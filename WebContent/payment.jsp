<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/common/header.jsp"%>

<div class="container" style="padding-top: 40px">

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
							<th scope="col" class="text-right">Price</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><img src="https://dummyimage.com/50x50/55595c/fff" /></td>
							<td>Product Name Dada</td>
							<td>In stock</td>
							<td class="form-control">1</td>
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
						Name : </label> <input class="form-control" id="customername" type="text">
				</div>



				<div class="form-group">
					<label for="point" class="productFormElement">Point : </label> <input
						class="form-control" id="Address" type="text">
				</div>

				<div class="form-group">
					<label for="payment" class="productFormElement">Payment : </label>
					<input class="form-control" id="Address" type="text">
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
<%@ include file="/common/footer.jsp"%>
</body>
</html>