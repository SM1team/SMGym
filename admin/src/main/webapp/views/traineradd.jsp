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
          <form action="<c:url value='/traineraddimpl' />" method="post">
            <div class="form-group">
              <label for="trainer_id">트레이너 ID</label>
              <input type="text" class="form-control" id="trainer_id" name="trainerId" required maxlength="20">
            </div>
            <div class="form-group">
              <label for="trainer_name">트레이너 이름</label>
              <input type="text" class="form-control" id="trainer_name" name="trainerName" required maxlength="10">
            </div>
            <div class="form-group">
              <label for="trainer_age">트레이너 나이</label>
              <input type="number" class="form-control" id="trainer_age" name="trainerAge" required maxlength="30">
            </div>
            <div class="form-group">
              <label for="trainer_gender">트레이너 성별</label>
              <select class="form-control" id="trainer_gender" name="trainerGender" required>
                <option value="0">남성</option>
                <option value="1">여성</option>
              </select>
            </div>
            <div class="form-group">
              <label for="trainer_phone">트레이너 전화번호</label>
              <input type="text" class="form-control" id="trainer_phone" name="trainerPhone" required maxlength="20">
            </div>
            <div class="form-group">
              <label for="trainer_address">트레이너 주소</label>
              <input type="text" class="form-control" id="trainer_address" name="trainerAddress" required maxlength="20">
            </div>

            <div class="form-group">
              <label for="trainer_pwd">비밀번호</label>
              <input type="password" class="form-control" id="trainer_pwd" name="trainerPwd" required min="1">
            </div>

            <div class="form-group">
              <label for="place_no">지역 번호</label>
              <input type="number" class="form-control" id="place_no" name="placeNo" required maxlength="30">
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


