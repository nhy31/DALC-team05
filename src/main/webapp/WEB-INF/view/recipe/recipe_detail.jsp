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
<button onclick="location.href='<c:url value='/mybox/recipe/add'>
<c:param name='recipe_code' value='${clickRecipe.recipe_code}'></c:param></c:url>'">보관함에 저장</button>
<div>
내가 클릭한 레시피 정보 (이걸로 가져다쓰시면됩니당) <br>

이미지 : ${clickRecipe.recipe_img}<br>
제목: ${clickRecipe.recipe_title}<br>
코드 : ${clickRecipe.recipe_code}<br>
한줄소개 : ${clickRecipe.recipe_memo}<br>
어느나라음식 : ${clickRecipe.recipe_country}<br>
카테고리 : ${clickRecipe.recipe_category}<br>
시간 : ${clickRecipe.recipe_time}<br>
양 : ${clickRecipe.recipe_person}<br>
난이도 : ${clickRecipe.recipe_level}<br>
조회수 : ${clickRecipe.recipe_hits}<br>

<br><div>주재료정보<br>
<c:forEach var="uses" items="${clickRecipe.uses}">
<c:if test="${uses.rUse_type eq '주재료'}">
${uses.rUse_name} ${uses.rUse_volume} <br>
</c:if>
</c:forEach>
</div>

<br><div>부재료정보<br>
<c:forEach var="uses" items="${clickRecipe.uses}">
<c:if test="${uses.rUse_type eq '부재료'}">
${uses.rUse_name} ${uses.rUse_volume} <br>
</c:if>
</c:forEach>
</div>

<br><div>양념재료정보<br>
<c:forEach var="uses" items="${clickRecipe.uses}">
<c:if test="${uses.rUse_type eq '양념'}">
${uses.rUse_name} ${uses.rUse_volume} <br>
</c:if>
</c:forEach>
</div>

<br><div>과정정보<br>
<c:forEach var="orders" items="${clickRecipe.orders}">
</c:forEach>
<br>
</div>

</div>
<div>연관리스트

<c:forEach var="r" items="${relatedList}">
						<table style="text-align:left;">
		        			<tr><td style="text-align: center;">
		        			<a href="<c:url value="/recipe/recipe_detail"><c:param name="recipe_code" value="${r.recipe_code}">
				     				</c:param></c:url>">
		        			<img class="img1" src="<c:url value='${r.recipe_img}'/>"></a></td></tr>
		        			<tr><th class="issue-title">${r.recipe_title}</th></tr>
		        			<tr><td class="issue-info">조회수 ${r.recipe_hits}회</td></tr>
		        		</table>
</c:forEach>
</div>

</body>
</html>