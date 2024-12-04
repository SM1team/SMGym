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
            <img class="img-fluid" src="/assets/img/${product.productImg}" alt="Product Image" />
        </div>
        <div class="col-md-6">
            <!-- 상품 정보 표시 -->
            <form id="product-form">
                <div class="form-group">
                    <label for="productName">상품 이름</label>
                    <input type="hidden" id="productName" name="productName" value="${product.productName}" />
                    <input type="text" class="form-control" value="${product.productName}" readonly />
                </div>

                <div class="form-group">
                    <label for="productPrice">가격</label>
                    <input type="text" id="productPrice" class="form-control" value="₩${product.productPrice}" readonly />
                </div>

                <!-- 트레이너 선택 폼 -->
                <div id="trainer-selection-form" class="form-group">
                    <label for="trainerSelection">트레이너 선택</label>
                    <select id="trainerSelection" name="trainerId" class="form-control">
                        <c:forEach var="trainer" items="${trainerList}">
                            <option value="${trainer.trainerId}">
                                    ${trainer.trainerName} (
                                <c:choose>
                                    <c:when test="${trainer.trainerGender == '0'}">남</c:when>
                                    <c:when test="${trainer.trainerGender == '1'}">여</c:when>
                                    <c:otherwise>알 수 없음</c:otherwise>
                                </c:choose>
                                )
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </form>

            <div class="form-actions">
                <!-- 결제하기 버튼 -->
                <button id="btn-pay-ready"
                        onclick="checkLoginBeforePay()"
                        style="background: #fee500; color: #000; border-radius: 12px; padding: 10px 20px;">
                    카카오페이
                </button>

                <!-- 찜하기 버튼 -->
                <form action="/shop/wishlist/add" method="post" class="d-inline" id="wishlist-form">
                    <button type="submit" class="btn btn-outline-secondary" onclick="checkLoginBeforeWishlist(event)">찜하기</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
    // 페이지 로드 시, 상품명에 "헬스"가 포함되어 있는지 체크
    window.onload = function() {
        var productName = document.getElementById("productName").value;

        // "헬스"가 포함된 경우 트레이너 선택 폼 숨기기
        if (productName.indexOf('헬스') !== -1) {
            document.getElementById("trainer-selection-form").style.display = 'none';
        }
    };

    // 결제하기 버튼 클릭 시 로그인 여부 확인
    function checkLoginBeforePay() {
        if (!isLoggedIn()) {
            alert("로그인 후 결제할 수 있습니다.");
            location.href = "/login"; // 로그인 페이지로 리디렉션
        } else {
            requestPay(); // 로그인 상태이면 결제 요청 함수 실행
        }
    }

    // 찜하기 버튼 클릭 시 로그인 여부 확인
    function checkLoginBeforeWishlist(event) {
        if (!isLoggedIn()) {
            alert("로그인 후 찜하기를 할 수 있습니다.");
            event.preventDefault(); // 폼 제출 막기
            location.href = "/login"; // 로그인 페이지로 리디렉션
        }
    }

    // 로그인 여부 확인 함수
    function isLoggedIn() {
        return ${empty sessionScope.loginid ? 'false' : 'true'}; // sessionScope.loginid 값이 존재하면 true, 없으면 false 반환
    }

    var IMP = window.IMP; // 아임포트 객체 초기화
    IMP.init("imp51232683"); // 가맹점 식별코드 설정

    function requestPay() {
        // JSP에서 전달받은 상품 정보 활용
        var productName = document.getElementById("productName").value; // 상품 이름
        var productAmount = parseInt(document.getElementById("productPrice").value.replace('₩', '').replace(',', '')); // 상품 가격 (₩ 기호 및 쉼표 제거)
        var merchantUid = "ORD" + new Date().getTime(); // 고유 주문번호 생성

        // 로그인된 고객 정보
        var buyerName = "${cust.custName}";  // 고객 이름
        var buyerPhone = "${cust.custPhone}";  // 고객 전화번호
        var buyerGender = "${cust.custGender}";  // 고객 성별
        var buyerAge = "${cust.custAge}";  // 고객 나이
        var buyerAddr = "${cust.custAddress}";  // 고객 주소

        // 결제 요청
        IMP.request_pay({
            pg: "kakaopay.TC0ONETIME", // 카카오페이 단건결제
            pay_method: "card", // 결제 수단
            merchant_uid: merchantUid, // 주문번호
            name: productName, // 상품명
            amount: productAmount, // 결제 금액
            buyer_name: buyerName, // 구매자 이름
            buyer_tel: buyerPhone, // 구매자 전화번호
            buyer_gender: buyerGender, // 구매자 성별
            buyer_age: buyerAge, // 구매자 나이
            buyer_addr: buyerAddr, // 구매자 주소
        }, function (rsp) { // 콜백 함수
            if (rsp.success) {
                $.ajax({
                    url: "/pay/complete",
                    type: "POST",
                    data: {
                        paymentId: rsp.merchant_uid,  // 요청의 고유 주문번호
                        productName: $("#productName").val(), // 상품 이름
                        productPrice: productAmount, // 상품 가격
                        custId: "${cust.custId}"  // 고객 ID
                    },
                    success: function () {
                        alert("결제가 완료되었습니다.");
                        location.href = "/pay/complete?payment_id=" + rsp.merchant_uid + "&imp_uid=" + rsp.imp_uid;
                    },
                    error: function () {
                        alert("결제 정보를 처리하는 데 문제가 발생했습니다.");
                    }
                });
            } else {
                // 결제 실패 처리
                alert("결제가 실패되었습니다: " + rsp.error_msg);
            }
        });
    }
</script>

<!-- Bootstrap JS (필수) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
