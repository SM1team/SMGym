<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 상세 페이지</title>
    <!-- Bootstrap CSS -->
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

                <div class="form-group">
                    <label for="trainerGender">트레이너 성별</label>
                    <select id="trainerGender" name="trainerGender" class="form-control" readonly>
                        <option value="1" ${product.trainerGender == 1 ? 'selected' : ''}>남성</option>
                        <option value="2" ${product.trainerGender == 2 ? 'selected' : ''}>여성</option>
                    </select>
                </div>
            </form>

            <!-- 버튼들 -->
            <div class="form-actions">
                <!-- 결제하기 버튼 -->
                <button id="btn-pay-ready" class="btn btn-primary">결제하기</button>

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

<!-- 카카오 결제 준비 AJAX 코드 -->
<script>
    $(function() {
        $("#btn-pay-ready").click(function(e) {
            e.preventDefault();

            // JSP에서 데이터를 JavaScript로 가져옴
            const productName = $("#productName").val();
            const productPrice = $("#productPrice").val().replace("₩", "").trim();

            if (!productName || !productPrice) {
                alert("상품 정보가 잘못되었습니다. 다시 시도해주세요.");
                return;
            }

            // AJAX 요청
            $.ajax({
                type: "POST",
                url: "/payment/prepare",
                data: JSON.stringify({
                    productName: productName,
                    productPrice: productPrice
                }),
                contentType: "application/json",
                success: function(response) {
                    if (response.next_redirect_pc_url) {
                        window.location.href = response.next_redirect_pc_url;
                    } else {
                        alert("결제 준비 실패: 리다이렉트 URL이 없습니다.");
                    }
                },
                error: function(xhr, status, error) {
                    alert("결제 요청 중 오류가 발생했습니다: " + error);
                }

            });
        });
    });
</script>

</body>
</html>
