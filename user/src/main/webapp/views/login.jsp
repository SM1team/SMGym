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
                            <label for="username">사용자 id</label>
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
                    <small class="footer-text">계정이 없으신가요? <a href="<c:url value='/register' />">여기에서 등록하세요</a></small>
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