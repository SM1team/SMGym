<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Trainer Profile - Trainer 3</title>
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
            align-items: flex-start;
            justify-content: center;
            padding: 50px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .profile-photo {
            flex: 0 0 auto;
            margin-right: 100px;
        }
        .profile-photo img {
            border-radius: 50%;
            width: 300px;
            height: 300px;
            object-fit: cover;
            border: 3px solid #fff;
        }
        .profile-details {
            flex: 1;
            text-align: left;
            padding-left: 100px;
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
    <!-- Trainer photo -->
    <div class="profile-photo">
        <img class="img-fluid" src="<c:url value='/assets/img/logos/teacher3.jpg' />" alt="심으뜸"style="width: 300px; height: 400px; object-fit: cover; border-radius: 10px; transition: border-color 0.3s ease;" />
    </div>
    <!-- Trainer details -->
    <div class="profile-details">
        <h2>심으뜸</h2>
        <p>요가 및 필라테스 전문가</p>
        <h5>특화 분야:</h5>
        <p>요가, 필라테스, 재활 치료</p>

        <h5>수상 내역:</h5>
        <ul>
            <li>2019년 필라테스 챔피언십 준우승</li>
            <li>2021년 요가 마스터 대회 우승</li>
        </ul>

        <h5>경력:</h5>
        <p>8년 이상 요가 및 재활 트레이닝 경력</p>

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
