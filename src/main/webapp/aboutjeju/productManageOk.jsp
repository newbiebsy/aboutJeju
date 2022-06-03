<%@page import="vo.ConvenienceVO"%>
<%@page import="dao.ConvenienceDAO"%>
<%@page import="vo.AccomodationVO"%>
<%@page import="dao.AccomodationDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<% 
	String saveDir = request.getRealPath("/upload");
		//System.out.println(saveDir);
	int maxFileSize = 1024*1024*10;
	
	MultipartRequest mr = new MultipartRequest(request, saveDir, maxFileSize, "UTF-8", new DefaultFileRenamePolicy());
	
	
	String aname = mr.getParameter("title");
	String addrs1 = mr.getParameter("addrs1");
	String addrs2 = mr.getParameter("addrs2");
	
	String aaddress = addrs1+addrs2;  

	String aimage = mr.getOriginalFileName("filename");
	String atype = mr.getParameter("detail");
	String adetail = mr.getParameter("adetail");
	String aphone = mr.getParameter("phone");
	
	String convenience[] = mr.getParameterValues("convenience");
	
	
	String ono = "0000000003";

	AccomodationDAO aDao = new AccomodationDAO();
	AccomodationVO aVo = new AccomodationVO();
	/* AccomodationVO aVo = new AccomodationVO( 0, ono, aname, aaddrs, aimage, atype, adetail, phone  ); */
	
	aVo.setOno(ono);
	aVo.setAname(aname);
	aVo.setAaddress(aaddress);
	aVo.setAimage(aimage);
	aVo.setAtype(atype);
	aVo.setAdetail(adetail);
	aVo.setAphone(aphone);
	
	
	aDao.addOne(aVo);
	aVo = aDao.selectOne(ono);
	
	ConvenienceDAO cDao = new ConvenienceDAO();
	ConvenienceVO cVo = new ConvenienceVO();
	cVo.setAno(aVo.getAno());
	
	for(int i = 0; i<convenience.length; i++){
		cVo.setOption(convenience[i]);
		
		cDao.addImage(cVo);
		
	}
		aDao.close();
		cDao.close();
		
		response.sendRedirect("productManage.jsp");
	
	%>

