<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소로 장소 표시하기</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=316afa77f138d6ac9ee33d24f461ce26&libraries=services"></script>
</head>
<body>
		<%
			request.setCharacterEncoding("UTF-8");
		
			String address = request.getParameter("aaddress");
			String name = request.getParameter("aname");
			/* System.out.println("aaddress : "+ address); */
			
		%>
	<div id="map" style="width: 800px; height: 250px; margin:auto; ">
	</div>
		<div style="width: 800px; margin:auto; "><%=address %></div>
	
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 4
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();


		// 주소로 좌표를 검색합니다
		geocoder
				.addressSearch(
						"<%=address%>" ,
						function(result, status) {
								<%-- console.log("<%=address%>"); --%>

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);
								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;"><%=name%></div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
	</script>
</body>
</html>