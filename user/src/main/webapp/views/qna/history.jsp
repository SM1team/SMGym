<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--내가 예약한 예약 내역만 나와야된다.--%>

<div class="col-sm-10">

  <h2>예약 내역 Page</h2>
  <table class="table">
    <thead class="thead-dark">
    <tr>
      <th>예약번호</th>
      <th>성함</th>
      <th>전화번호</th>
      <th>예약내용</th>
      <th>날짜</th>
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