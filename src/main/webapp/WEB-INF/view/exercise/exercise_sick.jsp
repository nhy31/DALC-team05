<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<meta charset="EUC-KR">
</head>
<body>

<c:forEach var = "list" items="${sick_exercise}">
	<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
		<div class="col-auto d-none d-lg-block">
			<img class="today_img" src="${list.exercise_thumb}" alt="thumbnail" />
			<!-- <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>${list.exercise_thumb} </title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em"> 
				엥모야
			</text></svg>-->
		</div>
		<div class="col p-4 d-flex flex-column position-static">
			<!--<strong class="d-inline-block mb-2 text-primary">World</strong>-->
			<h3 class="mb-0">${list.exercise_title}</h3>
				<div class="mb-1 text-muted">${list.exercise_views}회</div>
				<p class="card-text mb-auto">운동에 대한 정보</p>
				<a href="${list.exercise_url}" class="stretched-link">홈트레이닝 하러가기</a>
		</div>
	</div>
</c:forEach>
      
</body>
</html>