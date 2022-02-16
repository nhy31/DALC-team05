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

<!-- 부트스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- 외부 스타일 링크 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<!-- 내부 스타일 링크 -->
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">


<title>아아현 커뮤니티</title>
<style>

.content_start {
padding: 10px 10px 5px 10px;
}

#main_title {
font-style: normal;
font-weight: bold;
color: #000000;
}

table, th, tr, td {
border: 1px solid black;
}
</style>
</head>
<body>

<div class="content_start">

	<div class="row">
	
		<div class="col-md-1"></div>
		<div class="col-md-10 col-12">
			<div align="left" class="fs-4" id="main_title">나의 커뮤니티</div>
				<div style="margin-top:20px; margin-bottom:20px;" align="center"><table style="text-align:center; width:80%; font-size:1vw;">
					<tr>
			 			<th style="width:5%">가입</th>	 
			 			<th style="width:30%">커뮤니티 이름</th>	 
						<th style="width:10%">관련질병</th>	 
			 			<th style="width:50%">소개한줄</th> 
			 			<th style="width:5%">go</th> 
					</tr>
				
					<c:forEach var="my" items="${MyCommuList}">
					<tr style="cursor:pointer;">
						<td><button type="button" onclick="location.href='<c:url value='/community/join/cancel'>
							<c:param name="commu_code" value="${my.commu_code}"></c:param> </c:url>'">해지</button></td>
		 				<td>${my.commu_name} 
		 					</td>	 
						<td>${my.sick_name}</td>	 
						<td>${my.commu_introduce}</td>	
						<td><input class="btn btn-primary" type="button"
							 		onclick="location.href='<c:url value='/community/posts'>
							 				<c:param name="commu_code" value="${my.commu_code}"></c:param> 
							 			</c:url>'" /></td>
					</tr>	
					</c:forEach> 
				</table></div>
				
				<hr style="margin-top:20px; margin-bottom:20px;">
				
			<div align="left" class="fs-4" id="main_title">전체 커뮤니티</div>
				<div style="margin-top:20px; margin-bottom:20px;" align="center"><table style="text-align:center; width:80%; font-size:1vw;">		
					<tr>
						<th style="width:5%">가입</th>	 
			 			<th style="width:30%">커뮤니티 이름</th>	 
						<th style="width:10%">관련질병</th>	 
			 			<th style="width:50%">소개한줄</th>	
			 			<th style="width:5%">go</th> 
					</tr>
					<c:forEach var="list" items="${CommuList}">
					<tr style="cursor:pointer;">
						<td><button type="button" onclick="location.href='<c:url value='/community/join'>
							<c:param name="commu_code" value="${list.commu_code}"></c:param> </c:url>'">가입</button></td>
		 				<td>${list.commu_name}</td>	 
						<td>${list.sick_name}</td>	 
						<td>${list.commu_introduce}</td>
						<td><input class="btn btn-primary" type="button"
							 		onclick="location.href='<c:url value='/community/posts'>
							 				<c:param name="commu_code" value="${list.commu_code}"></c:param> 
							 			</c:url>'" /></td>	
					</tr>	
					</c:forEach>
				</table></div>
		</div>
		<div class="col-md-1"></div>
	
	</div>
	
</div>
</body>
</html>
