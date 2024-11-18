<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--내가 예약한 예약 내역만 나와야된다.--%>
<%--default로 "예약중" 이라고 표시되고 admin page에서 "예약완료" 되게끔--%>

<div class="col-sm-10">

  <h2>예약 내역 Page</h2>
  <div class="btn-group">
    <button type="button" class="btn"
            onclick="location.href='<c:url value="/qna"/>'"
            style="background-color: white; color: black; border: 1px solid #ccc;">문의</button>
    <button type="button" class="btn"
            onclick="location.href='<c:url value="/qna/reservation"/>'"
            style="background-color: white; color: black; border: 1px solid #ccc;">예약</button>
    <button type="button" class="btn"
            onclick="location.href='<c:url value="/qna/history"/>'"
            style="background-color: white; color: black; border: 1px solid #ccc;">나의 예약내역</button>
  </div>

  <table class="table">
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
    <c:forEach var ="c" items="${reservations}">
      <%--        끄집어낼곳은 custs 끄집어낼때 사용할 변수는 c--%>
      <tr>
        <td>${c.reservationNo}</td>
        <td>${c.custName}</td>
        <td>${c.custPhone}</td>
        <td>${c.reservationContent}</td>
        <td>${c.reservationDate}</td>
        <td>${c.reservationState}</td>

      </tr>

    </c:forEach>


    </tbody>
  </table>

</div>