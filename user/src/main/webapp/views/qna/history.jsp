<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
  // 페이지 로드 후 화면을 중간으로 이동
  window.onload = function() {
    const middlePosition = document.body.scrollHeight / 2.7;
    window.scrollTo({
      top: middlePosition,
      behavior: "smooth"
    });
  };
</script>

<div class="reservation-container">
  <!-- 상단 버튼 그룹 -->
  <div class="btn-group">
    <button type="button" class="btn1" onclick="location.href='<c:url value="/qna"/>'">문의</button>
    <button type="button" class="btn2" onclick="location.href='<c:url value="/qna/reservation"/>'">예약</button>
    <button type="button" class="btn3" onclick="location.href='<c:url value="/qna/history"/>'">나의 예약내역</button>
  </div>

  <!-- 예약 내역 카드 -->
  <div class="card">
    <div class="card-body">
      <h3 class="card-header">예약 내역</h3>

      <!-- 예약 내역 테이블 -->
      <table class="table">
        <thead>
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
</div>

<style>
  /* 다크 테마 스타일 */
  body {
    background-color: #000000;
    color: #ffffff;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
  }

  .reservation-container {
    max-width: 900px;
    margin: 80px auto;
    padding: 20px;
    background-color: #1a1a1a;
    border-radius: 15px;
    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.4);
  }






  .card {
    background-color: #1e1e1e;
    padding: 20px;
    border-radius: 15px;
    border: 2px solid #ae00c7;
    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.5);
  }

  .card-header {
    background-color: #333333;
    color: #ffffff;
    text-align: center;
    font-size: 1.5rem;
    padding: 10px;
    border-radius: 10px;
    margin-bottom: 20px;
  }

  .table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    color: #ffffff;
  }

  .table th, .table td {
    padding: 15px;
    text-align: center;
    border: 1px solid #ae00c7;
  }

  .table th {
    background-color: #333333;
    font-weight: bold;
  }

  .table tbody tr:hover {
    background-color: #444444;
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
    background-color: #1a1a1a;
    color: white;
    border-color : #ae00c7;
    border-radius: 20px;
    cursor: pointer;
    font-size: 1em;
    font-weight: bolder;
  }

  /* 버튼 그룹 스타일 */
  .btn-group {
    width: 55%;
    height: 50px;
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
