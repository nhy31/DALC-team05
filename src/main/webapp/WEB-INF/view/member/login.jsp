<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel=stylesheet href="<c:url value='/css/login.css'/>" type="text/css">
<script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>

<style type="text/css">
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css);
* { font-family: 'Spoqa Han Sans Neo', 'sans-serif'; } 
</style>
<title>로그인</title>
</head>

<!-- 소셜로그인 연동 JS 코드필요  -->
<body>	
<%
    Cookie[] c = request.getCookies();
    String cookieVal="";
    if(c!=null){
        for(Cookie i:c){
            if(i.getName().equals("saveId")){
                cookieVal=i.getValue();
            }
        }
    }
    
%>
	<div class="main-container">
		<div class = "main-wrap">
			<header>
				<div class="logo-wrap">
					현대인의 간편한 건강 관리, <br>
					<img src = "<c:url value='/main'/>" alt="아프다 아파 현대사회 로고">
				</div>
			</header>
			<section class="login-input-section-wrap">
				<form name="form" method="POST" action="<c:url value='/member/login.do' />" enctype="multipart/form-data">
					<div class="login-input-wrap">
						<input type="text" name="member_id" placeholder="이메일" required="required" value="<%=cookieVal !="" ? cookieVal : "" %>">
					</div>
					<div class="login-input-wrap password-wrap">
						<input type="password" name="member_pw" placeholder="비밀번호" required="required" >
					</div>
					<div class="login-button-wrap">
						<button> 로그인 </button>
					</div>
					<div class="login-stay-sign-in" style="position:absolute;">
						<input type="checkbox" id="checkbox" class="keepLogin" name="saveId" <%=cookieVal!=""?"checked" : ""%> >
						<label class="keepLogin"> &nbsp;아이디 저장 </label>
						<span style="margin-left:350px; margin-right:0px;"><a href="<c:url value='/member/findPW'/>">비밀번호 찾기</a></span>
					</div>
				</form>
			</section>
			<br>
			<section class="Easy-sgin-in-wrap">
				<div id="naver_id_login" class="login-button-wrap">
					<a href="${NaverUrl}">
					<img width="230"src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
					</a>
				</div>
				<p class="forget-msg">
					회원이 아니신가요?   <a href="<c:url value='/member/join'/>"> 회원가입 </a>
				</p>
			</section>
		</div>
	</div>

</body>
</html>