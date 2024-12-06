<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 상세 페이지</title>
    <!-- Bootstrap CSS -->
    <style>
        body {
            background-color: #000; /* 페이지 배경 검정색 */
            color: #fff; /* 텍스트 색상 흰색 */
        }
        .content-container {
            background-color: #1a1a1a; /* 카드 및 콘텐츠 컨테이너 배경 */
            border-radius: 10px; /* 컨테이너 모서리 둥글게 */
            padding: 20px; /* 내부 여백 */
        }

    </style>

</head>
<body>
<div class="container mt-5">
    <!-- 상단 검정 배경의 여백 -->
    <div class="row" style="background-color: #000; height: 200px;"></div> <!-- 상단 여백 -->
    <!-- 메인 콘텐츠 -->
    <div class="row content-container" style="background-color: #000; color: #fff; padding: 20px; border-radius: 10px;">

        <!-- 왼쪽: 상품 이미지 -->
        <div class="col-md-6 d-flex justify-content-center align-items-center">
            <img src="/assets/img/${product.productImg}"
                 alt="Product Image"
                 class="img-fluid"
                 style="width: 700px; height: 700px; object-fit: cover; border-radius: 10px;">
        </div>
        <!-- 오른쪽: 상품 정보 -->
        <div class="col-md-6">
            <!-- 상품 정보 표시 -->
            <form id="product-form" style="background-color: #1a1a1a; padding: 20px; border-radius: 10px;">
                <div class="form-group">
                    <label for="productName" style="color: #fff;">상품 이름</label>
                    <input type="hidden" id="productName" name="productName" value="${product.productName}" />
                    <input type="text" class="form-control" style="background-color: #000; color: #fff; border: none;" value="${product.productName}" readonly />
                </div>

                <div class="form-group">
                    <label for="productPrice" style="color: #fff;">가격</label>
                    <input type="text" id="productPrice" class="form-control" style="background-color: #000; color: #fff; border: none;" value="₩<fmt:formatNumber value='${product.productPrice}' type='number' groupingUsed='true' />원" readonly />
                </div>

                <!-- 트레이너 선택 폼 -->
                <div id="trainer-selection-form" class="form-group">
                    <label for="trainerSelection" style="color: #fff;">트레이너 선택</label>
                    <select id="trainerSelection" name="trainerId" class="form-control" style="background-color: #000; color: #fff; border: none;">
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

            <div class="form-actions mt-3">
                <!-- 결제하기 버튼 -->
                <button id="btn-pay-ready"
                        onclick="checkLoginBeforePay()"
                        style="background: #fee500; color: #000; border-radius: 12px; padding: 10px 20px;">
                    카카오페이
                </button>

                <!-- 찜하기 버튼 -->
                <form action="/shop/wishlist/add" method="post" class="d-inline" id="wishlist-form">
                    <button type="submit" class="btn btn-outline-secondary" onclick="checkLoginBeforeWishlist(event)" style="color: #fff; border: 1px solid #fff;">
                        찜하기
                    </button>
                </form>
            </div>
        </div>

    </div>


    <!-- 하단 검정 배경의 여백 -->
    <div class="row" style="background-color: #000; height: 600px; color: #aaa; display: flex; align-items: center; justify-content: center; text-align: center;">

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
            var productName = document.getElementById("productName").value;
            var productAmount = parseInt(document.getElementById("productPrice").value.replace('₩', '').replace(',', ''));
            var merchantUid = "ORD" + new Date().getTime();

            var buyerName = "${cust.custName}";
            var buyerPhone = "${cust.custPhone}";
            var buyerGender = "${cust.custGender}";
            var buyerAge = "${cust.custAge}";
            var buyerAddr = "${cust.custAddress}";

            IMP.request_pay({
                pg: "kakaopay.TC0ONETIME",
                pay_method: "card",
                merchant_uid: merchantUid,
                name: productName,
                amount: productAmount,
                buyer_name: buyerName,
                buyer_tel: buyerPhone,
                buyer_gender: buyerGender,
                buyer_age: buyerAge,
                buyer_addr: buyerAddr,
            }, function (rsp) {
                if (rsp.success) {
                    $.ajax({
                        url: "/pay/complete",
                        type: "POST",
                        data: {
                            paymentId: rsp.merchant_uid,
                            productName: $("#productName").val(),
                            productPrice: productAmount,
                            custId: "${cust.custId}"
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
                    alert("결제가 실패되었습니다: " + rsp.error_msg);
                }
            });
        }
    </script>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
