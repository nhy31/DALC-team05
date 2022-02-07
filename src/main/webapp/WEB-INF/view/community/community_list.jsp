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

	<table>		
		<tr>
 			<th>커뮤니티 이름</th>	 
			<th>관련질병</th>	 
 			<th>소개한줄</th>	  	
		</tr>
		<c:forEach var="list" items="${CommuList}">
			<tr style="cursor:pointer;">
 				<td>${list.commu_name}</td>	 
				<td>${list.sick_name}</td>	 
				<td>${list.commu_introduce}</td>	   	
			</tr>	
		</c:forEach> 
	</table>
	
</div>
	
