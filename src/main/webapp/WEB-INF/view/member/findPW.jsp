<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel=stylesheet href="<c:url value='/css/login.css'/>" type="text/css">

<style  type="text/css">
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css);
* { font-family: 'Spoqa Han Sans Neo', 'sans-serif'; } 
</style>

<title>비밀번호 찾기</title>
</head>

<body>
	<div class="main-container">
		<div class = "main-wrap">
			<header>
				<div class="logo-wrap">
					현대인의 간편한 건강 관리, <br>
					<img src = "<c:url value='/main'/>" alt="바쁘다 바빠 현대사회 로고">
				</div>
			</header>
			
			<section class="login-input-section-wrap">
				<div class="login-stay-sign-in">
				<div class="keepLogin"> 가입하신 이메일 주소를 입력해주세요. <br>
				입력한 이메일 주소로<br>
				비밀번호 변경할 수 있는 이메일을 보내드립니다.<br><br></div>
				</div>
				<form name="form" method="POST" action="<c:url value='' />" enctype="multipart/form-data">
					<div class="login-input-wrap password-wrap">
						<input type="text" name="member_email" placeholder="이메일" required="required" >
					</div>
					<br>
					<div class="login-button-wrap">
						<button> 이메일 전송 </button>
					</div>
				</form>
			</section>

		</div>
	</div>
</body>
</html>
<%@ include file="../main/bottom_footers.jsp"%> 