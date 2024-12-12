<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="col-sm-10">

  <h2>PT Page</h2>

  <!-- 쓰기 버튼 -->
  <div class="mb-3">
    <button class="btn btn-danger" id="deleteBtn">삭제하기</button>
  </div>

  <form id="ptform" method="post">
    <table class="table">
      <thead class="thead-dark">
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
          <!-- pt일지 번호 클릭 시 ptContent 상세보기 -->
          <td><a href="<c:url value='/pt/edit'/>?ptNo=${c.ptNo}">${c.ptNo}</a></td>
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
