<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>결제 완료</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body{
    background-color: #000000;
    }
    .btn.btn-primary{
    background-color: #ae00c7; color: #f1f1f1
    }
    .btn.btn-primary:hover{
      background-color: #f1f1f1;
      color: #ae00c7;
    }

  </style>
</head>
<body>
<div class="container mt-5" >
  <h1 style="color: #ae00c7; font-weight: bolder">결제가 완료되었습니다</h1>

  <!-- 결제 정보 표시 -->
  <table class="table" style="color: #f1f1f1;border: 4px #ae00c7">
    <tr>
      <th>결제 ID</th>
      <td>${payment.paymentId}</td>
    </tr>
    <tr>
      <th>상품 아름</th>
      <td>${payment.productName}</td>
    </tr>
    <tr>
      <th>결제 금액</th>
      <td>${payment.amount}</td>
    </tr>
    <tr>
      <th>결제 상태</th>
      <td>${payment.paymentStatus}</td>
    </tr>
    <tr>
      <th>고객 ID</th>
      <td>${payment.custId}</td>
    </tr>
    <tr>
      <th>트레이너 ID</th>
      <td>${payment.trainerId}</td>
    </tr>
  </table>

  <!-- 결제 후 돌아가기 버튼 -->
  <a href="/shop" class="btn btn-primary">쇼핑 계속하기 </a>
</div>

<!-- Bootstrap JS (필수) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
