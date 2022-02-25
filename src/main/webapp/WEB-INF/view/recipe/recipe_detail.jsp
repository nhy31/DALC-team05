<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../main/top_temp.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아아현 레시피 상세보기</title>
</head>
<body> <!-- 테스트 임시 삽입 -->
<div>내가 클릭한 레시피 정보
${clickRecipe.recipe_img}<br>
${clickRecipe.recipe_title}<br>
${clickRecipe.recipe_time}<br>
${clickRecipe.recipe_person}<br></div>

<div>연관리스트

<c:forEach var="r" items="${relatedList}">
						<table style="text-align:left;">
		        			<tr><td style="text-align: center;"><a href="adsasasd">
		        			<img class="img1" src="<c:url value='${r.recipe_img}'/>"></a></td></tr>
		        			<tr><th class="issue-title">${r.recipe_title}</th></tr>
		        			<tr><td class="issue-info">조회수 ${r.recipe_hits}회</td></tr>
		        		</table>
</c:forEach>
</div>

</body>
</html>