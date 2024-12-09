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
          <form action="<c:url value='/pt/ptimpl' />" method="post">
<%--            <div class="form-group">--%>
<%--              <label for="cust_id">pt</label>--%>
<%--              <input type="text" class="form-control" id="cust_id" name="custId" required maxlength="20">--%>
<%--            </div>--%>
            <div class="form-group">
              <label for="product_no">제품 번호</label>
              <input type="number" class="form-control" id="product_no" name="productNo" required maxlength="10">
            </div>
            <div class="form-group">
              <label for="trainer_id">트레이너 ID</label>
              <input type="text" class="form-control" id="trainer_id" name="trainerId" required maxlength="30">
            </div>

            <div class="form-group">
              <label for="pt_content">PT 내용</label>
              <input type="text" class="form-control" id="pt_content" name="ptContent" required min="1">
            </div>
            <div class="form-group">
              <label for="pt_date">PT 날짜</label>
                <input type="date" class="form-control" id="pt_date" name="ptDate" required min="1">
            </div>
            <div class="form-group">
              <label for="pt_count">PT 회차</label>
              <input type="number" class="form-control" id="pt_count" name="ptCount" required maxlength="20">
            </div>
            <div class="form-group">
              <label for="cust_id">회원 ID</label>
              <input type="text" class="form-control" id="cust_id" name="custId" required maxlength="20">
            </div>
            <button type="submit" class="btn btn-primary btn-block">완료</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

