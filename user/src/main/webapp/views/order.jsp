<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-11-25
  Time: 오전 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        var IMP = window.IMP; // 아임포트 객체 초기화
        IMP.init("imp51232683"); // 가맹점 식별코드 설정

        function requestPay() {
            // 상품 정보는 서버나 페이지에서 동적으로 가져와야 함
            var productName = "노르웨이 회전 의자"; // 상품명
            var productAmount = 64900; // 결제 금액 (예: 상품 가격)
            var merchantUid = "ORD" + new Date().getTime(); // 고유 주문번호 생성

            // 결제 요청
            IMP.request_pay({
                pg: "kakaopay.TC0ONETIME", // 카카오페이 단건결제
                pay_method: "card", // 결제 수단
                merchant_uid: merchantUid, // 주문번호
                name: productName, // 상품명
                amount: productAmount, // 결제 금액
                buyer_email: "gildong@gmail.com", // 구매자 이메일 (예제)
                buyer_name: "홍길동", // 구매자 이름 (예제)
                buyer_tel: "010-4242-4242", // 구매자 전화번호 (예제)
                buyer_addr: "서울특별시 강남구 신사동", // 구매자 주소 (예제)
                buyer_postcode: "01181" // 구매자 우편번호 (예제)
            }, function (rsp) { // 콜백 함수
                if (rsp.success) {
                    // 결제 성공 시 처리
                    alert("결제가 완료되었습니다. 주문번호: " + rsp.merchant_uid);
                    // 서버에 검증 요청
                    $.ajax({
                        type: 'POST',
                        url: '/verify/' + rsp.imp_uid, // 결제 검증 URL
                        success: function (data) {
                            if (data.response.amount === rsp.paid_amount) {
                                alert("결제 검증 성공!");
                            } else {
                                alert("결제 금액 불일치로 실패!");
                            }
                        },
                        error: function () {
                            alert("서버와의 통신 오류로 결제 검증 실패!");
                        }
                    });
                } else {
                    // 결제 실패 시 처리
                    alert("결제가 실패되었습니다: " + rsp.error_msg);
                }
            });
        }

    </script>
    <meta charset="UTF-8">
    <title>Sample Payment</title>
</head>
<body>
<button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
</body>
</html>