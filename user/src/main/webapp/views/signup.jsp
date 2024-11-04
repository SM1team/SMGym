<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="<c:url value='/css/styles.css' />"> <!-- styles.css 링크 -->
  <style>
    body {
      background-color: #f8f9fa;
    }
    .masthead {
      background: url('path/to/your/background-image.jpg') no-repeat center center;
      background-size: cover;
      color: white;
      padding: 80px 0;
      text-align: center;
    }
    .masthead .masthead-subheading {
      font-size: 1.5rem;
      margin-bottom: 20px;
    }
    .register-container {
      margin-top: 30px;
    }
    .card {
      border: none;
      border-radius: 15px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }
    .card-header {
      background-color: #007bff;
      color: white;
      border-top-left-radius: 15px;
      border-top-right-radius: 15px;
    }
    .card-footer {
      background-color: #f8f9fa;
    }
    .footer-text {
      font-size: 0.9rem;
    }
    .btn-primary {
      background-color: #007bff; /* 기본 버튼 색상 변경 */
      border: none;
    }
    .btn-primary:hover {
      background-color: #0056b3; /* 버튼 호버 색상 변경 */
    }
    .form-group {
      margin-bottom: 1.5rem; /* 폼 간격 증가 */
    }
  </style>
</head>
<body>
<header class="masthead">
  <div class="container">
    <div class="masthead-subheading">회원가입을 환영합니다!</div>
    <div class="masthead-heading text-uppercase">새로운 시작을 위해</div>
    <a class="btn btn-secondary btn-xl text-uppercase" href="/"><i class="fas fa-home"></i> 메인 페이지로 돌아가기</a>
  </div>
</header>

<div class="container register-container">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card">
        <div class="card-header text-center">
          <!-- <h3>회원가입</h3> 삭제 -->
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
              <label>주소</label>
              <div class="form-row">
                <div class="col">
                  <input type="text" class="form-control" id="cust_city" name="cust_city" placeholder="시/구" required maxlength="30">
                </div>
                <div class="col">
                  <input type="text" class="form-control" id="cust_street" name="cust_street" placeholder="상세주소" required maxlength="30">
                </div>
              </div>
            </div>
            <button type="submit" class="btn btn-primary btn-block">회원가입</button>
          </form>
        </div>
        <div class="card-footer text-center">
          <small class="footer-text">이미 계정이 있으신가요? <a href="<c:url value='/login' />">여기에서 로그인하세요</a></small>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
