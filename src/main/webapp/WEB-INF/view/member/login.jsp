<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../main/top_temp.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
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
				<div  class="logo-wrap">
					<h3>현대인의 간편한 건강 관리</h3> 
					<img style="height:120px; width:320px;"class="small-logo" src = "<c:url value='/images/aah-logo.png'/>">
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
					<br>
					<div class="login-stay-sign-in" style="position:absolute;">
						<input type="checkbox" id="checkbox" class="keepLogin" name="saveId" <%=cookieVal!=""?"checked" : ""%> >
						<label class="keepLogin"> &nbsp;&nbsp;&nbsp;아이디 저장 &nbsp;&nbsp;&nbsp;&nbsp; </label>
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
<%@ include file="../main/bottom_footers.jsp"%> 