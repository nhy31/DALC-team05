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

<title>게시글 자세히..</title>
게시글 자세히..
</head>
<body>
<!-- 기능test 임시테스트 -->
${post.post_title} <br>
${post.post_content}<br>
${post.post_code}<br>
${post.commu_code}<br> 
${post.commu_name}<br>
${post.member_code}
${post.post_hits}<br>
${post.post_uploadDate} <br>
${post.member_nickName} <br>
${myNick} <br>



<div>댓글</div>

<!-- 기능test 임시로쓴거 table -->
<div> 나의댓글창
<form action="">
<table style="border: 1px solid blue;">
<tr >
<td style="border: 1px solid blue;" rowspan="2">${me.member_image}d</td>
<td style="border: 1px solid blue;">${me.member_nickName}</td>
</tr>
<tr>
<td style="border: 1px solid blue;" ><input type="text" name="comment_content">
<input type="submit" value="댓글업로드" onclick=""></td>
</tr>
</table>
</form>
</div>
<div>

</div>
</body>
</html>
