$(function() {
	$("#checkin").datepicker({ minDate: 0, dateFormat: "yy-mm-dd" });
	$("#checkout").attr("disabled", "disabled");
	$("#checkout").datepicker({ minDate: 0, dateFormat: "yy-mm-dd" });

	$("#checkin").on("change", onCheckin);
	$("#headerfrm>i").on("click", onSubmit);

	$(".header #menu-btn").on("click", showOffCanvasMenu);
	$(".mypage .btn-close").on("click", closeOffCanvasMenu)
	$(".mypage a").on("click", selected);

	$("#idFindSubmit").on("click", function() {
		if ($("#inputName").val() == "") {
			alert("이름을 입력해주세요");
			$("#inputName").focus();
			return;
		} else if ($("#inputPhone").val() == "") {
			alert("전화번호를 입력해주세요");
			$("#inputPhone").focus();
			return;
		}
		$("#idfrm").submit();
	});

	$("#pwFindSubmit").on("click", function() {
		if ($("#inputId").val() == "") {
			alert("아이디를 입력해주세요");
			$("#inputId").focus();
			return;
		} else if ($("#inputAnswer").val() == "") {
			alert("비밀번호 찾기 답을 입력해주세요");
			$("#inputAnswer").focus();
			return;
		}
		$("#pwfrm").submit();
	});

	$(".changePw #inputRePw, .changePw #inputPw").on("keyup", checkPw);
	$(".changePw .submit").on("click", changePw);

	fillZero();
	$(".write .submit").on("click", writeReview);

});

function onCheckin() {
	if ($("#checkin").val() !== "") {
		$("#checkout").removeAttr("disabled");
		var dateMin = $("#checkin").datepicker("getDate");
		var rMin = new Date(
			dateMin.getFullYear(),
			dateMin.getMonth(),
			dateMin.getDate() + 1
		);
		$("#checkout").datepicker("option", "minDate", new Date(rMin));
	}
}

function onSubmit() {
	$("#headerfrm").submit();
}

function showOffCanvasMenu() {
	$(".mypage>div>.col-md-3, .mypage>div>div>.btn-close").removeClass("d-none").addClass("position-absolute");
}

function closeOffCanvasMenu() {
	$(".mypage>div>.col-md-3, .mypage>div>div>.btn-close").addClass("d-none").removeClass("position-absolute");
}

function selected() {
	$(".mypage a").removeClass("selected");
	$(this).addClass("selected");
}

var msg = $(".changePw .checkPwMsg");
var pw = $(".changePw #inputPw");
var repw = $(".changePw #inputRePw");

function checkPw() {
	if (pw.val() != repw.val()) {
		msg.html("동일한 암호를 입력하세요.").css("color", "red");
	} else {
		msg.html("암호가 확인되었습니다.").css("color", "green");
	}
}

function changePw() {
	if (pw.val().length < 8 || pw.val().length > 20) {
		alert("비밀번호의 길이는 8~20자 이어야 합니다.");
		pw.focus();
		return;
	} else if (pw.val() != repw.val()) {
		alert("동일한 암호를 입력하세요.");
		repw.focus();
		return;
	}

	$(".changePw #changePwfrm").submit();
}

function fillZero() {
	var bno = $(".write .bno").text();
	var zero = "";

	for (var i = 1; i <= 9 - bno.length; i++) {
		zero += 0;
	}

	$(".write .bno").text(zero + bno);
}

function writeReview() {
	if ($("#inputTitle").val().length < 10) {
		alert("제목은 5자 이상 입력하여야 합니다");
		$("#inputTitle").focus();
		return;
	} else if ($("#inputContents").val().length < 40) {
		alert("내용은 20자 이상 입력하여야 합니다");
		$("#inputContents").focus();
		return;
	}
	
	$("#writefrm").submit();
}