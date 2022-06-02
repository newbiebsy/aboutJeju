<%@page import="vo.OwnerVO"%>
<%@page import="vo.CustomerVO"%>
<%@page import="dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String who = request.getParameter("who");

Object obj = session.getAttribute("vo");

OwnerVO ovo = null;
CustomerVO cvo = null;

if ("host".equals(who)) {
	ovo = (OwnerVO) obj;
} else {
	cvo = (CustomerVO) obj;
}

String bookno = request.getParameter("bno");
int bno = 0;
 
if (bookno != null) {
	bno = Integer.parseInt(bookno);
}

BookDAO bdao = new BookDAO();
bdao.bookCancel(bno);
bdao.close();

if ("host".equals(who)) {
	response.sendRedirect("hostBookingCheck.jsp?ono=" + ovo.getOno() + "&cp=1");
} else {
	response.sendRedirect("customerBookingCheck.jsp?cno=" + cvo.getCno() + "&cp=1");
}
%>