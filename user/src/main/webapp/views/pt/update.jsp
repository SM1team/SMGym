<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상세 조회</title>

    <!-- AOS 애니메이션 CSS 라이브러리 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" />
    <!-- 스타일 -->
    <style>
        /* 전체 페이지 스타일 */
        body {
            background-color: #000000; /* 검정 배경 */
            color: #ffffff; /* 텍스트 색상 흰색 */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            padding: 20px;
            max-width: 800px;
            margin: 0 auto;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #ae00c7;
        }

        /* 카드 스타일 */
        .custom-card {
            background-color: #1a1a1a; /* 어두운 회색 배경 */
            border: 2px solid #ae00c7; /* 어두운 테두리 */
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.5);
            transition: all 0.3s ease-in-out;
        }


        label {
            font-size: 1.2rem;
            margin-bottom: 10px;
            display: block;
            color: #ffffff;
        }

        textarea {
            width: 100%;
            height: 200px;
            background-color: #262626;
            color: #ffffff;
            border: 1px solid #444;
            border-radius: 5px;
            padding: 10px;
            resize: none;
        }

        /* 부드러운 스크롤 효과 */
        html {
            scroll-behavior: smooth;
        }
    </style>

    <!-- AOS 애니메이션 라이브러리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            AOS.init({
                duration: 800, // 애니메이션 지속 시간
                once: false
            });
        });

        window.onload = function () {
            // 페이지 높이 50% 위치로 스크롤
            const middlePosition = document.body.scrollHeight / 2.5;
            window.scrollTo({
                top: middlePosition,
                behavior: "smooth"
            });
        };
    </script>
</head>

<body>
<div class="container">
    <h2 data-aos="fade-up">상세 조회</h2>

    <!-- 상세 조회 카드 -->
    <div class="custom-card" data-aos="fade-up">
        <form action="/pt/update" method="post">
            <!-- PT 번호 (숨김 필드) -->
            <input type="hidden" name="ptNo" value="${pt.ptNo}" />

            <!-- PT 내용 -->
            <div class="form-group">
                <label for="ptContent">PT 내용</label>
                <textarea id="ptContent" name="ptContent" readonly>${pt.ptContent}</textarea>
            </div>
        </form>
    </div>
</div>
</body>
</html>
