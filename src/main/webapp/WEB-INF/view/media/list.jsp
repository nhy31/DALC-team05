<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<title>미디어 메인페이지</title>

<style>
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
  
	<h2>오늘의 건강 이슈 TOP8</h2>
		<div class="swiper-container">
   			<div class="swiper-wrapper">
   				<c:forEach var="list" items="${medias}">
        			<div class="swiper-slide">
            			${list.title}
            			<a href="${list.url}"><img class="today_img" src="<c:url value='${list.image}'/>" width="300" height="200" alt="테스트용" ></a>
            			<button class="btn-mark" type="button">찜하기</button>	
            		</div>
            	</c:forEach>
      	</div>

      	<div class="swiper-button-next"></div>	<!-- 오른쪽 버튼 -->
      	<div class="swiper-button-prev"></div>	<!-- 왼쪽 버튼 -->
      	<div class="swiper-pagination"></div>	<!-- 페이징 -->
   	</div>
   	
   	<div>   
   	<h2>질병별 뉴스</h2>
   		<div>       
   			<form action="">
   				<c:forEach var="illness" items="${sicks}">
					<input type="radio" value="${illness.sick_code}">${illness.sick_name}</option>
				</c:forEach>
   			</form>
		</div>
        <table>
        	<c:forEach var="list" items="${medias2}">
        		<tr>
        			<td>
        				<a href="${list.url}"><img class="today_img" src="<c:url value='${list.image}'/>" width="300" height="200" alt="테스트용" ></a>
        			</td>
            		<td>
            			${list.title}
            		</td>
            	</tr>
           </c:forEach>
         </table>
 	</div>
 	
   <script>
   new Swiper('.swiper-container', {
      slidesPerView : 4, // 동시에 보여줄 슬라이드 rotn
      spaceBetween : 30, // 슬라이드 간 간격
      slidesPerGroup : 4, // 그룹으로 묶는 개수
      
      // 그룹수가 맞지 않을 경우 빈칸으로 메우기
      loopFillGroupWithBlank : true,
      loop : true, // 무한 반복
      
      pagination : { // 페이징
         el : '.swiper-pagination',
         clickable : true, // 페이징을 클릭하면 해당 영역으로 이동 <- 필요시 지정
      },
      
      navigation : { // 네비게이션
         nextEl : '.swiper-button-next', // 다음 버튼 클래스명
         prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
      },   
   });
   </script>   	
   	
	
</body>

</html>