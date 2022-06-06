<%@page import="vo.RoomdetailVO"%>
<%@page import="dao.RoomdetailDAO"%>
<%@page import="vo.RoomVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.RoomDAO"%>
<%@page import="vo.AccomodationVO"%>
<%@page import="dao.AccomodationDAO"%>
<%@page import="vo.OwnerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
Object obj = session.getAttribute("ovo");
OwnerVO ovo = (OwnerVO)obj;
// vo로 ono 가져오기
String ono = ovo.getOno();

// aDao 객체 생성
AccomodationDAO aDao = new AccomodationDAO();
AccomodationVO aVo = aDao.selectOne(ono);


RoomDAO rDao = new RoomDAO();
RoomVO rVo = new RoomVO();

RoomdetailDAO rdDao = new RoomdetailDAO();
RoomdetailVO rdVo = new RoomdetailVO();

int rno = Integer.parseInt(request.getParameter("rno"));

String rtype = request.getParameter("type");
String rcount = request.getParameter("count");
String price = request.getParameter("price");
String discount = request.getParameter("discount");
String rpeople = request.getParameter("people");

System.out.println(rno);
System.out.println(rtype);
System.out.println(rcount);
System.out.println(price);
System.out.println(discount);
System.out.println(rpeople);






%>