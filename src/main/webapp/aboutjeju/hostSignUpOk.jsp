<%@page import="dao.OwnerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String ono = request.getParameter("inputOno");
String id = request.getParameter("inputId");
String pw = request.getParameter("inputPw");
String pwq = request.getParameter("inputQuestion");
String name = request.getParameter("inputName");
String phone = request.getParameter("inputPhone");

OwnerDAO dao = new OwnerDAO();
dao.insertOne(ono, id, pw, pwq, name, phone);

dao.close();

response.sendRedirect("login.jsp");
%>