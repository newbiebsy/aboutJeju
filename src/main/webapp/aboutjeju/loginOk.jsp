<%@page import="vo.OwnerVO"%>
<%@page import="vo.CustomerVO"%>
<%@page import="dao.OwnerDAO"%>
<%@page import="dao.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String id = request.getParameter("inputId");
String pw = request.getParameter("inputPw");
// System.out.println("id : " + id);

CustomerDAO cdao = new CustomerDAO();
CustomerVO cvo = cdao.login(id, pw);

OwnerDAO odao = new OwnerDAO();
OwnerVO ovo = odao.login(id, pw);

if (cvo != null) {
	session.setAttribute("vo", cvo);
	response.sendRedirect("main.jsp?who=customer");
} else if (ovo != null) {
	session.setAttribute("vo", ovo);
	response.sendRedirect("main.jsp?who=host");
} else {
%>

<script>
	alert('입력하신 내용과 일치하는 정보가 없습니다.');
	location.href = "login.jsp";
</script>

<%
}

cdao.close();
odao.close();
%>