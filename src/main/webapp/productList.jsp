<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productList.jsp</title>
<style>
	*{
		margin: 0;
		padding: 0;
	}
	#container{
		border: 1px solid black;
		width: 1000px;
		height: 800px;
		margin: auto;
	}
	#button1{
		/* border: 1px solid blue; */
		width:800px;
		padding-left: 200px;
		margin: 50px 0;
	}
	.input1{
		margin-left: 100px;
		padding: 3px;
	}
	img{
		width: 250px;
		height: 250px;
	}
	#wrap {
		width: 250px;
		border : 1px solid darkgrey;
		margin: 2px;
		padding: 20px;
	}
</style>
</head>
<body>
	<div id="container">
		<div id="button1">
			<input type="button" value="별점순" class="input1"/>
			<input type="button" value="후기 많은 순" class="input1"/>
			<input type="button" value="가격순" class="input1"/>
		</div>
		<div id="contents">
			<div id="wrap">
				<a href="">
					<img src="//image.goodchoice.kr/resize_1000X500x0/affiliate/2018/02/09/5a7cf0570685d.jpg" alt="" />
				</a>
			</div>
		</div>
	</div>
</body>
</html>