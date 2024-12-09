<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Trainer Profile - Trainer 1</title>
    <link rel="stylesheet" href="<c:url value='/assets/css/styles.css' />">
    <style>
        body {
            background: #000;
            color: #fff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .profile-container {
            display: flex;
            align-items: flex-start; /* 수직 방향 정렬을 상단으로 조정 */
            justify-content: center;
            padding: 50px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .profile-photo {
            flex: 0 0 auto;
            margin-right: 100px; /* 사진과 텍스트 간의 여백을 늘림 */
            margin-top: -20px; /* 사진을 위로 올리는 효과 */
        }
        .profile-photo img {
            border-radius: 50%;
            width: 300px;
            height: 400px;
            object-fit: cover;
            border: 3px solid #fff;
        }
        .profile-details {
            flex: 1;
            text-align: left;
            padding-left: 100px; /* 텍스트와 사진 간 여백 추가 */
        }
        .profile-details h2 {
            font-size: 2.5rem;
            margin-bottom: 10px;
            color: #ffcc00;
        }
        .profile-details p {
            margin-bottom: 20px;
            color: #ccc;
        }
        .profile-details ul {
            list-style: disc;
            margin-left: 20px;
            margin-bottom: 20px;
        }
        .profile-details ul li {
            margin-bottom: 10px;
        }
        .profile-details .stars {
            font-size: 1.2rem;
        }
        .profile-actions {
            margin-top: 20px;
        }
        .profile-actions .btn {
            margin-right: 10px;
        }
    </style>
</head>
<body>
<div class="profile-container">
    <!-- Trainer photo (왼쪽에 위치, 위로 올림) -->
    <div class="profile-photo">
        <img class="img-fluid" src="<c:url value='/assets/img/logos/teacher1.jpg' />" alt="지피티" style="width: 300px; height: 400px; object-fit: cover; border-radius: 10px; transition: border-color 0.3s ease;" />
    </div>
    <!-- Trainer details (사진 오른쪽에 위치) -->
    <div class="profile-details">
        <h2>지피티</h2>
        <p>전문 PT 트레이너</p>
        <h5>특화 분야:</h5>
        <p>다이어트 및 웨이트 트레이닝의 전문가로, 체중 감량과 근육 증진을 목표로 합니다.</p>

        <h5>자격증:</h5>
        <ul>
            <li>다이어트 전문가 인증</li>
            <li>ACE(미국 스포츠 의학 협회) 인증 퍼스널 트레이너</li>
        </ul>

        <h5>경력:</h5>
        <p>5년 이상의 경험으로 고객 맞춤형 프로그램을 제공합니다.</p>

        <h5>수상 내역:</h5>
        <ul>
            <li>2023년 대한민국 피트니스 대회 1위</li>
            <li>2022년 체중 감량 챌린지 2위</li>
        </ul>

        <div class="profile-actions">
            <a href="/" class="btn btn-primary btn-xl text-uppercase">
                메인으로 돌아가기
            </a>
            <a href="/qna" class="btn btn-success btn-xl text-uppercase">
                <i class="fas fa-comments me-1"></i>
                트레이너와 1:1 톡톡 문의하기
            </a>
        </div>
    </div>
</div>
</body>
</html>
