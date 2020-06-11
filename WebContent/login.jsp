<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Your Closet</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" id="bootstrap-css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="/yourcloset/static/css/login.css">
	<script src="/yourcloset/static/js/login.js"></script>
</head>

<body>
	<!------ Include the above in your HEAD tag ---------->

	<div class="limiter">
		<div class="container-login100" style="background: #ffc107">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="https://colorlib.com/etc/lf/Login_v1/images/img-01.png"
						alt="IMG">
				</div>

				<form class="login100-form validate-form"
					action="/yourcloset/login.do" method="POST">
					<span class="login100-form-title"> Member Login </span>

					<div class="wrap-input100 validate-input"
						data-validate="Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="id" placeholder="Id">
						<span class="focus-input100"></span> <span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Password is required">
						<input class="input100" type="password" name="pass"
							placeholder="Password"> <span class="focus-input100"></span>
						<span class="symbol-input100"> <i class="fa fa-lock"
							aria-hidden="true"></i>
						</span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">Login</button>
					</div>


					<div class="text-center p-t-136 ">
						<a class="txt2" href="index.jsp"> Go Back Home </a>
					</div>
					<div class="text-center p-t-12 ">
						<a class="txt2" href="join.jsp"> Create your Account <i
							class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>
