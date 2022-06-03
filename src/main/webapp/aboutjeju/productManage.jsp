<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
<style>
img {
	height: 50px;
	weight: 50px;
}

input[type="text"] {
	width: 300px;
}

.title {
	width: 100px;
}
</style>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	window.onload = function() {
		var btn = document.getElementById("btn");
		btn.onclick = openKaKao;
		
		var btn2 = document.getElementById("btn2");
		btn2.onclick=function(){
			alert("수정이 완료되었습니다");
			
			var frm = document.frm;
			frm.action="productManageOk.jsp";
			frm.submit();
		}
	}

	function openKaKao() {
		new daum.Postcode({
			oncomplete : function(data) {
				console.dir(data);
				document.getElementById("addrs").value = data.roadAddress;
				document.getElementById("detailaddrs").focus();
			}

		}).open();

	}
	
	
	function read(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('preview').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}else{
			document.getElementById('preview').src="";
		}
	}
</script>
</head>
<body>
	<jsp:include page="mypageHeader.jsp" />
	<div class="container-fluid mypage mt-4">
		<div class="row">
			<jsp:include page="mypageSidebarH.jsp" />
			<!--제원님은 이부분만 mypageSidebarH.jsp 로 변경해서 연결하시면 됩니다  -->

			<div class="col-md-9">

	<form name="frm" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td class="title">숙소 이름</td>
				<td><input type="text" name="title" id="" /></td>
			</tr>
			<tr>
				<td class="title">숙소 종류</td>
				<td>
					<div>
						<input type="radio" name="detail" id="" value="호텔" />호텔 <img
							src="../image/hotel.png" alt="" /> 
							<input type="radio"
							name="detail" id="" value="모텔"/>
							모텔 <img src="../image/motel.png" alt="" />

						<input type="radio" name="detail" id="" value="게스트하우스"/>게스트 하우스 <img
							src="../image/guesthouse.png" alt="" /> <input type="radio"
							name="detail" id="" value="펜션"/>펜션 <img src="../image/pension.png" alt="" />
					</div>
				</td>
			</tr>
			<tr>
				<td class="title">주소</td>
				<td><input type="text" name="addrs1" id="addrs" /> <input
					type="button" value="주소검색" id="btn" /></td>
			</tr>
			<tr>
				<td class="title">상세주소</td>
				<td><input type="text" name="addrs2" id="detailaddrs"
					placeholder="상세주소를 입력하세요" /></td>
			</tr>
			<tr>
				<td class="title">전화번호</td>
				<td><input type="text" name="phone" id="" /></td>
			</tr>
			<tr>
				<td class="title">편의사항</td>
				<td>
					<div>
						<input type="checkbox" name="convenience" id="" />주차가능
							<img src="../image/parking.png" alt="parking" /> 
						<input type="checkbox" name="con0venience" id="" />수영장 
							<img src="../image/swim.png" alt="swim" /> 
						<input type="checkbox" name="convenience" id="" />냉장고 
							<img src="../image/refrigerator.png" alt="refrigerator" /> 
						<input type="checkbox" name="convenience" id="" />짐보관 
							<img src="../image/baggage.png" alt="baggage" /> 
						<input type="checkbox" name="convenience" id="" />24H 
							<img src="../image/24h.png" alt="24h" /> <br /> 
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
				<td><input type="file" name="filename" onchange="read(this);"
					multiple="multiple" /></td>
					<td><img src="" alt="" id="preview" /></td>
			
			</tr>
			<tr>
				<td class="title">숙소소개</td>
				<td><textarea name="adetail" id="" cols="30" rows="10"></textarea></td>
			</tr>
		</table>
		<input type="button" value="수정" id="btn2" />

	</form>
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