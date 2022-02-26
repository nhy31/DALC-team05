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
<style type="text/css">
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css);

* { font-family: 'Spoqa Han Sans Neo', 'sans-serif'; }
.content_start {
padding: 10px 10px 5px 10px;
}

#main_title {
font-style: normal;
font-weight: bold;
color: #000000;
}

.issue-title {
font-style: normal;
font-size: 0.95vw;
color: #4E4E4E;
padding: 5px 10px 0px 10px;
}

.issue-info {
font-style: normal;
font-size: 0.9vw;
color: #4E4E4E;
padding: 5px 10px 0px 10px;
}

.img1 {
height: 100%;
width:100%;
border-radius: 6px;
}

.img2 {
max-height: 100%;
max-width:100%;
border-radius: 6px;
}

.sick_btns {
margin:10px 0px 0px 10px;
}

.news-div {
margin: 10px 10px 0px 10px;
}

#news-one {
margin: 0px 10px 25px 0px;
}

.news-title {
padding: 0px 25px 0px 25px;
font-style: normal;
font-weight: bold;
font-size: 1.2vw;
color: #4E4E4E;
}

#news-contents {
padding: 0px 25px 0px 25px;
font-style: normal;
font-weight: normal;
font-size: 0.9vw;
color: #4E4E4E;
background: #E1E1E1;
}

.news-info {
padding: 0px 25px 0px 25px;
font-style: normal;
font-weight: normal;
font-size: 0.9vw;
color: #4E4E4E;
}

.single_btn{
margin-top: 10px;
background-color:#ffffff;;
border: 1px solid #DDDDDD;
color:#4E4E4E;
font-size: 0.7vw;
text-align: center;
padding: 3px 9px;
border-radius: 79px;
}


.box-radio-input input[type="radio"]{
        display: none;
      }

      .box-radio-input input[type="radio"] + span{
        display: inline-block;
        background: none;
        border: 1.5px solid #DDDDDD;
        color: #4E4E4E;
        padding: 7px 15px;
        font-family: -apple-system;
        font-size: 12px;
        text-align: center;
        border-radius: 79px;
        cursor: pointer;
      }

      .box-radio-input input[type="radio"]:checked + span{
        border:1px solid #851BD8;
        background:#851BD8;
        color:#fff;
        font-weight: bold;
      }
</style>
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
${orders.rOrder_num}. ${orders.rOrder_content} <br>
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
<%@ include file="../main/bottom_footers.jsp"%> 