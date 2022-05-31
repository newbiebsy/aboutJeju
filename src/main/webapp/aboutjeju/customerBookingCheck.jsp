<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.BookVO"%>
<%@page import="vo.CustomerVO"%>
<%@page import="dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!doctype html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
</head>

<body class="mypage">
	<jsp:include page="mypageHeader.jsp" />

	<div class="container-fluid mt-4">
		<div class="row">
			<jsp:include page="mypageSidebarC.jsp" />

			<div class="col-md-9 contents">

				<%
				request.setCharacterEncoding("UTF-8");
				String cp = request.getParameter("cp");

				int currentPage = 1;

				if (cp != null) {
					currentPage = Integer.parseInt(cp);
				}

				int startNo = (currentPage - 1) * 10;

				Object obj = session.getAttribute("vo");
				CustomerVO cvo = (CustomerVO) obj;
				int cno = cvo.getCno();
				// int cno = 0;

				BookDAO bdao = new BookDAO();
				ArrayList<BookVO> list = bdao.customerBookingData(cno, startNo);
				System.out.println(list.size());

				DecimalFormat df = new DecimalFormat("###,###");

				if (list.size() == 0) {
				%>

				<h3 class="pb-5 h-50 d-flex justify-content-center align-items-end">예약 내역이 없습니다.</h3>

				<%
				} else {
				for (BookVO bvo : list) {
				%>

				<div class="card mb-3 mx-auto" style="max-width: 650px;">
					<div class=" row g-0 border-1 border-bottom">
						<div class="col-md-4">
							<img src="<%=bvo.getAimage()%>" class="img-fluid rounded-start" alt="<%=bvo.getAname()%>">
						</div>
						<div class="col-md-8">
							<div class="card-body row pb-0">
								<div class="col-6">
									<h5 class="card-title"><%=bvo.getAname()%></h5>
									<p><%=bvo.getRtype()%></p>
								</div>
								<div class="col-6">
									<div class="row">
										<div class="col-6 text-center border-1 border-end">
											체크인<br />
											<%=bvo.getBsdate()%>
										</div>
										<div class="col-6 text-center">
											체크아웃</br>
											<%=bvo.getBedate()%>
										</div>
										<p class="fs-4 fw-bold text-end pt-4 mb-0">
											￦
											<%=df.format(bvo.getBprice())%></p>
									</div>
								</div>
							</div>
						</div>
						<div class="d-flex">
							<a href="write.jsp" class="me-auto ps-3 pt-3">이용후기 작성하기</a> <a href="customerBookingDetail.jsp" class="btn btn-secondary m-2" href="#"
								role="button">자세히보기</a>
						</div>
					</div>
				</div>

				<%
				}

				int totalCount = bdao.getTotalCount(cno);
				int totalPage = (totalCount % 10 == 0) ? (totalCount / 10) : (totalCount / 10 + 1);
				int startPage = currentPage;
				int endPage = startPage + 2;

				if (currentPage + 2 >= totalPage) {
				endPage = totalPage;
				}

				if (totalPage <= 3) {
				startPage = 1;
				}
				%>

				<!-- 페이지 -->
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center mt-5">
						<%
						if (currentPage > 1) {
						%>

						<li class="page-item"><a class="page-link"
							href="costomerBookingCheck.jsp?cno=<%=cno%>&cp=<%=(currentPage - 5 < 1) ? 1 : (currentPage - 5)%>" aria-label="Previous" title="5페이지 앞으로"><span
								aria-hidden="true">&laquo;</span></a></li>

						<%
						}

						for (int i = startPage; i <= endPage; i++) {
						if (i == currentPage) {
						%>

						<li class="page-item"><a class="page-link bg-primary text-white" href="costomerBookingCheck.jsp?cno=<%=cno%>&cp=<%=i%>"><%=i%></a></li>

						<%
						} else {
						%>

						<li class="page-item"><a class="page-link" href="costomerBookingCheck.jsp?cno=<%=cno%>&cp=<%=i%>"><%=i%></a></li>

						<%
						}
						}

						if (currentPage + 2 < totalPage) {
						%>
						<li class="page-item"><a class="page-link"
							href="costomerBookingCheck.jsp?cno=<%=cno%>&cp=<%=(currentPage + 5 > totalPage) ? (totalPage) : (currentPage + 5)%>" aria-label="Next"
							title="5페이지 뒤로"> <span aria-hidden="true">&raquo;</span>
						</a></li>
						<%
						}
						}
						%>
					</ul>
				</nav>


			</div>
		</div>
	</div>

	<!-- Bootstrap Bundle with Popper -->
	<script src=" https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
		
	</script>

	<!-- My JS -->
	<script src="../js/script.js"></script>
</body>

</html>