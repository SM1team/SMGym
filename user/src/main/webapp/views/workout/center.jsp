<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<div class="col-sm-10">

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
          <td>${c.workoutCalories}</td> <!-- 총 소모 칼로리 표시 -->
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
      // 확인 버튼을 누르면 DB에 새로운 항목 추가 요청
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


