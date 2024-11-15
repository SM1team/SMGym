<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--ajax로 할거임--%>
<%--문의,예약,예약내역 누르면 그 화면만 변경되게..--%>
<%--nav에서 QnA 를 누르면 문의 페이지가 열린다. ->websocket 1대1 채팅으로 이루어짐.--%>
<%--예약을 누르면 캘린더가 나오고, 가능한 시간대를 선택하여 예약 완료할 수 있다.--%>
<%--예약 내역은 캘린더를 통해 예약된 정보를 볼 수 있다.--%>


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

  <form action="/action_page.php">
    <div class="form-group">
      <label for="name">성함:</label>
      <input type="text" class="form-control half-width" placeholder="성함" id="name">
    </div>

    <div class="form-group">
      <label for="phonenum">연락처:</label>
      <input type="text" class="form-control half-width" placeholder="연락처" id="phonenum">
    </div>

    <div class="form-group">
      <label for="content">문의 내용:</label>
      <textarea class="form-control half-width" placeholder="문의내용" id="content" rows="4"></textarea>
    </div>

    <div class="form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox"> 개인정보수집에 동의합니다.
      </label>
    </div>

    <button type="submit" class="btn btn-primary half-width">등록</button>
  </form>

  <style>
    .half-width {
      width: 50%; /* 너비를 절반으로 설정 */
    }
  </style>


</div>