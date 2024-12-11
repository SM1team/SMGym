<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
  /* 다크 테마 스타일 */
  body {
    font-family: Arial, sans-serif;
    line-height: 1.5;
    color: #e0e0e0;
    background-color: #000000;
    margin: 0;
    padding: 0;
  }

  h2 {
    text-align: center;
    color: #ae00c7;
    margin-bottom: 20px;
  }

  .btn {
    padding: 10px 15px;
    border-radius: 5px;
    text-decoration: none;
    color: #e0e0e0;
    border: 1px solid #ae00c7;
    background-color: #000000;
    font-size: 1rem;
    transition: background-color 0.3s ease, color 0.3s ease;
  }

  .btn:hover {
    background-color: #ae00c7;
    color: #ffffff;
    border-color: #ffffff;
  }

  .table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background-color: #1E1E1E;
    color: #e0e0e0;
  }

  .table th, .table td {
    padding: 10px;
    border: 1px solid #ae00c7;
    text-align: center;
  }

  .table th {
    background-color: #333;
    color: #e0e0e0;
    font-weight: bold;
  }

  .table a {
    color: #f1f1f1;
    text-decoration: none;
  }

  .table a:hover {
    text-decoration: underline;
  }

  .thead-dark th {
    background-color: #ae00c7;
  }

  input[type="checkbox"] {
    transform: scale(1.2);
    accent-color: #ae00c7;
  }

  #workoutForm {
    margin: 20px auto;
    width: 90%;
  }

  #selectAll {
    cursor: pointer;
  }
</style>

<div class="col-sm-10" style="margin: auto">
  <div style="height: 50px;"></div>

  <h2>운동일지 Page</h2>

  <!-- 버튼들 -->
  <div class="mb-3" style="text-align: center;">
    <button class="btn" onclick="location.href='/workout/write'">쓰기</button>
    <button class="btn" id="editBtn">수정하기</button>
    <button class="btn" id="deleteBtn">삭제하기</button>
    <button class="btn" id="addBtn">새로운 항목 추가</button>
  </div>

  <form id="workoutForm" method="post">
    <table class="table">
      <thead class="thead-dark">
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
          <td><input type="checkbox" name="workoutNo" value="${c.workoutNo}"></td>
          <td><a href="<c:url value='/workout/detail'/>?workoutNo=${c.workoutNo}">${c.workoutNo}</a></td>
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
    const checkboxes = document.querySelectorAll("input[name='workoutNo']");
    checkboxes.forEach(cb => cb.checked = this.checked);
  });

  // 수정 버튼 클릭 시
  document.getElementById("editBtn").addEventListener("click", function () {
    const selected = getSelectedWorkout();
    if (selected.length === 1) {
      location.href = `/editForm?id=${selected[0]}`;
    } else {
      alert("수정하려면 하나의 항목만 선택해야 합니다.");
    }
  });

  // 삭제 버튼 클릭 시
  document.getElementById("deleteBtn").addEventListener("click", function () {
    const selected = getSelectedWorkout();
    if (selected.length > 0) {
      if (confirm("선택한 항목을 삭제하시겠습니까?")) {
        const form = document.getElementById("workoutForm");
        form.action = "/delete";
        form.submit();
      }
    } else {
      alert("삭제할 항목을 선택하세요.");
    }
  });

  // 새로운 항목 추가 버튼 클릭 시
  document.getElementById("addBtn").addEventListener("click", function () {
    if (confirm("새로운 항목을 만들어 드릴까요?")) {
      addNewWorkout();
    }
  });

  // 선택된 workoutNo 가져오기
  function getSelectedWorkout() {
    const checkboxes = document.querySelectorAll("input[name='workoutNo']:checked");
    return Array.from(checkboxes).map(cb => cb.value);
  }

  // 새로운 운동 항목을 추가하는