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

<script>
window.onload = function() {
/* 	var cancle = document.getElementById("cancle");
	cancle.onclick =function(){
		
			var frm = document.frm;
			frm.action="roomManage.jsp";
			frm.submit();
		}
	 */
 	
	var cancle1 = document.getElementById("cancle");
	cancle1.onclick=cancleRoom;
		
	
	} 
	
	function addRoom(x){
		
		var frm2 = x.form;
		frm2.action="addRoomOk.jsp";
		frm2.method="post";
		frm2.submit();  
	}
	
	function cancleRoom(){
		var frm = document.frm;
		frm.action="roomManage.jsp";
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
</head>
<body>
	<jsp:include page="mypageHeader.jsp" />
	<div class="container-fluid mypage mt-4">
		<div class="row">
			<jsp:include page="mypageSidebarH.jsp" />
		

			<div class="col-md-9">

	<form name="frm"  enctype="multipart/form-data">
	<p>방 종류: <input type="text" name="type" id="type" /></p>
	<p>방 갯수: <input type="text" name="count"  /></p>
	<p>가격 : <input type="text" name="price"  />
	   할인율: <input type="text" name="discount" />%
	</p>
	
	<p>수용가능 인원: <input type="text" name="people"  /></p>
	<p>방 사진: <input type="file" name="filename" id="" onchange="read(this)"/>
	<input type="file" name="filename2" id="" onchange="read2(this)"/><br />
	<img src="" alt="" id="preview" />
	<img src="" alt="" id="preview2" />
	</p>
	<input type="button" value="취소" id="cancle"/>
	<input type="button" value="추가" id="" onclick="addRoom(this);"/>
	</form>
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