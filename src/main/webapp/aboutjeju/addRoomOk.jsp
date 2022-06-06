<%@page import="vo.RoomVO"%>
<%@page import="dao.RoomDAO"%>
<%@page import="vo.AccomodationVO"%>
<%@page import="dao.AccomodationDAO"%>
<%@page import="vo.OwnerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	request.setCharacterEncoding("UTF-8");

	Object obj = session.getAttribute("ovo");
	OwnerVO ovo = (OwnerVO)obj;
		
	AccomodationDAO aDao = new AccomodationDAO();
	AccomodationVO aVo =  aDao.selectOne(ovo.getOno());
	
	String rtype = request.getParameter("type");
	String rcount = request.getParameter("count");
	String price = request.getParameter("price");
	String discount = request.getParameter("discount");
	String rpeople = request.getParameter("people");
	
	System.out.println(rtype);
	System.out.println(rcount);
	System.out.println(price);
	System.out.println(discount);
	System.out.println(rpeople);
	
	RoomDAO rDao = new RoomDAO();
	RoomVO rVo = new RoomVO();
	
	
/* 	rVo.setAno(aVo.getAno());
	rVo.setRtype(rtype);
	rVo.setRcount(rcount);
	rVo.setPrice(price);
	rVo.setDiscount(discount);
	rVo.setRpeople(rpeople); */
	
	//rDao.insertRoom(rVo);
%>