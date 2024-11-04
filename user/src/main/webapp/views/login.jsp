<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />"> <!-- styles.css 링크 -->
    <style>
        body {
            background-color: #f0f2f5;
        }
        .masthead {
            background: url('path/to/your/background-image.jpg') no-repeat center center;
            background-size: cover;
            color: white;
            padding: 80px 0;
            text-align: center;
        }
        .login-container {
            margin-top: 30px;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #007bff;
            color: white;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }
        .card-footer {
            background-color: #f8f9fa;
        }
        .footer-text {
            font-size: 0.9rem;
        }
        .btn-primary {
            background-color: #007bff; /* 기본 버튼 색상 변경 */
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3; /* 버튼 호버 색상 변경 */
        }
        .form-group {
            margin-bottom: 1.5rem; /* 폼 간격 증가 */
        }
    </style>
</head>
<body>
<header class="masthead">
    <div class="container">
        <div class="masthead-subheading">환영합니다!</div>
        <div class="masthead-heading text-uppercase">로그인 페이지입니다</div>
        <a class="btn btn-secondary btn-xl text-uppercase" href="/"><i class="fas fa-home"></i> 메인 페이지로 돌아가기</a>
    </div>
</header>

<div class="container login-container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header text-center">
                    <!-- <h3>로그인</h3> 삭제 -->
                </div>
                <div class="card-body">
                    <form action="<c:url value='/login' />" method="post">
                        <div class="form-group">
                            <label for="username">사용자 이름</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="form-group">
                            <label for="password">비밀번호</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">로그인</button>
                    </form>
                </div>
                <div class="card-footer text-center">
                    <small class="footer-text">계정이 없으신가요? <a href="<c:url value='/signup' />">여기에서 등록하세요</a></small>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
