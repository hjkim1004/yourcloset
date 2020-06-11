<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="/yourcloset/static/css/join.css">
<script src="/yourcloset/static/js/join.js"></script>
<title>Your Closet</title>

<!-- 입력 Null Check -->
<script type="text/javascript">
	function checkValue() {
		if (!document.userinfo.userID.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		
		if (!document.userinfo.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (!document.userinfo.username.value) {
			alert("이름을 입력하세요.");
			return false;
		}

		if (!document.userinfo.address.value) {
			alert("주소를 입력하세요.");
			return false;
		}

	}
</script>

</head>
<body>

	<!------ Include the above in your HEAD tag ---------->

	<form action="joinAction.jsp" method="POST" name="userinfo"
		onsubmit="return checkValue()">
		<label>
			<p class="label-txt">ENTER YOUR ID </p> <input type="text" class="input" name="userID">
			<div class="line-box"> 
				<div class="line"></div>
			</div>
		</label> 
		<label>
			<p class="label-txt">ENTER YOUR NAME</p> <input type="text" class="input" name="username">
			<div class="line-box">
				<div class="line"></div>
			</div>
		</label> 
		<label>
			<p class="label-txt">ENTER YOUR PASSWORD</p> <input type="password" class="input" name="password">
			<div class="line-box">
				<div class="line"></div>
			</div>
		</label> <label>
			<p class="label-txt">ADDRESS</p> <input type="text" class="input" name="address">
			<div class="line-box">
				<div class="line"></div>
			</div>
		</label>
		<button type="submit">submit</button>
	</form>
	<div class="text-center p-t-136 ">
		<a class="txt2" href="index.jsp"> Go Back Home </a>
	</div>
</body>
</html>
