<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
  // 페이지 로드 후 화면을 중간으로 이동
  window.onload = function() {
    // 페이지 높이의 50% 위치로 스크롤
    const middlePosition = document.body.scrollHeight / 2.7;
    window.scrollTo({
      top: middlePosition,
      behavior: "smooth" // 부드러운 스크롤 효과
    });
  };
</script>
<div class="col-sm-12">

  <!-- 상단 버튼 그룹 -->
  <div class="row" style="background-color: #000; height: 50px;"></div>
  <div class="btn-group">
    <button type="button" class="btn1"
            onclick="location.href='<c:url value="/qna"/>'">문의</button>
    <button type="button" class="btn2"
            onclick="location.href='<c:url value="/qna/reservation"/>'">예약</button>
    <button type="button" class="btn3"
            onclick="location.href='<c:url value="/qna/history"/>'">나의 예약내역</button>
  </div>

  <!-- 예약 내역 카드 -->
  <div class="card" style="max-width: 800px; margin: 0 auto; padding: 20px;">
    <div class="card-body">
      <h3 class="card-header text-center" style="background-color: #1a1a1a; color: white; padding: 10px; border-radius: 5px;">
        예약내역
      </h3>

      <!-- 예약 내역 테이블 -->
      <table class="table table-bordered table-hover" style="margin-top: 20px;">
        <thead class="thead-dark">
        <tr>
          <th>예약번호</th>
          <th>성함</th>
          <th>전화번호</th>
          <th>예약내용</th>
          <th>방문 날짜</th>
          <th>예약상태</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${reservations}">
          <tr>
            <td>${c.reservationNo}</td>
            <td>${c.custName}</td>
            <td>${c.custPhone}</td>
            <td>${c.reservationContent}</td>
            <td><fmt:formatDate value="${c.reservationDate}" pattern="yyyy-MM-dd HH:mm" /></td>
            <td>${c.reservationState}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>

  <!-- 스타일 추가 -->
  <style>

    body{
      background-color: #000000;
    }
    /* 카드 스타일 */
    .card {
      max-width: 800px; /* 카드 최대 너비 */
      margin: 20px auto; /* 중앙 정렬 */
      padding: 20px; /* 내부 여백 */
    }

    /* 테이블 스타일 */
    .table {
      width: 100%; /* 테이블 너비 */
      margin-top: 20px; /* 상단 여백 */
    }

    .thead-dark th {
      background-color: #343a40; /* 테이블 헤더 색상 */
      color: white;
    }

    .table-bordered {
      border: 1px solid #ddd; /* 테이블 테두리 */
    }

    .table-hover tbody tr:hover {
      background-color: #f5f5f5; /* 행에 마우스오버 효과 */
    }

    /* 버튼 그룹 스타일 */
    .btn-group {
      width: 30%;
      display: flex;
      justify-content: space-between;
      margin: 0 auto; /* 가로로 중앙 정렬 */
      margin-bottom: 15px;
      box-sizing: border-box;
    }

    /* 버튼 그룹 스타일 */
    .btn-group {
      width: 30%;
      display: flex;
      justify-content: space-between;
      margin: 0 auto; /* 가로로 중앙 정렬 */
      margin-bottom: 15px;
      box-sizing: border-box;
    }

    .btn1 {

      width: 30%;  /* 버튼 너비 설정 */
      margin: 0 5px; /* 버튼 간격 설정 */

      padding: 12px 20px;
      background-color: #ae00c7;
      color: white;
      border: none;
      border-radius: 20px;
      cursor: pointer;
      font-size: 1em;
      font-weight: bolder;
    }
    .btn1:hover {
      background-color: #85009e;
    }
    .btn2 {

      width: 30%;  /* 버튼 너비 설정 */
      margin: 0 5px; /* 버튼 간격 설정 */

      padding: 12px 20px;
      background-color: #ae00c7;
      color: white;
      border: none;
      border-radius: 20px;
      cursor: pointer;
      font-size: 1em;
      font-weight: bolder;
    }
    .btn2:hover {
      background-color: #85009e;
    }
    .btn3 {

      width: 30%;  /* 버튼 너비 설정 */
      margin: 0 5px; /* 버튼 간격 설정 */

      padding: 12px 20px;
      background-color: #ae00c7;
      color: white;
      border: none;
      border-radius: 20px;
      cursor: pointer;
      font-size: 1em;
      font-weight: bolder;
    }
    .btn3:hover {
      background-color: #85009e;
    }

  </style>

</div>
