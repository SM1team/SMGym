<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--<script>--%>
<%--  // 페이지 로드 후 화면을 중간으로 이동--%>
<%--  window.onload = function() {--%>
<%--    // 페이지 높이의 50% 위치로 스크롤--%>
<%--    const middlePosition = document.body.scrollHeight / 2.5;--%>
<%--    window.scrollTo({--%>
<%--      top: middlePosition,--%>
<%--      behavior: "smooth" // 부드러운 스크롤 효과--%>
<%--    });--%>
<%--  };--%>
<%--</script>--%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 상세 페이지</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <style>
        .custom-card {
            text-decoration: none; /* 링크의 기본 밑줄 제거 */
            color: inherit; /* 부모 요소의 색상을 상속받도록 설정 */
            display: block; /* 링크를 블록 요소로 설정해 전체 카드 클릭 가능하도록 */
            border-radius: 10px; /* 모서리 둥글게 */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
            background-color: #1a1a1a; /* 카드 배경을 페이지보다 밝은 검정색으로 설정 */
            transition: all 0.3s ease-in-out; /* 카드 hover 시 부드러운 전환 효과 */
            border: 2px solid #ae00c7; /* 기본 보라색 테두리 */

            /* 크기와 비율 설정 */
            width: 500px; /* 고정된 가로 크기 */
            height: 100%; /* 고정된 세로 크기 */
            position: relative; /* 내용 위치 설정 */
        }

        .custom-card:hover {
            transform: translateY(-5px); /* 살짝 위로 이동 */
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2); /* 그림자 강화 */
            border-color: #ae00c7; /* 카드 hover 시 테두리 색을 #ae00c7로 변경 */
        }

        .custom-card .card-body {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 100%;
            text-align: center;
        }

        /* 제품명 스타일 */
        .custom-card h5 {
            font-weight: bold;
            font-size: 1.5rem; /* 약간 큰 텍스트 */
            color: #ae00c7; /* 기본 보라색 텍스트 */
            margin-bottom: 10px;
            transition: color 0.3s ease; /* 텍스트 색상 전환 효과 */
        }

        /* 가격 스타일 */
        .custom-card .text-center {
            font-size: 1.5rem; /* 약간 큰 텍스트 */
            color: #ae00c7; /* 기본 보라색 텍스트 */
        }

        .custom-card:hover h5,
        .custom-card:hover .text-center {
            color: #ae00c7; /* 마우스 hover 시 텍스트 색상이 #ae00c7로 변경 */
        }

    </style>
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
        .related-products {
            display: flex;
            gap: 20px; /* 카드 간격 */
            overflow-x: auto; /* 가로 스크롤 가능 */
            padding: 20px 0;
            margin-top: 50px;
        }
        .related-products .product-card {
            flex: 0 0 auto; /* 가로 스크롤을 위해 고정 폭 사용 */
            width: 200px; /* 카드 너비 */
            hight: 200px;
            background-color: #1a1a1a; /* 카드 배경 */
            border-radius: 10px;
            padding: 15px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            text-decoration: none; /* 링크에 밑줄이 생기지 않도록 설정 */
            color: #f1f1f1;
            border: 2px solid transparent; /* 초기 테두리는 투명 */
            transition: all 0.3s ease-in-out; /* 부드러운 전환 효과 */
        }
        .related-products .product-card:hover {
            border-color: #ae00c7; /* 호버 시 보라색 */
            transform: translateY(-5px); /* 살짝 위로 이동 */
            color: #ae00c7; /* 마우스 hover 시 텍스트 색상이 #ae00c7로 변경 */
        }
        /* 카드 hover 시 텍스트 색상 변경 */
        .custom-card:hover h5,
        .custom-card:hover .text-center {
            color: #ae00c7; /* 마우스 hover 시 텍스트 색상이 #ae00c7로 변경 */
        }
        /* 카드 hover 효과 */
        .custom-card:hover {
            transform: translateY(-5px); /* 살짝 위로 이동 */
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2); /* 그림자 강화 */
            border-color: #ae00c7; /* 카드 hover 시 테두리 색을 #ae00c7로 변경 */
        }
        /* 링크의 밑줄 제거 */
        .custom-card a {
            text-decoration: none; /* 링크에 밑줄이 생기지 않도록 설정 */
        }

    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            AOS.init({
                duration: 800, // 애니메이션 지속 시간
                once: false,   // 스크롤할 때마다 애니메이션 재실행
            });
        });
    </script>
</head>
<body>

<div class="container mt-5">
<%--    여백--%>
    <div class="row" style="background-color: #000; height: 200px;"></div>
    <!-- 상품 정보 표시 -->
    <div class="row content-container" data-aos="fade-left">
        <!-- 왼쪽: 상품 정보 카드 디자인 -->
        <div class="col-md-6 d-flex justify-content-center align-items-center" style="height: 400px;">
            <a href="<c:url value='/shop/detail'/>?productNo=${product.productNo}" class="card custom-card h-100">
                <!-- Product details -->
                <div class="card-body p-4">
                    <div class="text-center">
                        <!-- Product name -->
                        <h5 class="fw-bolder">${product.productName}</h5>
                        <!-- Product price -->
                        ₩<fmt:formatNumber value="${product.productPrice}" type="number" groupingUsed="true" />
                    </div>
                </div>
            </a>
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
                    <button type="submit" class="btn btn-outline-secondary" onclick="checkLoginBeforeWishlist(event)" style="color: #1a1a1a; border: 1px solid #fff;background: #f1f1f1">
                        찜하기
                    </button>
                </form>
            </div>
        </div>
    </div>

    <!-- 관련 상품 섹션 -->
    <div class="related-products" data-aos="fade-left">
        <c:forEach var="relatedProduct" items="${relatedProducts}">
            <a href="<c:url value='/shop/detail'/>?productNo=${relatedProduct.productNo}" class="product-card">
                <h5>${relatedProduct.productName}</h5>
                <p>₩<fmt:formatNumber value="${relatedProduct.productPrice}" type="number" groupingUsed="true" /></p>
            </a>
        </c:forEach>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
