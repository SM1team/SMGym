<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<div class="col-sm-10">
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
  <div class="mb-3">
    <button class="btn btn-danger" type="button" id="btn_delete">삭제하기</button>
    <button class="btn btn-success" id="addBtn">새로운 항목 추가</button> <!-- 새로운 항목 추가 버튼 -->
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
          <td><input type="checkbox" name="workoutCheckbox" class="workoutCheckbox" value="${c.workoutNo}"></td>
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




  // 삭제 버튼 클릭 이벤트
  document.getElementById('btn_delete').addEventListener('click', function () {
    const selected = document.querySelectorAll('.workoutCheckbox:checked');
    console.log("select checkbox:",selected);
    if (selected.length > 0) {
      const workoutNos = Array.from(selected).map(checkbox => checkbox.value);
      if (confirm('선택한 항목을 삭제하시겠습니까?')) {
        fetch('/workout/workoutlog/delete', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({workoutNos })
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

  // 선택된 workoutNo 가져오기
  function getSelectedWorkout() {
    const checkboxes = document.querySelectorAll("input[name='workoutNo']:checked");
    return Array.from(checkboxes).map(cb => cb.value);
  }

  // 새로운 운동 항목을 추가하는 함수 (AJAX)
  function addNewWorkout() {
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "/workout/add", true); // 요청 URL (새 항목 추가)
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    // 서버로 보낼 데이터 (여기서는 예시로 cust_id 값을 하드코딩)
    const data = "cust_id=sampleCustId";

    // 요청 보내기
    xhr.send(data);

    // 서버 응답 처리
    xhr.onload = function () {
      if (xhr.status == 200) {
        alert("새로운 항목이 추가되었습니다.");
        location.reload(); // 새로고침하여 페이지 업데이트
      } else {
        alert("항목 추가에 실패했습니다.");
      }
    };
  }
</script>


