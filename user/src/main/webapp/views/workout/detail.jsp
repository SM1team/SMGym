<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <div class="col-sm-10">

    <h2>운동상세 Page</h2>

    <form id="workoutdetailForm">
      <table class="table">
        <thead class="thead-dark">
        <tr>

          <th>운동 세부 번호</th>
          <th>운동 일지 번호</th>
          <th>운동기구 번호</th>
          <th>운동 이름</th>
          <th>세트 수</th>
          <th>총 개수</th>
          <th>총 무게</th>
          <th>소모 칼로리</th>
          <th>운동 시간</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${details}">
          <tr>
            <td>${c.wdetailId}</td>
            <td>${c.workoutNo}</td>
            <td>${c.machineNo}</td>
            <td>${c.wdetailExname}</td>
            <td>${c.wdetailSets}</td>
            <td>${c.wdetailCount}</td>
            <td>${c.wdetailWeight}</td>
            <td>${c.wdetailCalories}</td>
            <td>${c.wdetailTime}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </form>

  </div>


