<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>Welcome</title>
</head>
<body>
<% System.out.println("helloWorld, Hy"); %>
<% response.sendRedirect(request.getContextPath() + "/main"); %>
<h2>Hello World, Hy!</h2>
</body>
</html>

