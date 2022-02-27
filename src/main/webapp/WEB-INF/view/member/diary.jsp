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

<!-- 내부 스타일 링크 -->
<link rel=stylesheet href="<c:url value='/css/main.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/swiper.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/btns.css'/>" type="text/css">

<title>아아현 건강미디어</title>

<style  type="text/css">

@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css);

* { font-family: 'Spoqa Han Sans Neo', 'sans-serif'; 
} 
</style>
 </head>
 <body>
 
<div class="row">
	<div class="col-md-2"></div>
	
	<div class="col-md-8">
			<div class="my-3 p-3 bg-body rounded shadow-sm">
			
			<div align="right">
			<input type ="button" value="일기쓰기" class="single_square_btn" style="margin-left: 30%;"
			onclick="location.href='<c:url value='/member/diary/upload'></c:url>'">
			</div>
								
			    <h6 class="border-bottom pb-2 mb-0">나의 일기</h6>
			    
			     
			  
			  <c:forEach var="d" items="${diarys}">
			  <div class="d-flex text-muted pt-3">
			    <div onclick="" class="d-flex text-muted pt-3">
			     
			     
			      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#6f42c1"></rect><text x="50%" y="50%" fill="#6f42c1" dy=".3em">32x32</text></svg>
					
			      <p class="pb-3 mb-0 small lh-sm border-bottom">
			        <strong class="d-block text-gray-dark">${d.diary_title}</strong>
			       <fmt:formatDate pattern="yy/MM/dd HH:mm" value="${d.diary_date}"/> ${d.diary_content}
			      </p> <p/>
			    </div><br>
			   </div></c:forEach> 
			  </div>
			</div>
	</div>
	
<div class="col-md-2"></div>

 </body>
</html>
<%@ include file="../main/bottom_footers.jsp"%> 