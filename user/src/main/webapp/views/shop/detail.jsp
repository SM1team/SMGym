<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 상세 페이지</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-6">
            <!-- 상품 이미지 -->
            <img class="img-fluid" src="${product.productImg}" alt="Product Image" />
        </div>
        <div class="col-md-6">
            <!-- 상품 정보 표시 -->
            <form id="product-form">
                <div class="form-group">
                    <label for="productName">상품 이름</label>
                    <input type="text" id="productName" class="form-control" value="${product.productName}" readonly />
                </div>

                <div class="form-group">
                    <label for="productPrice">가격</label>
                    <input type="text" id="productPrice" class="form-control" value="₩${product.productPrice}" readonly />
                </div>

                <div class="form-group">
                    <label for="productNo">상품 번호</label>
                    <input type="hidden" id="productNo" name="productNo" value="${product.productNo}" />
                    <input type="text" class="form-control" value="${product.productNo}" readonly />
                </div>
            </form>

            <!-- 버튼들 -->
            <div class="form-actions">
                <!-- 결제하기 버튼 -->
                <button id="btn-pay-ready"
                        onclick="location.href='/order'"
                        style="background: #fee500; color: #000; border-radius: 12px; padding: 10px 20px;">
                    카카오페이
                </button>


                <!-- 찜하기 버튼 -->
                <form action="/shop/wishlist/add" method="post" class="d-inline">
                    <input type="hidden" name="productNo" value="${product.productNo}" />
                    <button type="submit" class="btn btn-outline-secondary">찜하기</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS (필수) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>



</body>
</html>
