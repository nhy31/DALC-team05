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
	<div> 커뮤니티 글쓰기
		<form name="form" action="<c:url value='/community/post/upload.do' />" enctype="multipart/form-data">
			게시판 선택
			<select name="commu_code"> 
				<option value="0">전체</option>
				<c:forEach var="c" items="${MyCommuList}">
					<option value="${c.commu_code}">${c.commu_name}</option>
				</c:forEach>
			</select>
			
			<table> 
		
				<tr>
					<th>게시글 제목</th>
					<td> <input type="text" name="post_title" required="required" placeholder="제목을 입력해주세요.">  </td> 
				</tr>
						
				<tr>
					<th>내용</th>
					<td>
						<input type="text" name="post_content" required="required"> 
					</td>
				</tr>
			</table>
			<input type="submit" value="업로드하기" onclick="">
		</form>
		
	</div>



</body>
</html>