<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 외부 스타일 링크 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<!-- 내부 스타일 링크 -->
<link rel=stylesheet href="<c:url value='/css/all.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/main.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/swiper.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/content.css'/>" type="text/css">

<title>커뮤니티 메인페이지</title>

<style>

@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');

.main_title1 {
font-family: 'Nanum Gothic', sans-serif;
font-style: normal;
font-weight: bold;
font-size: 22px;
line-height: 26px;
color: #000000;
}

.main_title2 {
margin: 45px 0 0 0;
font-family: 'Nanum Gothic', sans-serif;
font-style: normal;
font-weight: bold;
font-size: 22px;
line-height: 26px;
color: #000000;
}

.add {
margin: 6px 0 0 3px;
font-family: 'Nanum Gothic', sans-serif;
font-style: normal;
font-weight: 500;
font-size: 13px;
line-height: 15px;
color: #8E8E8E;
}

.bestPosts {
align: left;
margin: 16px;
width: 100%;
height: 200px;
background: #FFFFFF;
border: 2px solid #E7E7E7;
box-sizing: border-box;
border-radius: 6px;
}

.two-box {
}

ol {
list-style-type: decimal;
padding: 35px 30px 35px 30px;
}

li {
margin: 12px;
font-family: 'Nanum Gothic', sans-serif;
font-style: normal;
font-weight: normal;
font-size: 15px;
line-height: 18px;
color: #000000;
}

.sick_box {
width: 70px;
height: 31px;
background: #851BD8;
border-radius: 79px; 
float: left; "
}

.sick_box_font {
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 15px;
line-height: 20px;
text-align: center;
color: #FFFFFF;
}

.img {
width: 223px;
height: 152px;
border-radius: 6px;}



</style>
</head>

<body>

<div class="content-start">

	<div align="left">
		<div class="main_title1">이번 주 인기글</div>
		<div class="add">매주 업데이트 되는 인기글을 확인하세요.</div>
		
		<div align="center" class="bestPosts" >
			<div class="two-box"> 
				<ol>
					<c:forEach var="post" items="${BestPosts}">
					<li style="cursor:pointer" onclick="location.href='<c:url value='/community/post/detail' />'">${post.post_title} (${post.post_hits})</li>
					</c:forEach>	
				</ol> 
			</div>
		</div>
	</div>
	
	<div align="left">
		<div class="main_title2">최신 포스트</div>
		<input type ="button" value="전체 커뮤니티 보기" onclick="location.href='<c:url value='/community/post/upload' />'"></input> 
	</div>
	
	<div align="right">
	나의 커뮤니티 
		<select name="commu_code">
			<option value="-1" selected>전체</option>
				<c:forEach var="c" items="${MyCommuList}">
					<option value="${c.commu_code}">${c.commu_name}</option>
				</c:forEach>
		</select>
   		<input type ="button" value="글쓰기" onclick="location.href='<c:url value='/community/post/upload' />'"></input> 
	</div>
	  
   	<table>
   		<c:forEach var="posts" items="${posts}">
			<tr>
   				<td>${posts.post_title}</td>
   				<td>${posts.post_uploadDate}</td>
   				<td>${posts.member_nickName}</td>
   				<td>${posts.post_content}</td>
   				<td>${posts.post_hits}</td>
   				<td>댓글수</td>
   			</tr>
		</c:forEach>	
   	</table>
</div>
</div>
</body>
</html>