<%@page import="vo.OwnerVO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.ConvenienceVO"%>
<%@page import="dao.ConvenienceDAO"%>
<%@page import="vo.RoomdetailVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.RoomdetailDAO"%>
<%@page import="dao.ReviewDAO"%>
<%@page import="vo.AccomodationVO"%>
<%@page import="dao.AccomodationDAO"%>
<%@page import="vo.RoomVO"%>
<%@page import="dao.RoomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productDetail.jsp</title>
</head>
<style>
	*{
		margin: 0;
		padding: 0;
	}
	.container{
		border: 1px solid black; 
		width: 1000px;
		margin: auto;
	}
	input[name="slide"]{display:none;}
	
	/* 슬라이드 영역 */
	.section .slidewrap {max-width:800px;margin:50px auto;overflow:hidden;position:relative;border: 1px solid black; }
	.section .slidelist {white-space:nowrap;font-size:0;}
	.section .slidelist > li {display:inline-block;vertical-align:middle;width:100%;transition:all .5s;}
	.section .slidelist > li > a {display:block;position:relative;}
	.section .slidelist > li > a > img {display:block;margin:auto; width:800px; height:400px;}

	/* 좌우로 넘기는 LABEL버튼에 대한 스타일 */
	.section .slide-control {position:absolute;top:0;left:0;z-index:10;width:100%;height:100%;}
	.section .slide-control label {position:absolute;z-index:1;top:50%;transform:translateY(-50%);padding:50px;cursor:pointer;}
	.section .slide-control .left {left:30px;background:url('https://yaimg.yanolja.com/joy/sunny/static/images/btn-slide-photo-prev.svg') center center / 100% no-repeat;}
	.section .slide-control .right {right:30px;background:url('https://yaimg.yanolja.com/joy/sunny/static/images/btn-slide-photo-next.svg') center center / 100% no-repeat;}
	.section .slide-control [class*="control"] {display:none;}
	
	/* INPUT이 체크되면 변화값이 li까지 전달되는 스타일 */
	.section [id="slide01"]:checked ~ .slidewrap .slidelist > li {transform:translateX(0%);}
	.section [id="slide02"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-100%);}
	.section [id="slide03"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-200%);}
	
	/*  INPUT이 체크되면 변화값이 좌우 슬라이드 버튼을 담고 있는 div 까지 전달되는 스타일 */
	.section [id="slide01"]:checked ~ .slidewrap .control01 {display:block;}
	.section [id="slide02"]:checked ~ .slidewrap .control02 {display:block;}
	.section [id="slide03"]:checked ~ .slidewrap .control03 {display:block;}
	
	.maininfo{margin:auto; margin-top:-40px; width:800px; border: 1px solid darkgray;}
	.roomwrap{margin:auto; width:800px;height:220px; border: 1px solid blue;}
	.calendar{text-align: center;}
	.calendar > input{margin: 20px 50px;}
	.imgwrap {width:250px; height:200px; margin: 10px 10px; float:left;}
	.imgwrap > img{width:250px; height:200px;}
	
	/* 방마다 이미지 2개씩 다 불러온 후 홀수번째 이미지는 display none
	 추후 슬라이드 시 홀수번째 이미지 불러오게 기능 추가하겠습니다 */
	#roomimg:nth-child(odd){display: none;}
	
	/* 방정보 css */
	.detailleft{float: left; margin-top:30px;}
	.detailright{margin-top: 100px;}
	.detailright>span{text-decoration: line-through; color: darkgrey;}
	
	/* 숙소정보 css */
	.infobox{margin:auto; text-align: left; padding: 20px; position: relative;}
	.infowrap{overflow: hidden; margin:auto; padding:20px; padding-bottom: 40px; width:800px; height: 300px; background: RGB(249,248,248);}
	.infowrap ul{padding-left: 15px; list-style: none;}
	.infowrap h3{margin:20px 0;}
	#info-off{display: none;}
	.infobox > button{position: absolute; right:500px; bottom:20px;}
	
	/* 편의사항 css */
	.conveniencebox{margin:auto; margin-bottom:20px; width:800px; height:120px; border: 1px solid darkgray;}
	.conimgwrap{float:left; text-align:center; margin-right: 20px;}
	.conimgwrap span{display: block; }


/* 슬라이드 영역 */
.section .slidewrap {
	max-width: 900px;
	margin: 50px auto;
	overflow: hidden;
	position: relative;
	border: 1px solid black;
}

.section .slidelist {
	white-space: nowrap;
	font-size: 0;
}

.section .slidelist>li {
	display: inline-block;
	vertical-align: middle;
	width: 100%;
	transition: all .5s;
}

.section .slidelist>li>a {
	display: block;
	position: relative;
}

.section .slidelist>li>a>img {
	display: block;
	margin: auto;
	width: 700px;
	height: 350px;
}

/* 좌우로 넘기는 LABEL버튼에 대한 스타일 */
.section .slide-control {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 10;
	width: 100%;
	height: 100%;
}

.section .slide-control label {
	position: absolute;
	z-index: 1;
	top: 50%;
	transform: translateY(-50%);
	padding: 50px;
	cursor: pointer;
}

.section .slide-control .left {
	left: 30px;
	background:
		url('https://yaimg.yanolja.com/joy/sunny/static/images/btn-slide-photo-prev.svg')
		center center/100% no-repeat;
}

.section .slide-control .right {
	right: 30px;
	background:
		url('https://yaimg.yanolja.com/joy/sunny/static/images/btn-slide-photo-next.svg')
		center center/100% no-repeat;
}

.section .slide-control [class*="control"] {
	display: none;
}

/* INPUT이 체크되면 변화값이 li까지 전달되는 스타일 */
.section [id="slide01"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(0%);
}

.section [id="slide02"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-100%);
}

.section [id="slide03"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-200%);
}

/*  INPUT이 체크되면 변화값이 좌우 슬라이드 버튼을 담고 있는 div 까지 전달되는 스타일 */
.section [id="slide01"]:checked ~ .slidewrap .control01 {
	display: block;
}

.section [id="slide02"]:checked ~ .slidewrap .control02 {
	display: block;
}

.section [id="slide03"]:checked ~ .slidewrap .control03 {
	display: block;
}

.roomwrap {
	margin: auto;
	width: 800px;
	height: 250px;
	border: 1px solid blue;
}
</style>
<!-- Jquery Ui CSS -->
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.min.css"
	rel="stylesheet" type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>

<!-- My JS -->
<script src="../js/script.js"></script>
<script>
	<%
		// productList에서 파라미터로 값 받아오기
		String anoNum = request.getParameter("ano");
		int ano = 0;
		if(anoNum != null){
			ano = Integer.parseInt(anoNum);
		}
		
		// dao 객체 생성
		RoomDAO roomDao = new RoomDAO();
		RoomdetailDAO rdDao = new RoomdetailDAO();
		AccomodationDAO accoDao = new AccomodationDAO();
		ReviewDAO reviewDao = new ReviewDAO();
		ConvenienceDAO conDao = new ConvenienceDAO();
		
		AccomodationVO accoVo = accoDao.selectOne(ano);
		
		ArrayList<RoomVO> roomList = roomDao.selectAllRoom(ano);
		ArrayList<ConvenienceVO> conList = conDao.selectAll(ano);

	%>
	window.onload=function(){
		var info = document.getElementsByClassName("infowrap")[0];
		var spanText = document.getElementById("infoheight");
		var infoOnBtn = document.getElementById("info-on");	
		var infoOffBtn = document.getElementById("info-off");
		
		// 숙소소개란 내용이 짦을 경우 div길이 조절 후 펼치기 버튼 display : none;
		if(spanText.offsetHeight < 100){
			info.style.height = "auto";
			infoOnBtn.style.display = "none";
		}
		
		
		// 숙소소개란 펼치기, 접기 기능
		infoOnBtn.onclick=function(){
			info.style.height = "auto";
			infoOnBtn.style.display = "none";
			infoOffBtn.style.display="inline";
		}
		
		infoOffBtn.onclick=function(){
			info.style.height="300px";
			
			infoOnBtn.style.display="inline";
			infoOffBtn.style.display = "none";
		}
		
	}
	
	$.datepicker.setDefaults({
		  dateFormat: 'yy-mm-dd',
		  prevText: '이전 달',
		  nextText: '다음 달',
		  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		  showMonthAfterYear: true,
		  yearSuffix: '년'
		});

		$(function () {
		  $('.datepicker').datepicker();
		});
		
			
</script>
<body>
	<div class="container">
		<div class="section">
			<input type="radio" name="slide" id="slide01" checked /> <input
				type="radio" name="slide" id="slide02" /> <input type="radio"
				name="slide" id="slide03" />
			<div class="slidewrap">
				<ul class="slidelist" >
				<%
					
				%>
					<li>
						<a>
							<img src="<%=accoVo.getAimage() %>" alt="" />
						</a>
					</li>
					<li>
						<a>
							<img src="//image.goodchoice.kr/resize_490x348/affiliate/2021/12/09/61b1c500af4b9.jpg" alt="" />
						</a>
					</li>
					<li>
						<a>
							<img src="//image.goodchoice.kr/resize_1000X500x0/affiliate/2021/05/03/608f8eb4a9bbe.jpg" alt="" />
						</a>
					</li>
				</ul>
				<!-- 좌우 슬라이드 버튼 -->
				<div class="slide-control">
					<div class="control01">
						<label for="slide03" class="left"></label> <label for="slide02"
							class="right"></label>
					</div>
					<div class="control02">
						<label for="slide01" class="left"></label> <label for="slide03"
							class="right"></label>
					</div>
					<div class="control03">
						<label for="slide02" class="left"></label> <label for="slide01"
							class="right"></label>
					</div>
				</div>
			</div>
		</div> 
		<div class="maininfo">
			<%=accoVo.getAtype() %>
			<h2><%=accoVo.getAname() %></h2>
			<!-- 별표시 코드 옮겨왔는데 css부분은 제가 건드리면 안될것 같아서 그 부분은 빼고 옮겼습니다..! -->
			<%
					int star = (int)Math.floor(accoDao.selectAvgStar(accoVo.getAtype(), ano));
					float remainder = accoDao.selectAvgStar(accoVo.getAtype(), ano) % 1;

					for (int j = 1; j <= star; j++) {
					%>

					<i class="bi bi-star-fill text-warning"></i>

					<%
					}
					if (remainder != 0) {
					%>

					<i class="bi bi-star-half text-warning"></i>

					<%
					}
					%>
					<%=accoDao.selectAvgStar(accoVo.getAtype(), ano) %>
			<br>후기 <%=reviewDao.getCountOne(ano) %>개
		
		</div>
		<div class="calendar">
			<input type="text" id="checkin" name="checkin" value="체크인" class="w-25" /> 
			<input type="text" id="checkout" name="checkout" value="체크아웃" class="w-25" />
		</div>
		<%
			for(RoomVO vo : roomList){
				ArrayList<RoomdetailVO> rdList = rdDao.select(vo.getRno());	
		%>
		<a href="customerBooking.jsp?rno=<%=vo.getRno()%>&ano=<%=vo.getAno()%>">
		<div class="roomwrap">
			<div class="imgwrap">
		<%
				for(int i=0; i<rdList.size();i++){
		%>
					<img src="<%=rdList.get(i).getRimage()%>" alt="" id="roomimg" />
		<%
				}
		%>
			</div>
			<div class="detailleft" >
				<h2><%=vo.getRtype() %></h2>
				<h2>최대 <%=vo.getRpeople() %>인</h2>
			</div>
			<div class="detailright">
				<span>판매가 <%=vo.getPrice() %>원</span>
				<h4>남은객실 <%=vo.getRcount() %></h4> 
				<h5><%=vo.getDiscount() %>% 할인가</h5>
				<h3><%=Math.round(vo.getPrice()*(1-vo.getDiscount()*0.01)) %>원</h3>
			</div>
		</div>
		</a>
		<%
			}
		%>
		
		<div class="infobox">
			<div class="infowrap">
				<h2>숙소소개</h2>
				<span id="infoheight"><%=accoVo.getAdetail() %></span>
			</div>
			<button id="info-on">펼치기</button>
			<button id="info-off">접기</button>
		</div> 
		<div class="conveniencebox">
		<%
			for(ConvenienceVO vo : conList){
				String src = "";
				if(vo.getCoption().equals("냉장고")){src = "refrigerator";}
				else if(vo.getCoption().equals("흡연구역")){src = "smokingarea";}
				else if(vo.getCoption().equals("WIFI")){src = "wifi";}
				else if(vo.getCoption().equals("24H")){src = "24h";}
				else if(vo.getCoption().equals("주차가능")){src = "parking";}
				else if(vo.getCoption().equals("수영장")){src = "swim";}
				else if(vo.getCoption().equals("짐보관")){src = "baggage";}
				else if(vo.getCoption().equals("레스토랑")){src = "restaurant";}
				else if(vo.getCoption().equals("금연객실")){src = "nosmoke";}
		%>
			<div class="conwrap">
				<div class="conimgwrap">
					<img src="../image/<%=src%>.png" alt="" width="65px"/>
					<span><%=vo.getCoption() %></span>
					
				</div>
			</div>
		<%
			}
			request.setCharacterEncoding("UTF-8");
			
		%>
		</div>
		<!-- include로 kakaoMap.jsp 불러오기 -->
		<jsp:include page="kakaoMap.jsp" >
			<jsp:param value="<%=accoVo.getAaddress() %>" name="aaddress"/>
			<jsp:param value="<%=accoVo.getAname() %>" name="aname"/>
		</jsp:include>

		<!-- include로 productReview.jsp 불러오기 -->
		<jsp:include page="productReview.jsp" >
			<jsp:param value="<%=accoVo.getAno() %>" name="ano"/>
		</jsp:include>
		

	</div>
	<%
		roomDao.close();
		conDao.close();
		rdDao.close();
		reviewDao.close();
		accoDao.close();
	%>
</body>
</html>