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
</head>

<body>

	<jsp:include page="mypageHeader.jsp" />
	<div class="container-fluid mypage mt-4">
		<div class="row">
			<jsp:include page="mypageSidebarC.jsp" /> <!--제원님은 이부분만 mypageSidebarH.jsp 로 변경해서 연결하시면 됩니다  -->

			<div class="col-md-9">
			
				<!-- 이 분에 작업 작업 내용 추가하면 됨 -->
				<!-- 작업시작 -->
				Lorem ipsum dolor sit amet consectetur adipisicing elit. Nisi
				doloremque quas quo animi odio accusamus, sequi corporis iure
				provident repellendus quos, laboriosam natus fugiat voluptas vero
				consequatur, doloribus quisquam numquam.

				<!-- 작업 끝 -->
				
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