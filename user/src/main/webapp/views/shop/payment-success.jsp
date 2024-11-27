<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>결제 완료</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
  <h1 class="text-center">결제가 완료되었습니다!</h1>
  <div class="card mt-3">
    <div class="card-body">
      <h5 class="card-title">주문 상세 정보</h5>
      <p><strong>결제 ID:</strong> ${payment.paymentId}</p>
      <p><strong>상품 번호:</strong> ${payment.productNo}</p>
      <p><strong>결제 금액:</strong> ₩${payment.amount}</p>
      <p><strong>결제 상태:</strong> ${payment.paymentStatus}</p>
    </div>
  </div>
  <div class="text-center mt-4">
    <a href="/" class="btn btn-primary">메인으로 돌아가기</a>
  </div>
</div>
</body>
</html>
