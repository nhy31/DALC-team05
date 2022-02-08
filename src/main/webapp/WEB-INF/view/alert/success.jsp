<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<html>
<head>
<meta charset="UTF-8">

<title>알림창</title>
</head>
<style>
.swal-button--confirm{
  background :  #851BD8;
}
</style>
<body>
<!-- Include the Minimal theme -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
swal({
	 title: "",
	 text: "${msg}",
	 icon: "success",
})
.then(function(){
	location.href="<c:out value="${pageContext.request.contextPath}"/>${url}";                   
})
</script>

</body>
</html>