<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2>상품 상세 정보</h2>

<div class="container">
  <div class="row">
    <div class="col-md-6">
      <!-- 상품 이미지 -->
      <img class="img-fluid" src="${product.productImg}" alt="Product Image" />
    </div>
    <div class="col-md-6">
      <!-- 상품 이름, 가격, 상세 정보 등 -->
      <h3>${product.productName}</h3>
      <p>₩${product.productPrice}</p>
      <p>상품 번호: ${product.productNo}</p>
      <p>트레이너 ID: ${product.trainerId}</p>
      <p>트레이너 성별: ${product.trainerGender == 1 ? '남성' : '여성'}</p>
      <p>장소 번호: ${product.placeNo}</p>

      <!-- 상품 추가/구매 관련 버튼 -->
      <a href="/cart/add?productNo=${product.productNo}" class="btn btn-primary">장바구니에 추가</a>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
