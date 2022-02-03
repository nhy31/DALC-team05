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
<link rel=stylesheet href="<c:url value='/css/main.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/swiper.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/content.css'/>" type="text/css">

<title>커뮤니티 메인페이지</title>
<style>

.content {
 margin: 40px 200px 250px 200px;
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

<!-- 기본 상단바 (나중에 되면 링크 걸어서 따로 불러오든 코드 간소화 필요할듯) -->
   <nav class="dalcbar">
      <div class="dalc_name">
         <h2><a href="<c:url value='/main'/>">로고 이미지</a></h2>
      </div>
      
      <div align = "center">
         <form name="mainSearch" action="/main/search" method="GET">
            <input type="text" name="searchView" placeholder="검색어를 입력하세요." width="500" height="40">
            <input type="image" src="<c:url value='/images/search.png'/>" alt="검색버튼" width="15" height="15">
         </form>
      </div>
      
      <ul class="dalc_menu">
         <c:if test="${ses == 0}"> 
        	<li><a href="<c:url value="/main/login" />">로그인</a></li>
         	<li><a href="<c:url value="/main/join"/> ">회원가입</a></li>
      	</c:if>
      	
      	<c:if test="${ses == 1}"> 
          <li>${member_nickName}님 </li>
            <li><a href="<c:url value='/member/logout.do'/>">로그아웃</a></li>
            <li><a href="<c:url value='/member/mypage'/>">정보수정</a></li>
            <li><a href="<c:url value="/member/delete.do" />">탈퇴</a></li> <!-- 탈퇴기능만 한번테스트해보려고 잠깐삽입 -->
            <li><a href="<c:url value="/member/mybox" />">보관함</a></li> <!-- 한번테스트해보려고 잠깐삽입 -->
            <li><a href="<c:url value="/member/diary" />">나의 기록</a></li> <!--한번테스트해보려고 잠깐삽입 -->
      	</c:if>
      </ul>
   </nav>
   <hr>
   <nav class="dalcbar">
   <p align="center">
      <ul class="dalc_menu">
         <li><a href="<c:url value='/main/recipe'/>">레시피 추천</a></li>
         <li><a href="<c:url value='/main/exercise'/>">홈트레이닝 추천</a></li>
         <li><a href="<c:url value='/main/media'/>">건강 미디어</a></li>
         <li><a href="<c:url value='/main/community'/>">현대사회 커뮤니티</a></li>
      </ul>
   </p>
   </nav>
   <hr>
   <!-- 기본 상단바 끝 -->

<div class="content" align="center">
	<div align="left">
		<h2>이번 주 인기글</h2>	
		매주 업데이트 되는 인기글을 확인하세요.
		<ol type="1">
			<c:forEach var="post" items="${BestPosts}">
				<li style="cursor:pointer">${post.post_title} (${post.post_hits})</td>	 
			</c:forEach>	
		</ol> 
 
	</div>
	
	<div align="left">
		<h3>최신글</h3>	
	</div>
	
 	<table> 
		<tr>
			<c:forEach var="illness" items="${sicks}">
					 <th onclick="">
					 	<div class="sick_box">
					 		<a href=""> <span class="sick_box_font"> ${illness.sick_name} </span> </a>  
					 	</div>
					</th>
				</c:forEach>
		</tr>
	</table>
   	
   	<input type ="button" value="글쓰기" onclick="location.href='<c:url value='/community/post' />'"></input> 	
</div>
	
	




</div>