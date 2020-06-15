<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="/yourcloset/static/css/join.css">
<script src="/yourcloset/static/js/join.js"></script>
<title>Your Closet</title>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
</head>
<body>

	<!------ Include the above in your HEAD tag ---------->

	<form action="join.do" method="POST" name="userinfo"
		onsubmit="return checkValue()">
		<label>
			<p class="label-txt">ENTER YOUR ID</p> 
			<input type="text" class="input" name="id">
			<div class="line-box">
				<div class="line"></div>
			</div>
		</label> 
		<label>
			<p class="label-txt">ENTER YOUR NAME</p> 
			<input type="text" class="input" name="name">
			<div class="line-box">
				<div class="line"></div>
			</div>
		</label> 
		<label>
			<p class="label-txt">ENTER YOUR PASSWORD</p> 
			<input type="password" class="input" name="password">
			<div class="line-box">
				<div class="line"></div>
			</div>
		</label> 
		<label>
			<p class="label-txt">ADDRESS &nbsp;&nbsp;&nbsp;<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="btn-secondary"></p> 
			<input type="text" class="input" name="address" id="address">
			<div class="line-box">
				<div class="line"></div>
			</div>
		</label>
		<label>
			<p class="label-txt">DETAIL ADDRESS</p> 
			<input type="text" class="input" name="detailAddress" id="detailAddress">
			<div class="line-box">
				<div class="line"></div>
			</div>
		</label>
		<button type="button" onclick="history.go(-1)">Go Back</button>
		<button type="submit">submit</button>
	</form>
</body>
</html>
