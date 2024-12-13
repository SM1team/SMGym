<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>운동 세부 수정</title>
</head>
<body>
<h2>운동 세부 수정</h2>
<form id="updateForm" action="/workout/update" method="post" >
  <input type="hidden" name="wdetailId" value="${detail.wdetailId}"/>

  <div>
    <label for="workoutNo">운동 일지번호</label>
    <input type="text" id="workoutNo" name="workoutNo" style="display: none;" value="${detail.workoutNo}" required>
  </div>

  <div>
    <label for="wdetailExname">운동 이름</label>
    <input type="text" id="wdetailExname" name="wdetailExname" value="${detail.wdetailExname}" required>
  </div>

  <div>
    <label for="wdetailSets">세트 수</label>
    <input type="number" id="wdetailSets" name="wdetailSets" value="${detail.wdetailSets}" required>
  </div>
  <div>
    <label for="wdetailCount">총 개수</label>
    <input type="number" id="wdetailCount" name="wdetailCount" value="${detail.wdetailCount}" required>
  </div>
  <div>
    <label for="wdetailWeight">총 무게</label>
    <input type="number" id="wdetailWeight" name="wdetailWeight" value="${detail.wdetailWeight}" required>
  </div>
  <div>
    <label for="wdetailCalories">소모 칼로리</label>
    <input type="number" id="wdetailCalories" name="wdetailCalories" value="${detail.wdetailCalories}" required>
  </div>
  <div>
    <label for="wdetailTime">운동 시간</label>
    <input type="number" id="wdetailTime" name="wdetailTime" value="${detail.wdetailTime}" required>
  </div>
  <div>
    <label for="workoutComments">운동 코멘트</label>
    <input type="text" id="workoutComments" name="workoutComments" value="${detail.workoutComments}">
  </div>
  <div >
    <label for="workoutDate">운동 날짜</label>
    <input type="date" id="workoutDate" name="workoutDate" value="${detail.workoutDate}" style="display: none;">
  </div>
  <button type="submit" id="btnSave">수정 완료</button>
</form>

</body>
</html>

