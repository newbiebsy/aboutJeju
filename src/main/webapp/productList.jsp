<%@page import="java.util.ArrayList"%>
<%@page import="dao.AccomodationDAO"%>
<%@page import="vo.AccomodationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productList.jsp</title>
<style>
	*{
		margin: 0;
		padding: 0;
	}
	#container{
		border: 1px solid black;
		width: 1000px;
		height: 800px;
		margin: auto;
	}
	#button1{
		/* border: 1px solid blue; */
		width:800px;
		padding-left: 200px;
		margin: 50px 0;
	}
	#button1 > a>input{
		margin-left: 100px;
		padding: 3px;
	}
	img{
		width: 200px;
		height: 200px;
	}
	#wrap {
		width: 200px;
		height : 250px;
		border : 1px solid darkgrey;
		margin: 8px 4px;
		padding: 20px;
		float : left;
	}
	#wrap > a {
		text-decoration: none;
	}
 	#wrap > a> span {
 		float: right;
 	}
 	#pages {
 		text-align: center;
 	}
 	#pages > a{
 		text-decoration: none;
 	}
</style>
<script type="text/javascript">
	
	
</script>
</head>
<body>
	<div id="container">
			<%!
			// nextPage method에서 endPage가 totalPage를 넘지 않기 위한 변수
			int checkEndPage = 0;
		
			public int beforePage(int startPage){
				if(startPage == 1){
					return 1;
				}
				return startPage-1;
			}
			
			public int nextPage(int endPage){
				if(endPage==checkEndPage){
					return checkEndPage;
				}
				return endPage+1;	
			}
		%>
		<%
			// 현재 페이지 번호
			String cp = request.getParameter("cp"); 
			int currentPage = 1;			
			if(cp != null){
				currentPage = Integer.parseInt(cp);
			}
			
			// 한페이지당 게시물 건수
			int recordPerPage = 8;
			
			
			// 페이지당 게시물 시작번호
			// mysql limit 이용
			// 페이지가 1이면 0 , 2 이면 8, 3이면 16
			int startNo = (currentPage-1)*recordPerPage;
			
			// dao 객체 생성
			AccomodationDAO dao = new AccomodationDAO();
			ArrayList<AccomodationVO> list = dao.selectType("호텔",startNo);
			
			String sortType = request.getParameter("type");
			// 카테고리별 정렬을 위한 빈 문자열
			String typeCheck = "";
			if(sortType != null){
				list = dao.SelectSort("호텔", startNo,sortType);
				typeCheck = "type="+sortType+"&";
			}
			// 총 게시물 수 
			int totalCount = dao.getTotalCount("호텔");
			
			// 총 페이지 수
			int totalPage = (totalCount%recordPerPage==0)?
							totalCount/recordPerPage:totalCount/recordPerPage+1;
			
			checkEndPage = totalPage;
		
			// 시작페이지 번호
			int startPage = 1;
			// 끝페이지 번호
			int endPage = 4;
			
			// 페이지 미세조정
			for(int i=0;i<=endPage;i++){
				if(currentPage >= 1+(i*4)){
					startPage = 1+(i*4);
					endPage = startPage+3;
					if(currentPage >= totalPage){
						endPage = totalPage;
					}
				}
			}

		%>
		<div id="button1">
			<a href="productList.jsp?type=starsort&cp=<%=currentPage%>"><input type="button" value="별점순"/></a>
			<a href="productList.jsp?type=reviewsort&cp=<%=currentPage%>"><input type="button" value="후기 많은 순" /></a>
			<a href="productList.jsp?type=pricesort&cp=<%=currentPage%>"><input type="button" value="가격순" /></a>
		</div>
		<div id="contents">
		<%

			for(AccomodationVO vo : list){
		%>
			<div id="wrap">
				<a href="">
					<img src=<%=vo.getAimage() %> alt="" />
					<b><%=vo.getAname() %></b><br>
					<span>별점</span>
					<p><%=vo.getAtype()%> 가격</p>
					<p><%=vo.getAtype()%> 설명<%=vo.getAdetail()%></p>
				</a>
			</div>
			<%
				}
				dao.close();
			%>
		</div>
	</div>
	<div id = "pages">
	<%
		//if(sortType)
	
	
	%>
		<a href="productList.jsp?<%=typeCheck%>cp=<%=beforePage(startPage)%>"><</a>
	<%
		for(int i=startPage;i<=endPage;i++){
		
	%>
		<a href="productList.jsp?<%=typeCheck%>cp=<%=i%>"><%=i %></a>
	<%
		}
	%>
		<a href="productList.jsp?<%=typeCheck%>cp=<%=nextPage(endPage)%>">></a>
	</div>
</body>
</html>