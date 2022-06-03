<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productManageOk</title>
<script>
	console.log(ac);
</script>
</head>
<body>
	<%
	String ac = request.getParameter("accommodation");

	out.println(ac);
	%>

</body>
</html>