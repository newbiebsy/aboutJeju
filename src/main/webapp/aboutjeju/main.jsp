<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>ABOUT JEJU</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"	crossorigin="anonymous" />

<!-- Bootstrap icon CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css" />

<!-- Jquery Ui CSS -->
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.min.css" rel="stylesheet" type="text/css" />

<!-- My CSS -->
<link rel="stylesheet" href="../css/style.css" />

<!-- JQUERY -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	
	<%
	%>
	
	<!-- ## 콘텐츠 - sm 에서는 한개씩 표시됨 -->
    <h5 class="mt-5 pt-4 text-center">- 추천 숙소 -</h5>    
    <div class="container-fluid">     
    	<div class="row">         
    		<div class="col-3 my-2">
    			<div class="card" style="width: 18rem">
    				<img src="../images/logo.jpg" class="card-img-top" alt="..." />
    				<div class="card-body">
    					<p class="card-text">
    						<div>숙소이름
    						<span>별점 : </span>
    						</div>
    						숙소 설명 : Some quick example text to build on the card title and make up the
    						bulk of the card's content.
    					</p>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>   
       
	<jsp:include page="footer.jsp" />

	<!-- Bootstrap Bundle with Popper -->
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>

	<!-- My JS -->
	<script src="../js/script.js"></script>
</body>
</html>