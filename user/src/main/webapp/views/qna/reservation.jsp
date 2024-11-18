<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-10">
  <h2>QnA Page</h2>
  <h5>Title description, Sep 2, 2017</h5>
  <div class="fakeimg">Fake Image</div>
  <hr class="d-sm-none">

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

  <form action="<c:url value='/reservationimpl' />" method="post" id="reservationForm">
    <div class="form-group">
      <label for="name">성함:</label>
      <input type="text" class="form-control half-width" placeholder="성함" id="name" name="custName">
    </div>

    <div class="form-group">
      <label for="phonenum">연락처:</label>
      <input type="text" class="form-control half-width" placeholder="연락처" id="phonenum" name="custPhone">
    </div>

    <div class="form-group">
      <label for="visitDate">방문 날짜:</label>
      <input type="date" class="form-control half-width" id="visitDate" name="visitDate">
    </div>

    <div class="form-group">
      <label for="visitTime">방문 시간:</label>
      <input type="time" class="form-control half-width" id="visitTime" name="visitTime">
    </div>

    <div class="form-group">
      <label for="content">문의 내용:</label>
      <textarea class="form-control half-width" placeholder="문의내용" id="content" name="reservationContent" rows="4"></textarea>
    </div>

    <div class="form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="agree"> 개인정보수집에 동의합니다.
      </label>
    </div>

    <button type="submit" class="btn btn-primary half-width">등록</button>
  </form>

  <style>
    .half-width {
      width: 50%; /* 너비를 절반으로 설정 */
    }
  </style>

  <script type="text/javascript">
    document.getElementById("reservationForm").addEventListener("submit", function (event) {
      var visitDate = document.getElementById("visitDate").value;
      var visitTime = document.getElementById("visitTime").value;

      if (visitDate && visitTime) {
        // 방문 날짜와 시간을 ISO 8601 형식으로 결합
        var reservationDateTime = visitDate + 'T' + visitTime; // 예: "2024-11-18T15:00"

        // 날짜와 시간을 input 필드로 보내기 전에 hidden 필드에 결합된 값을 넣기
        var hiddenField = document.createElement("input");
        hiddenField.type = "hidden";
        hiddenField.name = "reservationDate"; // reservationDto의 reservationDate에 해당
        hiddenField.value = reservationDateTime;

        // 폼에 hidden 필드 추가
        this.appendChild(hiddenField);
      }
    });

    <c:if test="${reservationSuccess}">

      alert("예약이 완료되었습니다.");

    </c:if>

  </script>
</div>
