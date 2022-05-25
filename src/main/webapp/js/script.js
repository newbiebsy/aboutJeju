$(function() {
	$("#checkin").datepicker({ minDate: 0, dateFormat: "yy-mm-dd" });
	$("#checkout").attr("disabled", "disabled");
	$("#checkout").datepicker({ minDate: 0, dateFormat: "yy-mm-dd" });

	$("#checkin").on("change", onCheckin);
	$("#headerfrm>i").on("click", onSubmit);

	$(".header #menu-btn").on("click", showOffCanvasMenu);
	$(".mypage .btn-close").on("click", closeOffCanvasMenu)
	$(".mypage a").on("click", selected);

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


