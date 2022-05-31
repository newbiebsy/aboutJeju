<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productDetail.jsp</title>
</head>
<style>
	*{
		margin: 0;
		padding: 0;
	}
	.container{
		border: 1px solid black; 
		width: 1000px;
		margin: auto;
	}
	input{display:none;}
	
	/* 슬라이드 영역 */
	.section .slidewrap {max-width:700px;margin:50px auto;overflow:hidden;position:relative;}
	.section .slidelist {white-space:nowrap;font-size:0;}
	.section .slidelist > li {display:inline-block;vertical-align:middle;width:100%;transition:all .5s;}
	.section .slidelist > li > a {display:block;position:relative;}
	.section .slidelist > li > a > img {display:block;margin:auto; width:700px; height:350px;}

	/* 좌우로 넘기는 LABEL버튼에 대한 스타일 */
	.section .slide-control {position:absolute;top:0;left:0;z-index:10;width:100%;height:100%;}
	.section .slide-control label {position:absolute;z-index:1;top:50%;transform:translateY(-50%);padding:50px;cursor:pointer;}
	.section .slide-control .left {left:30px;background:url('https://cdn-icons.flaticon.com/png/512/2990/premium/2990156.png?token=exp=1653976556~hmac=b4cfe9c2a0ee8e71431c26a230a27150') center center / 100% no-repeat;}
	.section .slide-control .right {right:30px;background:url('https://cdn-icons.flaticon.com/png/512/2990/premium/2990162.png?token=exp=1653976556~hmac=a47e34c6ade9cadc5250e6775a527cb7') center center / 100% no-repeat;}
	.section .slide-control [class*="control"] {display:none;}
	
	/* INPUT이 체크되면 변화값이 li까지 전달되는 스타일 */
	.section [id="slide01"]:checked ~ .slidewrap .slidelist > li {transform:translateX(0%);}
	.section [id="slide02"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-100%);}
	.section [id="slide03"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-200%);}
	
	/*  INPUT이 체크되면 변화값이 좌우 슬라이드 버튼을 담고 있는 div 까지 전달되는 스타일 */
	.section [id="slide01"]:checked ~ .slidewrap .control01 {display:block;}
	.section [id="slide02"]:checked ~ .slidewrap .control02 {display:block;}
	.section [id="slide03"]:checked ~ .slidewrap .control03 {display:block;}

</style>
<body>
	<%
		
	
	
	
	
	%>
	<div class="container">
		<div class="section">
			<input type="radio" name="slide" id="slide01" checked />
			<input type="radio" name="slide" id="slide02" />
			<input type="radio" name="slide" id="slide03" />
			<div class="slidewrap">
				<ul class="slidelist" >
					<li>
						<a>
							<img src="./img/slide01.jpg" alt="" />
						</a>
					</li>
					<li>
						<a>
							<img src="//image.goodchoice.kr/resize_490x348/affiliate/2021/12/09/61b1c500af4b9.jpg" alt="" />
						</a>
					</li>
					<li>
						<a>
							<img src="//image.goodchoice.kr/resize_1000X500x0/affiliate/2021/05/03/608f8eb4a9bbe.jpg" alt="" />
						</a>
					</li>
				</ul>
				<!-- 좌우 슬라이드 버튼 -->
				<div class="slide-control">
					<div class="control01">
						<label for="slide03" class="left"></label>
						<label for="slide02" class="right"></label>
					</div>
					<div class="control02">
						<label for="slide01" class="left"></label>
						<label for="slide03" class="right"></label>
					</div>
					<div class="control03">
						<label for="slide02" class="left"></label>
						<label for="slide01" class="right"></label>
					</div>
				</div>
			</div>
		</div> 
	</div>
</body>
</html>