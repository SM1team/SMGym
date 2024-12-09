<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/views/nav.jsp" %> <!-- 네비게이션 바 포함 -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인 및 회원가입</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="<c:url value='/css/styles.css' />"> <!-- styles.css 링크 -->
  <style>
    body {
      background-color: black; /* 배경색을 검정으로 */
      color: white; /* 텍스트 색을 흰색으로 */
    }
    .card {
      background-color: #333; /* 카드 배경을 어두운 회색으로 */
      border: 1px solid #444; /* 카드 테두리를 어두운 색으로 */
    }
    .footer-text {
      color: #ccc; /* 푸터 텍스트 색상 */
    }
    .form-control {
      background-color: #555; /* 입력란 배경색을 어두운 회색으로 */
      color: white; /* 입력란 텍스트 색상 */
      border: 1px solid #666; /* 입력란 테두리 색상 */
    }
    .btn-primary {
      background-color: #007bff; /* 버튼 색상 */
      border-color: #007bff; /* 버튼 테두리 색상 */
    }
  </style>
</head>
<body>
<div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">
  <div class="row" style="width: 100%;">
    <!-- 로그인 카드 -->
    <div class="col-md-6">
      <div class="card">
        <div class="card-header text-center">
          <h3>로그인</h3>
        </div>
        <div class="card-body">
          <form action="your_login_processing_url" method="post">
            <div class="form-group">
              <label for="username">사용자 이름</label>
              <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
              <label for="password">비밀번호</label>
              <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">로그인</button>
          </form>
        </div>
        <div class="card-footer text-center">
          <small class="footer-text">아직 계정이 없으신가요? <a href="#signup" class="toggle">회원가입하기</a></small>
        </div>
      </div>
    </div>

    <!-- 회원가입 카드 -->
    <div class="col-md-6">
      <div class="card">
        <div class="card-header text-center">
          <h3>회원가입</h3>
        </div>
        <div class="card-body">
          <form action="<c:url value='/signup' />" method="post">
            <div class="form-group">
              <label for="cust_id">사용자 이름</label>
              <input type="text" class="form-control" id="cust_id" name="cust_id" required maxlength="20">
            </div>
            <div class="form-group">
              <label for="cust_pwd">비밀번호</label>
              <input type="password" class="form-control" id="cust_pwd" name="cust_pwd" required maxlength="30">
            </div>
            <div class="form-group">
              <label for="cust_name">이름</label>
              <input type="text" class="form-control" id="cust_name" name="cust_name" required maxlength="10">
            </div>
            <div class="form-group">
              <label for="cust_age">나이</label>
              <input type="number" class="form-control" id="cust_age" name="cust_age" required min="1">
            </div>
            <div class="form-group">
              <label for="cust_gender">성별</label>
              <select class="form-control" id="cust_gender" name="cust_gender" required>
                <option value="1">남성</option>
                <option value="2">여성</option>
              </select>
            </div>
            <div class="form-group">
              <label for="cust_phone">전화번호</label>
              <input type="text" class="form-control" id="cust_phone" name="cust_phone" required maxlength="20">
            </div>
            <div class="form-group">
              <label for="cust_address">주소</label>
              <input type="text" class="form-control" id="cust_address" name="cust_address" maxlength="50">
            </div>
            <button type="submit" class="btn btn-primary btn-block">회원가입</button>
          </form>
        </div>
        <div class="card-footer text-center">
          <small class="footer-text">이미 계정이 있으신가요? <a href="#login" class="toggle">로그인하기</a></small>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
  $(document).ready(function() {
    $('.toggle').click(function(event) {
      event.preventDefault();
      var targetId = $(this).attr('href').substring(1);
      $('html, body').animate({
        scrollTop: $('#' + targetId).offset().top
      }, 500);
    });
  });
</script>
</body>
</html>
