<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아프다 아파 현대사회</title>
</head>
<body>
<script>
    var url = "${url}";
    var msg = "${msg}";
    alert(msg);
    location.href = url;
</script>

</body>
</html>