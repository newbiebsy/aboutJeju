<%@page import="dao.CustomerDAO"%>
<%@page import="vo.CustomerVO"%>
<%@page import="vo.OwnerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<!-- 시각 장애인이나 다른 보조 수단을 통해 정보에 접근해야 할 경우
주언어가 명시되어 있으면 해당 언어에 알맞게 번역(점자, 소리)되어 올바른 해석으로 정보전달 할 수 있음 -->
<html lang="ko">

<head>
<meta charset="utf-8">
<!--  뷰포트 메타 태그가 없으면 휴대기기는 페이지를 일반적인 데스크톱 화면 너비로 렌더링한 다음 페이지를 축소하여 읽기 어렵게 만듭니다.
뷰포트 메타 태그를 설정하면 뷰포트의 너비와 크기를 제어하여 모든 기기에서 올바른 크기로 조정할 수 있음 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--  -->
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- Bootstrap icon CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css" />

<!-- My CSS -->
<link rel="stylesheet" href="../css/style.css">
<title>ABOUT JEJU</title>

<!-- JQUERY -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
 
<!-- ajax -->
<script src="../js/httpRequest.js"></script>
<script>
	/* window.onload=function(){
		
		var test = document.getElementById("btn");
		test.onclick=test3;
	}
	
	function test3(){
		alert("수정되었습니다.");
	}
	<!-- 비밀번호 입력, 비밀번호 재입력부분 비밀번호 길이 8~20자 조건걸기,
	 비밀번호 입력, 비밀번호 재입력, 비밀번호 찾기 답, 이름 빈칸이면 수정안되게끔
	  --> 
	function chkPW(){

		 var pw = $("#inputPw").val();
		 var num = pw.search(/[0-9]/g);
		 var eng = pw.search(/[a-z]/ig);

		 if(pw.length < 8 || pw.length > 20){
		  alert("8자리 ~ 20자리 이내로 입력해주세요.");
		  return false;
		 }else if(pw.search(/\s/) != -1){
		  alert("비밀번호는 공백 없이 입력해주세요.");
		  return false;
		 }else {
			// console.log("통과"); 
		    return true;
		 }

		} */
	// 010-1111-2222 형식으로 db에 저장되게끔
	//$(document).ready(function() {
        
	//	  var test = "${customerVO.cphone}";
	//	  var testDate = test.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
		  
	//	  $("#cphone").text(testDate);
		 
	//});
</script>
</head>

<!-- ?? -->
<body class="customerModify">
	<jsp:include page="loginHeader.jsp" />
	
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
		<form action="customerModifyOk.jsp" class="col-10 col-sm-8 col-lg-6 col-xl-4" id="signUpfrm">
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
				<a href="drop.jsp" class="btn btn-secondary m-3 px-4" role="button"><i class="bi bi-x-lg"></i> 회원탈퇴</a> 
				<!-- <a class="btn btn-primary m-3 px-4 submit"><i class="bi bi-check-lg"></i> --> <input type="submit" class="btn btn-primary m-3 px-4" value="수정" id="btn" />
			</div>
		</form>
		<div class="col-1 col-sm-2 col-lg-3 col-xl-4"></div>
	</div>

	<!--  -->
	<!-- Bootstrap Bundle with Popper -->
	<script src=" https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
		
	</script>

	<!-- My JS -->
	<script src="../js/script.js"></script>
	
</body>

</html>

