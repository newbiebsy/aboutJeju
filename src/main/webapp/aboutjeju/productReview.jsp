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
	.reviewheader > h3{text-align: center; line-height:50px; width: 800px; height:50px; border:1px solid green; background: lightgrey;}
	.reviewwrap{width:800px; border:1px solid black;}

</style>
</head>
<body>
	<%!// nextPage method에서 endPage가 totalPage를 넘지 않기 위한 변수
		int checkEndPage = 0;
	
		public int beforePage(int startPage) {
			if (startPage == 1) {
				return 1;
			}
			return startPage - 1;
		}
	
		public int nextPage(int endPage) {
			if (endPage == checkEndPage) {
				return checkEndPage;
			}
			return endPage + 1;
		}
	%>
	<%
		Object oobj = session.getAttribute("ovo");
		Object cobj = session.getAttribute("cvo");
		
		String str = request.getParameter("ano");
		//System.out.println("str : "+str);
		int ano = Integer.parseInt(str);
		
		ReviewDAO rDao = new ReviewDAO();
		
		
	%>
	<div class="reviewbox">
		<div class="reviewheader">
		<h3>후기</h3>
		<%
			ArrayList<ReviewVO> list = rDao.selectPaging(ano, 0);
		for(ReviewVO vo : list){
		%>
			<div class="reviewwrap">
				<h3><%=vo.getTitle() %></h3>
				<h4><%=vo.getStar() %></h4>
				<span class="review"><%=vo.getContents() %></span>
			</div>
		<%
				}
		%>
		</div>
	</div>
</body>
</html>