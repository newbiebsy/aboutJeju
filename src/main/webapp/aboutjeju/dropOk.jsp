<%@page import="dao.OwnerDAO"%>
<%@page import="dao.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

/* 1.customerModify.jsp or hostModify.jsp - drop.jsp에서 
	 넘겨 받은 정보와 일치하는 정보
   2.db 손님 / 호스트 테이블에서 삭제 후 
   3.session 종료 & 
   4.main.jsp 로 redirect */

String id = request.getParameter("inputId");
String pw = request.getParameter("inputPw");


System.out.println("id:" + id);
System.out.println("pw:" + pw);

 
CustomerDAO dao = new CustomerDAO();
dao.deleteOne(id);
dao.close(); 

response.sendRedirect("main.jsp");
%>