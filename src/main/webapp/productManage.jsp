<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productManage</title>
<style>
	img{
		height : 50px;
		weight : 50px;
	}
	input[type="text"]{
	 	width : 300px;
	 	
	}
	.title{
		width:100px;
	}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload=function(){
	var btn = document.getElementById("btn");
	btn.onclick=openKaKao;
}
	
	function openKaKao(){
		new daum.Postcode({
			oncomplete: function(data){
				console.dir(data);
				document.getElementById("addrs").value=data.roadAddress;
				document.getElementById("detailaddrs").focus();
			}
		
		}).open();
		
	}

</script>
</head>
<body>
	<form action="productManageOk.jsp" name="frm" method="post" encytpe="multipart/form-data">
		<table>
			<tr>
				<td class="title">숙소 이름</td>
				<td><input type="text" name="" id="" /></td>
			</tr>
			<tr>
				<td class="title">숙소 종류</td>
				<td>
				<div>
					<input type="radio" name="detail" id="" />호텔
					<img src="../image/hotel.png" alt="" />
				
					<input type="radio" name="detail" id="" />모텔
					<img src="../image/motel.png" alt="" />
				
					<input type="radio" name="detail" id="" />게스트 하우스
					<img src="../image/guesthouse.png" alt="" />
				
					<input type="radio" name="detail" id="" />펜션
					<img src="../image/pension.png" alt="" />
				</div>
				</td>
			</tr>
			<tr>
				<td class="title">주소</td>
				<td>
					<input type="text" name="" id="addrs" />
					<input type="button" value="주소검색" id="btn"/>
				</td>	
			</tr>
			<tr>
				<td class="title">상세주소</td>
				<td><input type="text" name="" id="detailaddrs" placeholder="상세주소를 입력하세요"/></td>
			</tr>	
			<tr>
				<td class="title">전화번호</td>
				<td><input type="text" name="" id="" /></td>
			</tr>
			<tr>
				<td class="title">편의사항</td>
				<td>
					<div>
						<input type="checkbox" name="convenience" id="" />주차가능
						<img src="../image/parking.png" alt="parking" />
						
						<input type="checkbox" name="convenience" id="" />수영장
						<img src="../image/swim.png" alt="swim" />
						
						<input type="checkbox" name="convenience" id="" />냉장고
						<img src="../image/refrigerator.png" alt="refrigerator" />
						
						<input type="checkbox" name="convenience" id="" />짐보관
						<img src="../image/baggage.png" alt="baggage" />
						
						<input type="checkbox" name="convenience" id="" />24H
						<img src="../image/24h.png" alt="24h" />
						<br />
						<input type="checkbox" name="convenience" id="" />레스토랑
						<img src="../image/restaurant.png" alt="restaurant" />
						
						<input type="checkbox" name="convenience" id="" />WIFI
						<img src="../image/wifi.png" alt="wifi" />
						
						<input type="checkbox" name="convenience" id="" />금연객실
						<img src="../image/nosmoke.png" alt="nosmoke" />
						
						<input type="checkbox" name="convenience" id="" />흡연구역
						<img src="../image/smokingarea.png" alt="smokingarea" />
					</div>
				</td>
			</tr>
			<tr>
				<td class="title">대표사진</td>
				<td><input type="file" name="filename[]" id="" multiple="multiple"/></td>
			</tr>
		</table>
	
	
	</form>

</body>
</html>