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
		<form name="form" method="POST" action="<c:url value='/community/create.do' />" enctype="multipart/form-data">
			<select name="sick_name">
				<c:forEach var="illness" items="${sicks}">
					<option>${illness.sick_name}</option>
				</c:forEach>
			</select>
			
			<table> 
				<tr>
					<th>커뮤니티 이름</th>
					<td> <input type="text" name="commu_name" required="required">  </td> 
				</tr>
						
				<tr>
					<th>한줄소개</th>
					<td>
						<input type="text" name="commu_introduce" required="required"> 
					</td>
				</tr>
			</table>
			<input type="submit" value="생성하기">
		</form>
		
	</div>


</body>
</html>