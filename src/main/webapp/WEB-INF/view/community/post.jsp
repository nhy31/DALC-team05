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
<title>게시글 작성</title>
</head>
<body>
	<div>
		<form name="form" method="POST" action="<c:url value='/community/post.do' />" enctype="multipart/form-data">
			커뮤니티 선택
			<select name="commu_code"> 
				<c:forEach var="c" items="${Commu}">
					<option value="${c.commu_code}">${c.commu_name}</option>
				</c:forEach>
			</select>
			
			<table> 
				<tr>
					<th>작성자</th>
					<td> <input type="text" name="member_nickName" required="required" readonly value="${post.member_nickName}">  
					<input type="hidden" name="member_code" required="required" readonly value="${post.member_code}"> </td> 
				</tr>
				
				<tr>
					<th>작성일</th>
					<td> <input type="text" name="post_uploadDate" required="required" readonly>  </td> 
				</tr>
				
				<tr>
					<th>게시글 제목</th>
					<td> <input type="text" name="post_title" required="required">  </td> 
				</tr>
						
				<tr>
					<th>내용</th>
					<td>
						<input type="text" name="post_content" required="required"> 
					</td>
				</tr>
			</table>
			<input type="submit" value="업로드하기">
		</form>
		
	</div>



</body>
</html>