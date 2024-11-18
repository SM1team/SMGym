<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--ajax로 할거임--%>
<%--문의,예약,예약내역 누르면 그 화면만 변경되게..--%>
<%--nav에서 QnA 를 누르면 문의 페이지가 열린다. ->websocket 1대1 채팅으로 이루어짐.--%>
<%--예약을 누르면 캘린더가 나오고, 가능한 시간대를 선택하여 예약 완료할 수 있다.--%>
<%--예약 내역은 캘린더를 통해 예약된 정보를 볼 수 있다.--%>


<div class="col-sm-10">

  <h2>1대1 문의 채팅 Page</h2>

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



</div>
