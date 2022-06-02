<%@page import="vo.CustomerVO"%>
<%@page import="vo.OwnerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 마이페이지/로그인 헤더 -->
<%
request.setCharacterEncoding("UTF-8");

String cno = request.getParameter("cno");
String ono = request.getParameter("ono");
String who = null;

if (cno != null) {
	who = "customer";
} else {
	who = "host";
}
%>
<div class="container-fluid header mt-4">
	<div>
		<a href="main.jsp?who=<%=who%>"><img src="../images/logo.jpg" alt="ABOUT JEJU" class="ps-2"></a>
	</div>
	<a class="btn border-0 position-absolute d-md-none" id="menu-btn"> <i class="bi bi-list"></i>
	</a>
</div>