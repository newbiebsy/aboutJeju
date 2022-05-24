<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- ## 헤더 -->
  <div class="container-fluid mt-4">
    <div class="row header">
      <div>
        <a href="main.jsp"><img src="../images/logo.jpg" alt="ABOUT JEJU" class="ps-2"></a>
      </div>
      <div class="dropdown text-end position-absolute w-25">
        <i class="bi bi-person-circle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
          aria-expanded="false"></i>
        <ul class="dropdown-menu shadow" aria-labelledby="dropdownMenuButton1">
          <li><a class="dropdown-item" href="#">마이페이지</a></li>
          <li><a class="dropdown-item" href="#">예약내역</a></li>
          <li>
            <hr class="dropdown-divider">
          </li>
          <li><a class="dropdown-item" href="logout.jsp">로그아웃</a></li>
        </ul>
      </div>
      <div class="d-flex justify-content-center">
        <form action="productList.jsp" id="headerfrm" class="rounded-pill mt-4 h-75">
          <i class="bi bi-search rounded-pill float-end mt-1 p-2 fs-5"></i>
          <div id="headerinput" class="btn-group h-100" role="group" aria-label="Basic example">
            <input type="search" id="search" name="search" value="" class="w-50 ps-3" placeholder="검색어 입력">
            <input type="text" id="checkin" name="checkin" placeholder="체크인" class="w-25" />
            <input type="text" id="checkout" name="checkout" placeholder="체크아웃" class="w-25" />
          </div>
        </form>
      </div>
    </div>
  </div>