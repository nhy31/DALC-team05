<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dongduk.dalc05.aah.domain.Member" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<!-- top CSS -->
<link rel=stylesheet href="<c:url value='/css/top.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/swiper.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/content.css'/>" type="text/css">

<style type="text/css">
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css);
* { font-family: 'Spoqa Han Sans Neo', 'sans-serif'; } 
</style>
</head>

<body>

<nav class="navbar navbar-expand-sm navbar-white bg-white" aria-label="Third navbar example">
	<div class="container-fluid">
	<a class="navbar-brand" href="<c:url value='/main'/>">로고 이미지</a>
	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	
	<div class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
		<form action="<c:url value='/main/search'/>" method="post">
			<input class="form-control input-lg" name="keyword" value="${keyword}" width="100%" placeholder="검색어를 입력하세요"/>
		</form>
	</div>
	
	<% 
		HttpSession ss = request.getSession();
		
		Member m = (Member) session.getAttribute("loginMember");
		if(m == null)
			ss.setAttribute("ses", 0);
		else{
			ss.setAttribute("ses", 1);
			ss.setAttribute("member_id", m.getMember_id());
			ss.setAttribute("member_nickName", m.getMember_nickName());
		}

	%>
	
	<!-- 비로그인 경우 -->
	<c:if test="${ses == 0}">
		<div class="col-md-3 text-end" id="navbarsExample03">
			<ul class="navbar-nav me-auto mb-2 mb-sm-0">
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="<c:url value="/member/login" />">로그인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="<c:url value="/member/join" />">회원가입</a>
				</li>
			</ul>
		</div>
	</c:if>
	
	<!-- 로그인한 경우 --> 
	<c:if test="${ses == 1}">
		<div class="col-md-3 text-end" id="navbarsExample03">
			<ul class="navbar-nav me-auto mb-2 mb-sm-0 justify-content-center">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-bs-toggle="dropdown" aria-expanded="false">${member_nickName}님</a>
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
	</c:if>
    </div>
  </nav>
  
  <hr>
  <nav class="navbar navbar-expand-sm navbar-white bg-white" aria-label="Third navbar example">
  	<div class="container-fluid">
  		<div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample03" style="margin:0 auto;">
			<ul class="navbar-nav">
				<li class="nav-item" style="margin-right:150px;">
					<a class="nav-link active" aria-current="page" href="<c:url value='/recipe'/>">레시피 추천</a>
				</li>
				<li class="nav-item" style="margin-right:150px;">
					<a class="nav-link active" aria-current="page" href="<c:url value='/exercise/sick'/>">홈트레이닝 추천</a>
				</li>
				<li class="nav-item" style="margin-right:150px;">
					<a class="nav-link active" aria-current="page" href="<c:url value='/media'/>">건강 미디어</a>
				</li>
				<li class="nav-item" style="margin-right:150px;">
					<a class="nav-link active" aria-current="page" href="<c:url value='/community'/>">현대사회 커뮤니티</a>
				</li>
			</ul>
		</div>
  	</div>
  </nav>
  <hr>
  
  
</body>
</html>

