<%@page import="vo.AccomodationVO"%>
<%@page import="dao.AccomodationDAO"%>
<%@page import="vo.RoomVO"%>
<%@page import="dao.RoomDAO"%>
<%@page import="vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customerBooking.jsp</title>
<style>
	*{margin: 0; padding: 0;}
	.container{width:1000px; margin:auto;}
	.productinfo{margin-top:30px; border:1px solid black;}
	.waybox{margin-top:30px; border:1px solid black;}
	.bookinfo{margin-top:30px; border:1px solid black;}
	.priceinfo{margin-top:30px; border:1px solid black;}
	.paymenttype{margin-top:30px; border:1px solid black;}
</style>
<script>
	<%
	/* 	// URL에 체크인날짜를 checkin으로 넘겨받음(기본값이 null이어야 sql 에러안남)
		String checkin = request.getParameter("checkin");
	
		// URL에 체크아웃날짜를 checkout으로 넘겨받음(기본값이 null이어야 sql 에러안남)
		String checkout = request.getParameter("checkout"); */
	
		request.setCharacterEncoding("UTF-8");
		Object obj = session.getAttribute("cvo");
		if(obj==null){
			response.sendRedirect("login.jsp");
		}else{
		CustomerVO cvo = (CustomerVO)obj;
							
		String anoStr = request.getParameter("ano");
		int ano = Integer.parseInt(anoStr);
	
		String rnoStr = request.getParameter("rno");
		int rno = Integer.parseInt(rnoStr);
		
		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
		
		// 날짜 체크하지 않고 방 클릭시 productDetail.jsp로 돌아감
		if ((checkin == "" || "".equals(checkin))||checkout == "" || "".equals(checkout)){
			response.sendRedirect("productDetail.jsp?ano="+ano+"&bn=1");
		}
		
		AccomodationDAO aDao = new AccomodationDAO();
		AccomodationVO aVo = aDao.selectOne(ano);
		RoomDAO rDao = new RoomDAO();
	 	RoomVO rVo = rDao.select(rno);
	%>
	window.onload=function(){
		var paybtn = document.getElementById("pay");
		var allcheck = document.getElementById("allcaution");
		
		paybtn.onclick=check;
		allcheck.onchange=cautioncheck;
		
	}
	
	function cautioncheck(){
		var box1 = document.getElementById("mustcaution");
		var box2 = document.getElementById("caution1");
		var box3 = document.getElementById("caution2");
		var box4 = document.getElementById("allcaution");
		
		box1.checked = "checked";
		box2.checked = "checked";
		box3.checked = "checked";
		box4.checked = "checked";
	}
	
	function check(){
		var must = document.getElementById("mustcaution");
		
		console.dir(must);
		if(!must.checked){
			alert("필수약관에 동의해주세요. ");	
		}else{
			var frm = document.frm
			frm.submit();
		}
	}
</script>
</head>
<body>
	
		<div class="container"> 
		<form action="customerBookingOk.jsp" name="frm">	 
			<input type="hidden" name="rno" value="<%=rno %>" />
			<input type="hidden" name="ano" value="<%=ano %>" />
			<input type="hidden" name="checkin" value="<%=checkin %>" />
			<input type="hidden" name="checkout" value="<%=checkout %>" />
			<div class="productinfo">
				<div class="leftinfo">
					<h4><%=aVo.getAname() %></h4>
					<h4><%=rVo.getRtype() %></h4>
					<h4>날짜<%=checkin %>~<%=checkout %></h4>
					<h4>체크인 14:00|체크아웃 11:00</h4>
				</div>
				<div class="rightinfo">
					<h4><%=Math.round(rVo.getPrice()*(1-rVo.getDiscount()*0.01)) %>원</h4>
				</div>				
			</div>
			<div class="waybox">
				<input type="radio" name="way" value="도보" checked="checked" />도보
				<input type="radio" name="way" value="차량"  />차량
			</div>
			<div class="bookinfo">
				예약자정보<br>
				성명<br>
				<input type="text" name="bname" id="" value="<%=cvo.getCname() %>" /><br>
				전화번호<br>
				<input type="text" name="bphone" id="" value="<%=cvo.getCphone() %>" />
			</div>
			<div class="priceinfo">
				금액 및 할인정보<br>
				총 예약금액 : <%=rVo.getPrice() %>
				<br>
				할인 금액 : -<%=rVo.getPrice()-(Math.round(rVo.getPrice()*(1-rVo.getDiscount()*0.01))) %>
				<br>
				결제 금액 : <%=Math.round(rVo.getPrice()*(1-rVo.getDiscount()*0.01)) %>
			</div>
			<div class="paymenttype">
				<h4>결제수단</h4>
				<input type="radio" name="payment" value="카카오페이" checked="checked" />카카오페이
				<input type="radio" name="payment" value="네이버페이" />네이버페이
				<input type="radio" name="payment" value="신용카드" />신용카드
				<input type="radio" name="payment" value="휴대폰결제" />휴대폰결제
				<input type="radio" name="payment" value="토스" />토스
				<input type="radio" name="payment" value="물물교환" />물물교환
				<input type="radio" name="payment" value="상평통보" />상평통보
			</div>
			<div class="cautionsbox">
				<h4>주의사항</h4>
				<h4>주의사항</h4>
				<h4>주의사항</h4>
				<input type="checkbox" id="allcaution" />전체 동의 <br>
				<input type="checkbox" id="mustcaution"  />[필수] 만 14세 이상 동의 <br>
				<input type="checkbox" id="caution1"  />[선택] 혜택 정보 수신 동의 <br>
				<input type="checkbox" id="caution2" />[선택] 이벤트,광고성 정보 수신을 위한 개인정보 수집 동의 <br>
			</div>
			<div class="paybox">
				<input type="button" id="pay" value="결제하기" />
			</div>
		</form>
		</div>
		<%
		}
		%>
</body>
</html>