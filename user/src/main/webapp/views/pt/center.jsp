<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="col-sm-10">

  <h2>PT Page</h2>

  <!-- 쓰기 버튼 -->
  <div class="mb-3">
    <button class="btn btn-primary" onclick="location.href='/workout/writeForm'">쓰기</button>
    <button class="btn btn-warning" id="editBtn">수정하기</button>
    <button class="btn btn-danger" id="deleteBtn">삭제하기</button>
  </div>

  <form id="workoutForm" method="post">
    <table class="table">
      <thead class="thead-dark">
      <tr>
        <th><input type="checkbox" id="selectAll"></th>
        <th>운동일지 번호</th>
        <th>회원 ID</th>
        <th>운동날짜</th>
        <th>총 운동시간</th>
        <th>총 소모칼로리</th>
        <th>코멘트</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="c" items="${workouts}">
        <tr>
          <!-- 체크박스 -->
          <td><input type="checkbox" name="workoutNo" value="${c.workoutNo}"></td>
          <!-- 운동일지 번호 클릭 시 상세 페이지 이동 -->
          <td><a href="<c:url value='/workout/detail'/>?workoutNo=${c.workoutNo}">${c.workoutNo}</a></td>

          <td>${c.custId}</td>
          <td>${c.workoutDate}</td>
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
      location.href = `/workout/editForm?id=${selected[0]}`;
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
        form.action = "/workout/delete";
        form.submit();
      }
    } else {
      alert("삭제할 항목을 선택하세요.");
    }
  });

  // 선택된 workoutNo 가져오기
  function getSelectedWorkout() {
    const checkboxes = document.querySelectorAll("input[name='workoutNo']:checked");
    return Array.from(checkboxes).map(cb => cb.value);
  }
</script>
