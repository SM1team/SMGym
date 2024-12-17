<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>운동일지</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <style>
    body {
      background-color: #000000;
      font-family: Arial, sans-serif;
      color: #e0e0e0;
      margin: 0;
      padding: 0;
    }

    h2 {
      color: #ae00c7;
      text-align: center;
      margin: 20px 0;
    }

    .col-sm-10 {
      margin: auto;
      background-color: #1a1a1a;
      border: 1px solid #ae00c7;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(174, 0, 199, 0.5);
      padding: 20px;
    }

    .table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      background-color: #1e1e1e;
    }

    .table th,
    .table td {
      padding: 10px;
      border: 1px solid #ae00c7;
      text-align: center;
      color: #e0e0e0;
    }

    .table th {
      background-color: #333;
      font-weight: bold;
    }

    .table tbody tr:hover {
      background-color: #2a2a2a;
    }

    .table .link {
      color: #ae00c7;
      text-decoration: none;
    }

    .table .link:hover {
      color: #ffffff;
      text-decoration: underline;
    }

    .btn-danger, .btn-success {
      border-radius: 5px;
      transition: background-color 0.3s ease, color 0.3s ease;
    }

    .btn-danger {
      background-color: #ae00c7;
      border: #ae00c7;
    }

    .btn-danger:hover {
      background-color: #8a00a2; /* 버튼 hover 시 색상 변경 */
      color: #ffffff;
    }

    .btn-success {
      background-color: #ae00c7;
      border: #ae00c7;
    }

    .btn-success:hover {
      background-color: #8a00a2; /* 버튼 hover 시 색상 변경 */
      color: #ffffff;
    }

    #selectAll {
      cursor: pointer;
    }
  </style>
</head>
<body>
<div style="background-color: #000000; height: 10px; margin-bottom: 20px;"></div>
<div style="background-color: #1a1a1a; margin-bottom: 10px;"></div>

<div class="col-sm-10">
  <h2 style=" font-weight: bolder">운동일지 Page</h2>

  <!-- 버튼들 -->
  <div class="mb-3">
    <button class="btn btn-danger" type="button" id="btn_delete">삭제하기</button>
    <button class="btn btn-success" id="addBtn">새로운 항목 추가</button>
  </div>

  <form id="workoutForm" method="post">
    <table class="table">
      <thead>
      <tr>
        <th><input type="checkbox" id="selectAll"></th>
        <th>운동일지 번호</th>
        <th>회원 이름</th>
        <th>운동날짜</th>
        <th>총 운동시간</th>
        <th>총 소모칼로리</th>
        <th>코멘트</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="c" items="${workouts}">
        <tr>
          <td><input type="checkbox" name="workoutCheckbox" class="workoutCheckbox" value="${c.workoutNo}"></td>
          <td><a href="<c:url value='/workout/detail'/>?workoutNo=${c.workoutNo}" class="link">${c.workoutNo}</a></td>
          <td>${c.custId}</td>
          <td><fmt:formatDate value="${c.workoutDate}" pattern="yyyy-MM-dd" /></td>
          <td>${c.workoutTime}</td>
          <td>${c.workoutCalories}</td>
          <td>${c.workoutComments}</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </form>
</div>

<script>
  // 체크박스 전체 선택/해제
  document.getElementById("selectAll").addEventListener("click", function () {
    const checkboxes = document.querySelectorAll("input[name='workoutCheckbox']");
    checkboxes.forEach(cb => cb.checked = this.checked);
  });

  // 삭제 버튼 클릭 이벤트
  document.getElementById('btn_delete').addEventListener('click', function () {
    const selected = document.querySelectorAll('.workoutCheckbox:checked');
    if (selected.length > 0) {
      const workoutNos = Array.from(selected).map(checkbox => checkbox.value);
      if (confirm('선택한 항목을 삭제하시겠습니까?')) {
        fetch('/workout/workoutlog/delete', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ workoutNos })
        })
                .then(response => {
                  if (response.ok) {
                    alert('삭제되었습니다.');
                    location.reload();
                  } else {
                    alert('삭제에 실패했습니다.');
                  }
                });
      }
    } else {
      alert('삭제할 항목을 선택해주세요.');
    }
  });

  // 새로운 항목 추가 버튼 클릭 시
  document.getElementById("addBtn").addEventListener("click", function () {
    if (confirm("새로운 항목을 만들어 드릴까요?")) {
      addNewWorkout();
    } else {
      // 취소 버튼을 누르면 아무 작업도 하지 않음
      return;
    }
  });

  // 새로운 운동 항목을 추가하는 함수
  function addNewWorkout() {
    fetch('/workout/add', {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: 'cust_id=sampleCustId'
    })
            .then(response => {
              if (response.ok) {
                alert('새로운 항목이 추가되었습니다.');
                location.reload();
              } else {
                alert('항목 추가에 실패했습니다.');
              }
            });
  }
</script>
</body>
</html>
