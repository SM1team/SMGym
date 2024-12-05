<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
  let workout_detail = {
    init:function(){
      // 수정 버튼 클릭 시
      $('#workoutdetailForm > #btn_update').click(()=>{
        this.send();
      });
      // 삭제 버튼 클릭 시
      $('#workoutdetailForm > #btn_delete').click(()=>{
        let c = confirm('삭제하시겠습니까?');
        if(c == true){
          let workoutNo = $('#workoutNo').val();
          location.href = '<c:url value="/workout/delete"/>?workoutNo=' + workoutNo;
        }
      });
    },
    send:function(){
      // 폼 전송
      $('#workoutdetailForm').attr({
        'method':'post',
        'action':'<c:url value="/workout/update"/>'
      });
      $('#workoutdetailForm').submit();
    }
  };
  $(function(){
    workout_detail.init();
  });
</script>

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
      <!-- 운동 세부 정보 반복 출력 -->
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

    <button id="btn_update" type="button" class="btn btn-primary">Update</button>
    <button id="btn_delete" type="button" class="btn btn-danger">Delete</button>
  </form>
</div>
