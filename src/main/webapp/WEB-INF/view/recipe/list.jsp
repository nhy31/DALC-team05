<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel=stylesheet href="<c:url value='/css/main.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/join.css'/>" type="text/css">

<title>레시피 메인페이지</title>


</head>
<body>

	<c:forEach var="best" items="${BestRecipes}">
		<tr>
 			<td>${best.recipe_img}</td>	<!-- 썸넬 클릭하면 상세페이지  -->
 			<td>${best.recipe_name}</td>	
			<td>${best.recipe_length}</td>	 
		<tr>
	</c:forEach>	

</body>
</html>