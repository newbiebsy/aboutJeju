<%@page import="vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customerBooking.jsp</title>
</head>
<body>
	<%
		Object obj = session.getAttribute("cvo");
		CustomerVO cvo = null;
		if(obj != null){
			cvo = (CustomerVO)obj;
		}
		
	%>

</body>
</html>