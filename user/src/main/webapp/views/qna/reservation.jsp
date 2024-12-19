<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<style>
  /* 전체 페이지 스타일 */
  body {
    background-color: #000000;
    color: #ffffff;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
  }

  /* 헤더 스타일 */
  header {
    background-color: #1a1a1a;
    text-align: center;
    padding: 20px 0;
  }

  /* 카드 기본 스타일 */
  .card {
    background-color: #1a1a1a;
    border: 1px solid transparent;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
    padding: 20px;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
    width: 60%;
    margin: 100px auto;
  }

  .card:hover {
    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
    border-color: #ae00c7;
  }

  /* 입력 필드 스타일 */
  .form-control {
    background-color: #000000;
    color: #ffffff;
    border: 1px solid #ffffff;
    border-radius: 5px;
    margin-bottom: 15px;
    padding: 10px;
  }

  .form-control:focus {
    border-color: #ae00c7;
    box-shadow: 0 0 8px #ae00c7;
    color: #ffffff; /* 텍스트 흰색 */
    background-color: #000000; /* 입력 필드 배경색 검정 */
  }

  /* 버튼 스타일 */
  .btn-primary {
    background-color: #ae00c7;
    border: none;
    padding: 12px 20px;
    border-radius: 5px;
    transition: background-color 0.3s ease;
  }

  .btn-primary:hover {
    background-color: #85009e;
  }

  .half-width {
    width: 50%; /* 너비를 절반으로 설정 */
  }

  /* 텍스트와 버튼 스타일 */
  .footer-text a {
    color: #f1f1f1;
    text-decoration: none;
    transition: color 0.3s ease;
    display: inline-block;
  }

  .footer-text a:hover {
    color: #ae00c7;
  }
  /* 날짜 입력 필드 스타일 */
  input[type="date"] {
    background-color: #000000;
    color: #ffffff;
    border: 1px solid #ffffff;
    border-radius: 5px;
  }

  input[type="date"]::-webkit-calendar-picker-indicator {
    background-color: #ffffff; /* 달력 버튼 배경을 흰색으로 설정 */
    border-radius: 5px; /* 버튼 모서리 둥글게 설정 */
  }

  /* 달력 내부 스타일 (브라우저에 따라 다를 수 있음) */
  input[type="date"]:focus {
    border-color: #ae00c7;
    box-shadow: 0 0 8px #ae00c7;
  }

  /* 일부 브라우저에서 날짜 선택기 색상 변경을 위한 추가 스타일 */
  input[type="date"]::-webkit-input-placeholder {
    color: #ffffff;
  }

  /* 방문 시간 선택 아이콘 스타일 */
  input[type="time"]::-webkit-calendar-picker-indicator {
    background-color: #ffffff; /* 아이콘 배경을 흰색으로 설정 */
    border-radius: 50%; /* 아이콘을 둥글게 만듦 */
    padding: 5px; /* 아이콘 안쪽 여백 */
  }

  /* 시간 선택 아이콘이 클릭될 때 포커스 스타일 */
  input[type="time"]:focus::-webkit-calendar-picker-indicator {
    box-shadow: 0 0 8px #ae00c7; /* 포커스 시 강조 효과 */
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

  <!-- 예약 폼 카드 -->
  <div class="card" style="max-width: 800px; padding: 20px; margin-top: 50px">
    <div class="card-body">
      <h3 class="card-header text-center" style="background-color: #1a1a1a; color: white; padding: 10px; border-radius: 5px;">
        예약하기
      </h3>

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
          <label for="visitTime">방문 시간:(10분단위로 해주세요!)</label>
          <!-- step="600"으로 설정하여 10분 단위로 제한 -->
          <input type="time" class="form-control half-width" id="visitTime" name="visitTime" step="600" style="appearance: auto !important;">
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
    </div>
  </div>

  <!-- 스타일 추가 -->
  <style>
    /* 폼과 카드 중앙 정렬 및 크기 설정 */
    .card {
      max-width: 800px; /* 카드 최대 너비 설정 */
      margin: 20px auto; /* 카드 중앙 정렬 */
      padding: 20px; /* 카드 내 여백 */
    }

    /* 입력 필드와 버튼 길이 조정 */
    .form-control.half-width {
      width: 100%; /* 100% 너비로 설정 */
    }

    .btn-primary {
      width: 100%; /* 버튼 너비를 100%로 설정 */
    }
  </style>
  <script>
    // 브라우저에서 step 속성을 강제로 확인 및 설정
    const timeInput = document.getElementById("visitTime");
    timeInput.setAttribute("step", "600");
  </script>


  <script type="text/javascript">
    document.getElementById("reservationForm").addEventListener("submit", function (event) {
      var visitDate = document.getElementById("visitDate").value;
      var visitTime = document.getElementById("visitTime").value;

      // 로그로 날짜와 시간 확인
      console.log("Visit Date: ", visitDate);
      console.log("Visit Time: ", visitTime);

      // 방문 날짜와 시간이 모두 입력된 경우
      if (visitDate && visitTime) {
        // 날짜와 시간을 올바른 형식으로 변환 (YYYY-MM-DD HH:MM:SS)
        var formattedDate = new Date(visitDate + ' ' + visitTime); // "2024-12-10 14:43"
        var reservationDateTime = formattedDate.toISOString().slice(0, 19).replace('T', ' '); // "2024-12-10 14:43:00"

        // 로그로 최종 예약 날짜 시간 확인
        console.log("Formatted Reservation DateTime: ", reservationDateTime);

        // hidden input으로 예약 날짜와 시간 전달
        var hiddenField = document.createElement("input");
        hiddenField.type = "hidden";
        hiddenField.name = "reservationDate";
        hiddenField.value = reservationDateTime;

        this.appendChild(hiddenField);
      } else {
        // 날짜 또는 시간이 입력되지 않으면 경고 표시
        alert("방문 날짜와 시간을 모두 입력해주세요.");
        event.preventDefault(); // 폼 제출을 중단
      }
    });

    <c:if test="${reservationSuccess}">
    alert("예약이 완료되었습니다.");
    </c:if>
  </script>



</div>

