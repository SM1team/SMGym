<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
  // 페이지 로드 후 화면을 중간으로 이동
  window.onload = function() {
    const middlePosition = document.body.scrollHeight / 3;
    window.scrollTo({
      top: middlePosition,
      behavior: "smooth"
    });
  };
</script>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입 완료</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      background-color: #000000;
      color: #ffffff;
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    .container {
      padding: 20px;
    }

    .custom-card {
      text-decoration: none;
      color: inherit;
      display: block;
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      background-color: #1a1a1a;
      border: 2px solid transparent;
      width: 100%;
      height: 300px;
      margin-top: 50px;
      text-align: center;
      padding: 20px;
    }

    .custom-card h3 {
      font-weight: bold;
      color: #ae00c7;
      margin-bottom: 20px;
    }

    .custom-card p {
      font-size: 1.2rem;
      margin-bottom: 20px;
    }

    .custom-card a {
      text-decoration: none;
      background-color: #ae00c7;
      color: #fff;
      padding: 10px 20px;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    .custom-card a:hover {
      background-color: #85009e;
    }

    .footer-text a {
      color: #f1f1f1;
      text-decoration: none;
      transition: color 0.3s ease;
    }

    .footer-text a:hover {
      color: #ae00c7;
    }
  </style>
</head>
<body>

<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card custom-card">
        <div class="card-body">
          <h3>회원가입이 완료되었습니다!</h3>
          <h5><span style="color: #ae00c7;">${sessionScope.loginid.custName}</span>님 환영합니다.</h5>
          <p>이제 로그인하여 서비스를 이용하실 수 있습니다.</p>
          <a href="<c:url value='/login'/>" class="btn btn-primary">로그인 페이지로 이동</a>
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
