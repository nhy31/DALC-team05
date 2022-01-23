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
<style>
  table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
  }
</style>
</head>
<body>

<div align="center">
<br><br><br>
	인기글들 목록 보이는 자리 - 전체 게시판에서? 
	<table>		
		<tr>
 			<th>커뮤니티</th>	 
			<th>게시글 제목</th>	 
 			<th>작성자</th>	  
			<th>작성일</th>	
			<th>조회수</th>
		</tr>
		<c:forEach var="post" items="${BestPosts}">
		<tr onClick="location.href='<c:url value='/community/post/detail.do'>
		<c:param name="BestPosts.post_code" value="${post.post_code}"/></c:url>'" style="cursor:pointer;">
 			<td>${post.commu_name}</td>	 
			<td>${post.post_title}</td>	 
			<td>${post.member_nickName}</td>	   
			<td>${post.post_uploadDate}</td>
			<td>코드추가하기</td>	<!-- ${post.hits} -->
		</c:forEach>	
		</tr>	 
	</table>
	</div>
	
	<h3>자신의 질병의 게시판 자리 여기 글들이 보임. 바로위에 다른 질병 선택가능하도록 페이지구현하기</h3>	
	<input type = "button" onClick="/community/post/upload" value="게시글 작성하러가기"></input> 
	<input type="button" value="커뮤니티 생성" onClick="/community/create"></input>
	<input type="button" value="커뮤니티 목록보기" onclick="location.href='<c:url value='/community/commulist' />'"></input>
<!-- 	<table>		 -->
<%-- 		<c:forEach var="commu" items="${Commus}"> --%>
<%-- 			<tr onClick="location.href='<c:url value='/community/post/detail.do'> --%>
<%-- 			<c:param name="BestPosts.post_code" value="${post.post_code}"/></c:url>'" style="cursor:pointer;"> --%>
<%-- 			<td>${post.commu_name}</td>	 --%>
<%-- 			<td>${post.post_title}</td>	  --%>
<%-- 			<td>${post.member_nickName}</td>	   --%>
<%-- 			<td>${post.post_uploadDate}</td>	 --%>
<!-- 		</tr> -->
<%-- 		</c:forEach>	  --%>
<!-- 	</table> -->


<br><br><br>
<div align="center">
	<form name="postSearch" method="POST" action="<c:url value='/community/post/search.do'/>">
   		<input type="text" id="search_box" placeholder="검색어를 입력하세요" required="required" name="post_title">
   		<input type="submit" value="search">
 	</form>
</div>
