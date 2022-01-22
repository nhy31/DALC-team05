<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.title {
	font-size: 20pt;
	height: 60px;
	margin-bottom: 10px;
}
table tr {
	text-align: center;
}
.big {
	width: 80%;
	margin: auto;
	align: center;
	margin-top: 20px;
	border-radius: 15px;
}
.seongbukNews1, .seongbukNews2 {
	width: 100%;
}
.seongbukNews1 tr, .seongbukNews2 tr {
	height: 50px;
}
div {
	text-align: center;
}
.seongbukNews1 tr, .seongbukNews1 td, .seongbukNews2 tr, .seongbukNews2 td
	{
	border-collapse: separate;
	border-spacing: 1px;
	border: 3px solid #ccc;
}
</style>
</head>


<body>
	<table class=big>
		<colgroup>
			<col width="50%">
			<col width="50%">
		</colgroup>
		<tr class="title">
			<th colspan="3">건강뉴스 모음</th>
		</tr>
		<thead>
		<tbody>
			<tr>
				<td>
					<table class="seongbukNews1">
						<colgroup>
							<col width="10%">
							<col width="90%">
						</colgroup>
						<c:forEach var="url" items="${urls}" varStatus="status" begin="3"
							end="13">
							<c:if test="${titles[status.index]!=''}">
								<tr>
									<td>${ status.index-2}</td>
									<td><a href="${url}">${titles[status.index]}</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</td>
				<td>
					<table class="seongbukNews2">
						<colgroup>
							<col width="10%">
							<col width="90%">
						</colgroup>
						<c:forEach var="url" items="${urls}" varStatus="status" begin="14"
							end="${titles.size()}">
							<c:if test="${titles[status.index]!=''}">
								<tr>
									<td>${ status.index-2}</td>
									<td><a href="${url}">${titles[status.index]}</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</body>

</html>