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
<title>커뮤니티 만들기</title>
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
	<div>
		<form name="form" method="POST" action="<c:url value='/member/join.do' />" enctype="multipart/form-data">
			
			<select>
				<c:forEach var="illness" items="${sicks}">
					<option>${illness.sick_name}</option>
				</c:forEach>
			</select>
			
			<table> 
				<tr>
					<th>작성자</th>
					<th>${ MyNickName }님</th> 
				</tr>
						
				<tr>
					<th>내용</th>
					<td>
						<input type="text" name="post_comtent" placeholder="내용을 입력하세요" required="required"> 
					</td>
				</tr>
			</table>
		</form>
		
	</div>


</body>
</html>