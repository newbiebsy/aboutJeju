<%@page import="vo.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productReview.jsp</title>
<style>
	*{
		margin: 0;
		padding: 0;
	}
	.reviewbox{width: 800px; margin: auto; margin-top:30px; border:1px solid black;}
	.reviewheader > h3{text-align: center; line-height:20px; width: 800px; height:50px; border:1px solid green; background: lightgrey;}


</style>
</head>
<body>
	<%
		Object oobj = session.getAttribute("ovo");
		Object cobj = session.getAttribute("cvo");
		
		String str = request.getParameter("ano");
		System.out.println("str : "+str);
		int ano = Integer.parseInt(str);
		
		ReviewDAO rDao = new ReviewDAO();
		
		
	%>
	<div class="reviewbox">
		<div class="reviewheader">
		<h3>후기</h3>
		<%
			ArrayList<ReviewVO> list = rDao.selectAll(ano);
		for(ReviewVO vo : list){
		%>
			<div class="review">
				<%=vo.getContents() %>
			</div>
		<%
				}
		%>
		</div>
	</div>
</body>
</html>