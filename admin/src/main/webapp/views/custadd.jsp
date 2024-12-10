<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<div class="container register-container">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card">
        <div class="card-header text-center">
          <!-- <h3>회원가입</h3> 삭제 -->
        </div>
        <div class="card-body">
          <form action="<c:url value='/custaddimpl' />" method="post">
            <div class="form-group">
              <label for="cust_id">고객 ID</label>
              <input type="text" class="form-control" id="cust_id" name="custId" required maxlength="20">
            </div>
            <div class="form-group">
              <label for="cust_name">고객 이름</label>
              <input type="text" class="form-control" id="cust_name" name="custName" required maxlength="10">
            </div>
            <div class="form-group">
              <label for="cust_age">고객 나이</label>
              <input type="number" class="form-control" id="cust_age" name="custAge" required maxlength="30">
            </div>
            <div class="form-group">
              <label for="cust_gender">고객 성별</label>
              <select class="form-control" id="cust_gender" name="custGender" required>
                <option value="1">남성</option>
                <option value="2">여성</option>
              </select>
            </div>
            <div class="form-group">
              <label for="cust_phone">고객 전화번호</label>
              <input type="text" class="form-control" id="cust_phone" name="custPhone" required maxlength="20">
            </div>
            <div class="form-group">
              <label for="cust_address">고객 주소</label>
              <input type="text" class="form-control" id="cust_address" name="custAddress" required maxlength="20">
            </div>

            <div class="form-group">
              <label for="cust_pwd">비밀번호</label>
              <input type="password" class="form-control" id="cust_pwd" name="custPwd" required min="1">
            </div>

            <div class="form-group">
              <label for="trainer_name">담당 트레이너</label>
              <input type="text" class="form-control" id="trainer_name" name="trainerName" required maxlength="20">
            </div>

            <button type="submit" class="btn btn-primary btn-block">등록하기</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


