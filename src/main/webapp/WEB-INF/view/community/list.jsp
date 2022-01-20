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
<title>커뮤니티</title>

</head>
<body>
<div align="center">
	<table>		
		<c:forEach var="post" items="${BestPosts}">
			<tr onClick="location.href='<c:url value='/community/post/detail.do'>
			<c:param name="BestPosts.post_code" value="${post.post_code}"/></c:url>'" style="cursor:pointer;">
<%-- 			<th style="width:10%;">${post.commu_name}</th>	 --%>
			<th style="width:10%;">${post.post_title}</th>	 
<%-- 			<th style="width:10%;">${post.member_nickName}</th>	   --%>
			<th style="width:10%;">${post.post_uploadDate}</th>	
		</tr>
		</c:forEach>	 
	</table>
	
	<button value="커뮤니티 전체보기" onClick=""></button>
	<table>		
		<c:forEach var="commu" items="${Commus}">
			<tr onClick="location.href='<c:url value='/community/post/detail.do'>
			<c:param name="BestPosts.post_code" value="${post.post_code}"/></c:url>'" style="cursor:pointer;">
			<th style="width:10%;">${post.commu_name}</th>	
			<th style="width:10%;">${post.post_title}</th>	 
			<th style="width:10%;">${post.member_nickName}</th>	  
			<th style="width:10%;">${post.post_uploadDate}</th>	
		</tr>
		</c:forEach>	 
	</table>
</div>
<br><br><br>
<div align="center">
	<form name="postSearch" method="POST" action="<c:url value='/community/post/search.do'/>">
   		<input type="text" id="search_box" placeholder="검색어를 입력하세요" required="required" name="post_title">
   		<input type="submit" value="search">
 	</form>
</div>
