<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div style="background-color: #000000; height: 10px; margin-bottom: 20px;"></div>
  <div style="background-color: #1a1a1a; margin-bottom: 10px;"></div>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="col-sm-10" style="margin: auto">


<h2 style="margin-left: 50%"> pt 기록</h2>
  <!-- 쓰기 버튼 -->
<%--  <div class="mb-3">--%>
<%--    <button class="btn btn-danger" id="deleteBtn">삭제하기</button>--%>
<%--  </div>--%>

  <form id="ptform" method="post">
    <table class="table board-table">
      <thead>
      <tr>
        <th><input type="checkbox" id="selectAll"></th>
        <th>PT일지 번호</th>
        <th>상품 번호</th>
        <th>트레이너 ID</th>
        <th>PT 내용</th>
        <th>PT 날짜</th>
        <th>PT 회차</th>
        <th>회원 ID</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="c" items="${pts}">
        <tr>
          <td><input type="checkbox" class="rowCheckbox" value="${c.ptNo}"></td>
          <td><a href="<c:url value='/pt/edit'/>?ptNo=${c.ptNo}" class="board-title-link">${c.ptNo}</a></td>
          <td>${c.productNo}</td>
          <td>${c.trainerId}</td>
          <!-- ptContent 30자만 출력 -->
          <td>
            <c:choose>
              <c:when test="${fn:length(c.ptContent) > 30}">
                ${fn:substring(c.ptContent, 0, 30)}...
              </c:when>
              <c:otherwise>
                ${c.ptContent}
              </c:otherwise>
            </c:choose>
          </td>
          <td>${c.ptDate}</td>
          <td>${c.ptCount}</td>
          <td>${c.custId}</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </form>

</div>

<script>
  // 전체 선택/해제 기능
  document.getElementById('selectAll').addEventListener('change', function () {
    const checkboxes = document.querySelectorAll('.rowCheckbox');
    checkboxes.forEach(checkbox => checkbox.checked = this.checked);
  });




  // 삭제 버튼 클릭 이벤트
  document.getElementById('deleteBtn').addEventListener('click', function () {
    const selected = document.querySelectorAll('.rowCheckbox:checked');
    if (selected.length > 0) {
      const ptNos = Array.from(selected).map(checkbox => checkbox.value);
      if (confirm('선택한 항목을 삭제하시겠습니까?')) {
        fetch('/pt/delete', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ ptNos })
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
</script>

<style>
  body {
    background-color: #000000;
    font-family: Arial, sans-serif;
    color: #e0e0e0;
    margin: 0;
    padding: 0;
  }

  .board-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background-color: #1E1E1E;
    color: #e0e0e0;
  }

  .board-table th,
  .board-table td {
    padding: 10px;
    border: 1px solid #ae00c7;
    text-align: left;
  }

  .board-table th {
    background-color: #333;
    font-weight: bold;
    color: #e0e0e0;
  }

  .board-table .board-title-link {
    color: #ae00c7;
    text-decoration: none;
  }

  .board-table .board-title-link:hover {
    text-decoration: underline;
    color: #ffffff;
  }


  .col-sm-10 {
    background-color: #1a1a1a;
    border: 1px solid #ae00c7;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(174, 0, 199, 0.5);
  }

  .table {
    color: #f1f1f1;
  }

</style>
