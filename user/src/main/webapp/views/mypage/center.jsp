<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    // 페이지 로드 후 화면을 중간으로 이동
    window.onload = function() {
        // 페이지 높이의 50% 위치로 스크롤
        const middlePosition = document.body.scrollHeight / 2.5;
        window.scrollTo({
            top: middlePosition,
            behavior: "smooth" // 부드러운 스크롤 효과
        });
    };
</script>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <style>
        body {
            background-color: #000000; /* 검정 배경 */
            color: #ffffff; /* 흰색 텍스트 */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .mypage-options {
            max-width: 600px;
            margin: 100px auto; /* 페이지 가운데 정렬 */
            background-color: #1a1a1a; /* 다크한 배경 */
            padding: 30px;
            border-radius: 15px; /* 둥근 모서리 */
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.4); /* 그림자 */
            border: 2px solid #ae00c7; /* 강조 테두리 */
            text-align: center; /* 중앙 정렬 */
        }

        .mypage-options h2 {
            color: #ae00c7; /* 포인트 색상 */
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .mypage-options p {
            color: #e0e0e0; /* 약간 밝은 회색 텍스트 */
            margin-bottom: 30px;
            font-size: 1.2rem;
        }

        .buttons a {
            display: block; /* 버튼을 블록 형태로 정렬 */
            margin: 10px 0;
            padding: 15px 20px;
            border-radius: 10px;
            text-decoration: none; /* 링크 밑줄 제거 */
            color: #ffffff;
            font-size: 1.2rem;
            font-weight: bold;
            transition: all 0.3s ease; /* 부드러운 효과 */
        }

        .buttons .btn-primary {
            background-color: #ae00c7; /* 메인 포인트 색 */
            border: 2px solid #ae00c7;
        }

        .buttons .btn-primary:hover {
            background-color: #ffffff;
            color: #ae00c7;
        }

        .buttons .btn-secondary {
            background-color: #1e1e1e; /* 다크 그레이 */
            border: 2px solid #ae00c7;
        }

        .buttons .btn-secondary:hover {
            background-color: #ae00c7;
            color: #ffffff;
        }

        /* AOS 효과 */
        [data-aos] {
            opacity: 0;
            transition-property: opacity, transform;
        }

        [data-aos].aos-animate {
            opacity: 1;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            AOS.init({
                duration: 800, // 애니메이션 지속 시간
                once: true, // 한 번만 실행
            });
        });
    </script>
</head>
<body>
<div class="mypage-options" data-aos="fade-up">
    <h2>My Page</h2>
    <p>회원 정보 수정 또는 나의 결제 목록을 확인하세요.</p>

    <div class="buttons">
        <a href="/mypage/info" class="btn btn-primary">회원 정보 수정</a>
        <a href="/mypage/payment" class="btn btn-secondary">나의 결제 목록</a>
        <a href="/workout" class="btn btn-secondary">Workout Log</a>
        <a href="/mycheck" class="btn btn-secondary">출석기록</a>
    </div>
</div>
</body>
</html>
