<%@page import="vo.OwnerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
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
window.onload=function(){
	
	var btn1 = document.getElementById("modify");
	btn1.onclick=modify;
	
}
	
	function modify(){
		var pw = $("#inputRePw").val();
		var num = pw.search(/[0-9]/g);
		var frm = document.frm;
		var phoneNum = $("#inputPhone").val(); 
		var patternPhone = /01[016789][^0][0-9]{2,3}[0-9]{3,4}/;
		var str = $("#inputName").val();
		// var eng = pw.search(/[a-z]/ig);
		// console.log("test");
		// console.log(pw);
		
		// name 유효성검사
		for(var i=0; i<$("#inputName").val().length; i++){
			var chk = $("#inputName").val().substring(i,i+1);     
			if(chk.match(/[0-9]|[a-z]|[A-Z]/i)) {     	
				alert("이름을 정확히 입력해주세요");        
				return;    
			}    
			if(chk.match(/([^가-힣\x20])/i)){    
				alert("이름을 정확히 입력해주세요");       
				return;    
			}    
			if(str.search(/\s/) != -1){    	
				alert("이름을 정확히 입력해주세요");        
				return;   
			}
		}
		
		if(pw.length < 8 || pw.length > 20){
			alert("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
			return false;
		}else if(pw.search(/\s/) != -1){
		 	alert("비밀번호는 공백 없이 입력해주세요.");
		 	return false;
		}else if(!patternPhone.test(phoneNum)){
			alert('핸드폰 번호를 확인 해주세요');
			return;
		}else if( !((pw.length < 8 || pw.length > 20) && (pw.search(/\s/) != -1) && (!patternPhone.test(phoneNum))) ) {
			console.log("test");
			 alert("수정되었습니다"); 
		 	frm.action="hostModifyOk.jsp";
			frm.method="post";
			frm.submit(); 
		}else{
			alert("양식에 맞게 입력해주세요.");
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

				<%
		/* Object obj = session.getAttribute("id");
		// 로그인이 되어있다면
		String id = (String)obj;
	
		CustomerDAO dao = new CustomerDAO();
		CustomerVO vo = dao.selectOne(id); */
		
		Object obj = session.getAttribute("ovo");
		OwnerVO ovo = (OwnerVO)obj;
	
		
		
	%>
	
	<div class="row my-5">
		<div class="col-1 col-sm-2 col-lg-3 col-xl-4"></div>
		<!-- 수정 버튼 누르면 customerModifyOk.jsp으로 이동 -->
		
		
		<form name="frm" class="col-10 col-sm-8 col-lg-6 col-xl-4" id="signUpfrm" enctype="multipart/form-data">
			<h4 class="mb-4 fw-bold text-center">내 정보 수정</h4>
			<div class="mb-3 row">
				<label for="inputId" class="col-form-label col-4">아이디</label>
				<div class="col-8">
					<!-- readonly는 disabled처럼 입력은 비활성화 되지만 폼으로 전송 가능 -->
					<input type="text" class="form-control" id="inputId" placeholder="<%=ovo.getOid() %>" readonly> 
					<input type="hidden" name="inputId" value="<%=ovo.getOid() %>" />
					<div class="checkIdMsg mt-2"></div>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputId" class="col-form-label col-4">사업자번호</label>
				<div class="col-8">
					<!-- readonly는 disabled처럼 입력은 비활성화 되지만 폼으로 전송 가능 -->
					<input type="text" class="form-control" id="inputOno" placeholder="<%=ovo.getOno() %>" readonly> 
					<input type="hidden" name="inputId" value="<%=ovo.getOno() %>" />
					<div class="checkIdMsg mt-2"></div>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputPw" class="col-form-label col-4">비밀번호 입력</label>
				<div class="col-8">
					<input type="password" class="form-control" name="inputPw" id="inputPw" placeholder="비밀번호 길이 8~20자">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputRePw" class="col-form-label col-4">비밀번호 재입력</label>
				<div class="col-8">
					<input type="password" class="form-control" name="inputRePw" id="inputRePw">
					<div class="checkPwMsg mt-2"></div>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputQuestion" class="col-form-label col-4">비밀번호 찾기 질문</label>
				<div class="col-8">
					<select class="form-select" name="inputQuestion" id="inputQuestion">
						<%
							if(ovo.getOfindpw().equals("아버지의 성함은?")){
						%>
						<option value="아버지의 성함은?" selected="selected">아버지의 성함은?</option>
						<option value="어머니의 성함은?">어머니의 성함은?</option>
						<option value="부모님의 고향은?">부모님의 고향은?</option>
						<option value="출신 초등학교는?">출신 초등학교는?</option>
						<option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
						<%	
							}
						%>
						<%
							if(ovo.getOfindpw().equals("어머니의 성함은?")){
						%>
						<option value="어머니의 성함은?">어머니의 성함은?</option>
						<option value="아버지의 성함은?">아버지의 성함은?</option>
						<option value="부모님의 고향은?">부모님의 고향은?</option>
						<option value="출신 초등학교는?">출신 초등학교는?</option>
						<option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
						<%	
							}
						%>
						<%
							if(ovo.getOfindpw().equals("부모님의 고향은?")){
						%>
						<option value="부모님의 고향은?">부모님의 고향은?</option>
						<option value="아버지의 성함은?">아버지의 성함은?</option>
						<option value="어머니의 성함은?">어머니의 성함은?</option>
						<option value="출신 초등학교는?">출신 초등학교는?</option>
						<option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
						<%	
							}
						%>
						<%
							if(ovo.getOfindpw().equals("출신 초등학교는?")){
						%>
						<option value="출신 초등학교는?">출신 초등학교는?</option>
						<option value="아버지의 성함은?">아버지의 성함은?</option>
						<option value="어머니의 성함은?">어머니의 성함은?</option>
						<option value="부모님의 고향은?">부모님의 고향은?</option>
						<option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
						<%	
							}
						%>
						<%
							if(ovo.getOfindpw().equals("가장 기억에 남는 선생님 성함은?")){
						%>
						<option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
						<option value="아버지의 성함은?">아버지의 성함은?</option>
						<option value="어머니의 성함은?">어머니의 성함은?</option>
						<option value="부모님의 고향은?">부모님의 고향은?</option>
						<option value="출신 초등학교는?">출신 초등학교는?</option>
						<%	
							}
						%>
					</select>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputAnswer" class="col-form-label col-4">비밀번호 찾기 답</label>
				<div class="col-8">
					<input type="text" class="form-control" name="inputAnswer" id="inputAnswer" placeholder="">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputName" class="col-form-label col-4">이름</label>
				<div class="col-8">
					<input type="text" class="form-control" name="inputName" id="inputName" placeholder="<%=ovo.getOname() %>">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputPhone" class="col-form-label col-4">휴대전화</label>
				<div class="col-5">
					<input type="number" name="inputPhone" class="form-control w-100" id="inputPhone" placeholder="<%=ovo.getOphone() %>">
				</div>
				<div class="col-3 text-end">
					<button type="button" class="btn btn-outline-primary w-100">인증하기</button>
				</div>
			</div>
			<div class="mt-4 text-center">
				<a href="ownerDrop.jsp" class="btn btn-secondary m-3 px-4" role="button"><i class="bi bi-x-lg"></i> 회원탈퇴</a> 
				<!-- <a class="btn btn-primary m-3 px-4 submit"><i class="bi bi-check-lg"></i> --><!--  <input type="button" class="btn btn-primary m-3 px-4" value="수정" id="modify" /> -->
				<input type="button" value="수정" id="modify" class="btn btn-primary m-3 px-4"/>
			</div>
		</form>
		<div class="col-1 col-sm-2 col-lg-3 col-xl-4"></div>
	</div>


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