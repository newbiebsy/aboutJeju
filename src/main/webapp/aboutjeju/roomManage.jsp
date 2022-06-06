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
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>roomManage</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Bootstrap icon CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css" />

<!-- My CSS -->
<link rel="stylesheet" href="../css/style.css">
<title>ABOUT JEJU</title>

<!-- JQUERY -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
</head>
<body>
	<jsp:include page="mypageHeader.jsp" />
	<div class="container-fluid mypage mt-4">
		<div class="row">
			<jsp:include page="mypageSidebarH.jsp" />

			<div class="col-md-9">
		
		<% 
	// 세션으로 vo 가져오기
			Object obj = session.getAttribute("ovo");
			OwnerVO ovo = (OwnerVO)obj;
			// vo로 ono 가져오기
			String ono = ovo.getOno();
			
			// aDao 객체 생성
			AccomodationDAO aDao = new AccomodationDAO();
			AccomodationVO aVo = aDao.selectOne(ono);
			
			int ano = aVo.getAno();
			
			// rDao 객체 생성
			RoomDAO rDao = new RoomDAO();
			ArrayList<RoomVO> rList = rDao.selectAllRoom(ano);
			
			
			RoomdetailDAO rdDao = new RoomdetailDAO();
			
	%>	
	
	<form name="frm"  enctype="multipart/form-data" action="addRoom.jsp">
	<p><input type="submit" value="추가하기" id=add/></p>
	
	<%
		for(int i = 0; i<rList.size(); i++){
			int rno = rList.get(i).getRno();
			
		ArrayList<RoomdetailVO> rdList = rdDao.select(rno);
			
			for(RoomdetailVO rdVo : rdList){
	%>			
	<img src="<%=rdVo.getRimage() %>" alt="" id="rimage"/>
	<% 	} %>
	<p>방 종류: <input type="text" name="type" id="" value="<%= rList.get(i).getRtype() %>"/></p>
		<p>방 갯수: <input type="text" name="count" id="" value="<%= rList.get(i).getRcount() %>"/></p>
		<p>방 가격: <input type="text" name="price" id="" value="<%= rList.get(i).getPrice() %>"/> </p>
		할인율<input type="text" name="discount" id="" value="<%= rList.get(i).getDiscount() %>"/>
		<p>수용가능인원: <input type="text" name="people" id="" value="<%=rList.get(i).getRpeople() %>"/> </p>
		<p>방 사진: <input type="file" name="filename" id="" onchange="read(this)"/>
		<span><img src="" alt="" id="preview"/></span></p>
		<p><input type="file" name="filename2" id="" onchange="read2(this)"/>
		<span><img src="" alt="" id="preview2"/></span></p>

		
		<p><input type="button" value="수정" id ="<%=rno%>" onclick="modifyRoom<%=rno%>();"/> <input type="button" value="삭제" id="<%=rno %>"  onclick="deleteRoom<%=rno %>();" /></p>
		</form>		

	<script>
		function deleteRoom<%=rno%>(){
			/* 	console.log(e.getAttribute("id"));
				var a = e.getAttribute("id");
				$(e).attr('id') */
				 
			<%-- 	<% 
				rdDao.deleteAll();
				rDao.deleteOne();
				%> --%>
			var frm = document.frm;
			frm.action="roomDelete.jsp?rno=<%=rno%>";
			frm.method="post";
			frm.submit();
			}		
		
		function modifyRoom<%=rno%>(){
			var frm = document.frm;
			frm.action="roomModify.jsp?rno=<%=rno%>";
			frm.method="post";
			frm.submit();
		}
		
		function read(input){
			if(input.files && input.files[0]){
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('preview').src = e.target.result;
				};
				reader.readAsDataURL(input.files[0]);
			}else{
				/* document.getElementById('preview').src=""; */
			}
		}
		function read2(input){
			if(input.files && input.files[0]){
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('preview2').src = e.target.result;
				};
				reader.readAsDataURL(input.files[0]);
			}else{
				/* document.getElementById('preview2').src=""; */
			}
		}
		</script>
	
	
		<% 	} %>
	
	
	
			</div>

		</div>
	</div>
	<!-- Bootstrap Bundle with Popper -->
	<script
		src=" https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>

	<!-- My JS -->
	<script src="../js/script.js"></script>
</body>
</html>