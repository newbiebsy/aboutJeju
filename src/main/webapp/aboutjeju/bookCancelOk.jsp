<%@page import="vo.CustomerVO"%>
<%@page import="dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

Object obj = session.getAttribute("vo");
CustomerVO cvo = (CustomerVO)obj;

String bookno = request.getParameter("bno");
int bno = 0;

if(bookno!=null){
	bno = Integer.parseInt(bookno);
}

BookDAO bdao = new BookDAO();
bdao.bookCancel(bno);
bdao.close();

response.sendRedirect("customerBookingCheck.jsp?cno="+cvo.getCno());
%>