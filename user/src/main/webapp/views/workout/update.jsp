<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>운동 세부 수정</title>
  <style>
    body {
      background-color: #000000;
      color: #e0e0e0;
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    h2 {
      color: #ae00c7;
      text-align: center;
      margin: 20px 0;
    }

    .container {
      margin-top: 20px;
      padding: 20px;
      color : #e0e0e0;
    }

    .btn {
      border-radius: 5px;
      padding: 10px 20px;
      transition: background-color 0.3s ease;
      border: 4px;
    }

    .btn-danger {
      background-color: #ae00c7;
      border: 4px #ae00c7;
    }

    .btn-danger:hover {
      background-color: #8a00a2;
      color: #ffffff;
    }

    .btn-success {
      background-color: #ae00c7;
      color: #f1f1f1;
      border: 4px #ae00c7;
    }

    .btn-success:hover {
      background-color: #8a00a2;
      color: #ffffff;
    }

    .btn-warning {
      background-color: #ae00c7;
      border: #ffc107;
    }

    .btn-warning:hover {
      background-color: #8a00a2;
      color: #ffffff;
    }

    .card {
      background-color: #000000;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
      width: 80%;
      margin: 0 auto;
    }

    .form-control {
      background-color: #000000;
      color: #e0e0e0;
      border: 1px solid #ffffff;
      border-radius: 5px;
      margin-bottom: 15px;
      padding: 10px;
    }

    .form-control:focus {
      border-color: #ae00c7;
      box-shadow: 0 0 8px #ae00c7;
    }

    table {
      width: 100%;
      margin-top: 20px;
      color: #e0e0e0;
      border-collapse: collapse;
    }

    th, td {
      padding: 12px;
      text-align: center;
      border: 1px solid #ae00c7;
    }

    th {
      background-color: #333;
      font-weight: bold;
    }

    tbody tr:hover {
      background-color: #000000;
    }

    .card-footer {
      background-color: #000000;
      text-align: center;
      padding: 10px;
    }

    .footer-text a {
      color: #f1f1f1;
      text-decoration: none;
    }

    .footer-text a:hover {
      color: #ae00c7;
    }

    .form-group {
      margin-bottom: 15px;
    }

    label {
      font-size: 1.1em;
      margin-bottom: 5px;
    }

    input {
      width: 100%;
      padding: 10px;
      background-color: #000000;
      color: #e0e0e0;
      border: 1px solid #ae00c7;
      border-radius: 5px;
    }

    input:focus {
      border-color: #ae00c7;
      box-shadow: 0 0 8px #ae00c7;
    }

    button[type="submit"] {
      background-color: #ae00c7;
      color: white;
      padding: 10px 20px;
      border-radius: 5px;
      border: 2px solid #ae00c7;
      transition: background-color 0.3s ease;
      margin-top: 20px;
    }

    button[type="submit"]:hover {
      background-color: #8a00a2;
      color: white;
    }
  </style>
</head>
<body>

<div class="container" style="width: 70%;">
  <h2>운동 세부 수정</h2>
  <form id="updateForm" action="/workout/update" method="post">
    <input type="hidden" name="wdetailId" value="${detail.wdetailId}"/>

    <div class="form-group">
      <label for="workoutNo">운동 일지번호</label>
      <input type="text" id="workoutNo" name="workoutNo" value="${detail.workoutNo}" style="display: none;" required>
    </div>

    <div class="form-group">
      <label for="wdetailExname">운동 이름</label>
      <input type="text" id="wdetailExname" name="wdetailExname" value="${detail.wdetailExname}" required>
    </div>

    <div class="form-group">
      <label for="wdetailSets">세트 수</label>
      <input type="number" id="wdetailSets" name="wdetailSets" value="${detail.wdetailSets}" required>
    </div>

    <div class="form-group">
      <label for="wdetailCount">총 개수</label>
      <input type="number" id="wdetailCount" name="wdetailCount" value="${detail.wdetailCount}" required>
    </div>

    <div class="form-group">
      <label for="wdetailWeight">총 무게</label>
      <input type="number" id="wdetailWeight" name="wdetailWeight" value="${detail.wdetailWeight}" required>
    </div>

    <div class="form-group">
      <label for="wdetailCalories">소모 칼로리</label>
      <input type="number" id="wdetailCalories" name="wdetailCalories" value="${detail.wdetailCalories}" required>
    </div>

    <div class="form-group">
      <label for="wdetailTime">운동 시간</label>
      <input type="number" id="wdetailTime" name="wdetailTime" value="${detail.wdetailTime}" required>
    </div>

    <div class="form-group">
      <label for="workoutComments">운동 코멘트</label>
      <input type="text" id="workoutComments" name="workoutComments" value="${detail.workoutComments}">
    </div>

    <div class="form-group">
      <label for="workoutDate">운동 날짜</label>
      <input type="date" id="workoutDate" name="workoutDate" value="${detail.workoutDate}" style="display: none;">
    </div>

    <button type="submit">수정 완료</button>
  </form>
</div>

</body>
</html>