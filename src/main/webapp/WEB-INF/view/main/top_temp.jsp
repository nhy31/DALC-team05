<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dongduk.dalc05.aah.domain.Member" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">

<!-- 내부 스타일 링크 -->
<link rel=stylesheet href="<c:url value='/css/main.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/swiper.css'/>" type="text/css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<!-- top CSS -->
<link rel=stylesheet href="<c:url value='/css/top.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/swiper.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/content.css'/>" type="text/css">

<style type="text/css">
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css);
* { font-family: 'Spoqa Han Sans Neo', 'sans-serif'; } 
.logo {
width:60%;
}
</style>
</head>

<body>
<% 
		HttpSession ss = request.getSession();
		
		Member m = (Member) session.getAttribute("loginMember");
		
		if(m == null)
			ss.setAttribute("ses", 0);
		else{
			ss.setAttribute("ses", 1);
			ss.setAttribute("CODE", m.getMember_code());
			ss.setAttribute("member_id", m.getMember_id());
			ss.setAttribute("member_nickName", m.getMember_nickName());
		}

	%>
<br>
<div class="row">
<div class="col-md-1"></div>

<div class="col-md-10">

	<!-- border는 확인용.. -->
	<div style="border: 0px solid gold; float: left; width: 30%;">
	<a href="<c:url value='/main'/>"><img class="logo" src="<c:url value='/images/aah-logo.png'/>"></a>
	</div>
	
	<div style="border: 0px solid gold; float: left; width: 40%;">
		<form action="<c:url value='/main/search'/>" method="post">
			<br>
			<input style="text-align:center;"class="form-control input-lg" name="keyword" value="${keyword}" width="100%" placeholder="검색어를 입력하세요"/>
		</form>
	</div>
	
	
	<!-- 비로그인 경우 -->
	<div style="border: 0px solid gold; float: left; width: 30%;">
	<br>
		<c:if test="${ses == 0}">
			<div align="right" >
				<table style="margin-right:30px;">
					<tr>
						<td><a href="<c:url value="/member/login" />"><font style="font-size:1.1vw;">로그인</font></a></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><a href="<c:url value="/member/join" />"><font style="font-size:1.1vw;">회원가입</font></a></td>
					</tr>
				</table>
			</div>
		</c:if>
		
		<!-- 로그인한 경우 --> 
		<c:if test="${ses == 1}">
			<div align="left" style="padding-left:180px;">
				<div class="col-md-3 text-end" id="navbarsExample03">
				<ul class="navbar-nav me-auto mb-2 mb-sm-0 justify-content-center">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-bs-toggle="dropdown" 
					aria-expanded="false"><font style="font-size:1.2vw">${member_nickName}님</font></a>
					<ul class="dropdown-menu" aria-labelledby="dropdown03">
					<li><a class="dropdown-item" href="<c:url value='/member/my'/>">마이페이지</a></li>
	              	<li><a class="dropdown-item" href="<c:url value="/member/diary" />">질병 캘린더</a></li>
	              	<li><a class="dropdown-item" href="<c:url value="/member/mybox" />">보관함</a></li>
	              	<li><a class="dropdown-item" href="<c:url value='/member/logout.do'/>">로그아웃</a></li>
	              	<li><a class="dropdown-item" href="<c:url value="/member/delete.do" />">탈퇴</a></li>
	            	</ul>
				</li>
				</ul>
				</div>
			</div>

		</c:if>
    </div>
    
   
</div>

<div class="col-md-1"></div>
</div>

 <hr>
  <nav class="navbar navbar-expand-sm navbar-white bg-white" aria-label="Third navbar example">
  	<div class="container-fluid">
  		<div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample03" style="margin:0 auto;">
			<ul class="navbar-nav">
				<li class="nav-item" style="margin-left:100px;">
					<a class="nav-link active" aria-current="page" href="<c:url value='/recipe'/>">레시피 추천</a>
				</li>
				<li class="nav-item" style="margin-left:100px;">
					<a class="nav-link active" aria-current="page" href="<c:url value='/exercise/sick'/>">홈트레이닝 추천</a>
				</li>
				<li class="nav-item" style="margin-left:100px;">
					<a class="nav-link active" aria-current="page" href="<c:url value='/media'/>">건강 미디어</a>
				</li>
				<li class="nav-item" style="margin-left:100px; margin-right:100px;" >
					<a class="nav-link active" aria-current="page" href="<c:url value='/community'/>">현대사회 커뮤니티</a>
				</li>
			</ul>
		</div>
  	</div>
  </nav>
  <hr>
</body>
</html>
