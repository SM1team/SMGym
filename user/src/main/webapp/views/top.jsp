<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-11-06
  Time: 오후 1:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Agency - Start Bootstrap Theme</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="<c:url value='/assets/favicon.ico'/>" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="<c:url value='/css/styles.css'/>" rel="stylesheet" />
    <style>
        /* CSS 스타일 추가 */
        .counter {
            font-size: 2rem; /* 숫자 크기 조정 */
            color: #ffcc00; /* 숫자 색상 조정 */
            transition: all 0.5s ease; /* 애니메이션 효과 추가 */
        }
    </style>
</head>
<body id="page-top">
<%--<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">--%>
<%--    <div class="container">--%>
<%--        <a class="navbar-brand" href="#page-top">--%>
<%--            <img src="<c:url value='/assets/img/navbar-logo.svg'/>" alt="Navbar Logo" />--%>
<%--        </a>--%>
<%--        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">--%>
<%--            Menu--%>
<%--            <i class="fas fa-bars ms-1"></i>--%>
<%--        </button>--%>
<%--        <div class="collapse navbar-collapse" id="navbarResponsive">--%>
<%--            <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">--%>
<%--                <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>--%>
<%--                <li class="nav-item"><a class="nav-link" href="#trainer">Trainer Profile</a></li>--%>
<%--                <li class="nav-item"><a class="nav-link" href="#about">About</a></li>--%>
<%--                <li class="nav-item"><a class="nav-link" href="#location">Location</a></li>--%>
<%--                <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>--%>

<%--                <!-- Dropdown for Sign In and Sign Up -->--%>
<%--                <li class="nav-item dropdown">--%>
<%--                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                        Account--%>
<%--                    </a>--%>
<%--                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">--%>
<%--                        <li><a class="dropdown-item" href="<c:url value='/login'/>">Login</a></li>--%>
<%--                        <li><a class="dropdown-item" href="<c:url value='/signup'/>">Sign Up</a></li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>
<header class="masthead">
    <div class="container">
        <div class="masthead-subheading">Welcome To Our Gym!</div>
        <div class="masthead-heading text-uppercase">It's Nice To Meet You</div>
        <a class="btn btn-primary btn-xl text-uppercase" href="#services">Tell Me More</a>
        <div class="mt-4 text-center text-white">
            <h4 class="font-weight-light">
                <span class="counter" data-target="120">0</span>명의 회원과
                <span class="counter" data-target="3">0</span>명의 전문 트레이너가 함께하는 활기찬 공간!
            </h4>
        </div>
    </div>
</header>

<script>
    // 모든 카운터를 선택
    const counters = document.querySelectorAll('.counter');

    // 각 카운터에 대해 숫자 증가 기능을 설정
    counters.forEach(counter => {
        const updateCount = () => {
            // 목표 숫자 가져오기
            const target = +counter.getAttribute('data-target');
            // 현재 숫자 가져오기
            const count = +counter.innerText;
            // 증가 속도 설정
            const increment = target / 200; // 목표 숫자를 200으로 나눔

            // 목표 숫자에 도달할 때까지 증가
            if (count < target) {
                counter.innerText = Math.ceil(count + increment); // 현재 숫자 증가
                setTimeout(updateCount, 10); // 10ms 후에 다시 업데이트
            } else {
                counter.innerText = target; // 목표 숫자 도달 시, 목표 숫자로 설정
            }
        };

        updateCount(); // 카운터 시작
    });
</script>
