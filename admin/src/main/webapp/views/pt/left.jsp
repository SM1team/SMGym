
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- partial -->
<%--        여기서부터 사이드바 : 349까지--%>
<div class="container-fluid page-body-wrapper">
    <!-- partial:partials/_sidebar.html -->
    <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">


            <li class="nav-item nav-category">여기서 UI 패널 조절</li>

            <c:choose>
            <c:when test="${sessionScope.loginid.role.roleId == 2}">

            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="collapse" href="#form-elements" aria-expanded="false"
                   aria-controls="form-elements">
                    <i class="menu-icon mdi mdi-card-text-outline"></i>
                    <span class="menu-title">트레이너 출석</span>
                    <i class="menu-arrow"></i>
                </a>
                <div class="collapse" id="form-elements">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"><a class="nav-link" href="/checkin">출근
                            </a></li>
                    </ul>
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"><a class="nav-link" href="/checkout">퇴근
                            </a></li>
                    </ul>
                </div>

            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="collapse" href="#auth1" aria-expanded="false"
                   aria-controls="auth1">
                    <i class="menu-icon mdi mdi-account-circle-outline"></i>
                    <span class="menu-title">회원관리</span>
                    <i class="menu-arrow"></i>
                </a>
                <div class="collapse" id="auth1">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"><a class="nav-link" href="/cust"> 회원 조회</a></li>
                    </ul>
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"><a class="nav-link" href="/pt"> PT관리</a></li>
                    </ul>
                </div>
            </li>
            </c:when>
            <c:otherwise>

<%--            <li class="nav-item">--%>
<%--                <a class="nav-link" data-bs-toggle="collapse" href="#form-elements" aria-expanded="false"--%>
<%--                   aria-controls="form-elements">--%>
<%--                    <i class="menu-icon mdi mdi-card-text-outline"></i>--%>
<%--                    <span class="menu-title">트레이너 출석</span>--%>
<%--                    <i class="menu-arrow"></i>--%>
<%--                </a>--%>
<%--                <div class="collapse" id="form-elements2">--%>
<%--                    <ul class="nav flex-column sub-menu">--%>
<%--                        <li class="nav-item"><a class="nav-link" href="/checkin">출근--%>
<%--                        </a></li>--%>
<%--                    </ul>--%>
<%--                    <ul class="nav flex-column sub-menu">--%>
<%--                        <li class="nav-item"><a class="nav-link" href="/checkout">퇴근--%>
<%--                        </a></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>

<%--            </li>--%>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="collapse" href="#charts" aria-expanded="false"
                   aria-controls="charts">
                    <i class="menu-icon mdi mdi-chart-line"></i>
                    <span class="menu-title">차트</span>
                    <i class="menu-arrow"></i>
                </a>
                <div class="collapse" id="charts">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/chart/gender"/>" >방문 현황</a></li>
                    </ul>

                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/chart/sales"/>" >매출 현황</a></li>
                    </ul>

                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="collapse" href="#tables" aria-expanded="false"
                   aria-controls="tables">
                    <i class="menu-icon mdi mdi-table"></i>
                    <span class="menu-title">상품관리</span>
                    <i class="menu-arrow"></i>
                </a>
                <div class="collapse" id="tables">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/product/add"/>" >상품추가</a></li>
                    </ul>
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/product/get"/>" >상품조회</a></li>
                    </ul>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="collapse" href="#notice" aria-expanded="false"
                   aria-controls="notice">
                    <i class="menu-icon mdi mdi-bell-ring"></i>
                    <span class="menu-title">공지사항 관리</span>
                    <i class="menu-arrow"></i>
                </a>
                <div class="collapse" id="notice">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/notice"/>">공지사항 조회</a></li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/notice/write"/>">공지사항 추가</a></li>
                    </ul>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="collapse" href="#icons" aria-expanded="false"
                   aria-controls="icons">
                    <i class="menu-icon mdi mdi-layers-outline"></i>
                    <span class="menu-title">트레이너 관리</span>
                    <i class="menu-arrow"></i>
                </a>
                <div class="collapse" id="icons">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/trainer"/>">트레이너 조회</a></li>

                        <li class="nav-item"><a class="nav-link" href="<c:url value="/traineradd"/>">트레이너 추가</a></li>

                        <li class="nav-item"><a class="nav-link" href="<c:url value="/trainercheck"/>">트레이너 출결</a></li>
                    </ul>
                </div>

            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false"
                   aria-controls="auth">
                    <i class="menu-icon mdi mdi-account-circle-outline"></i>
                    <span class="menu-title">회원관리</span>
                    <i class="menu-arrow"></i>
                </a>
                <div class="collapse" id="auth">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"><a class="nav-link" href="/cust"> 회원 조회</a></li>


                    </ul>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/websocket">
                    <i class="menu-icon mdi mdi-message"></i>
                    <span class="menu-title">문의 관리</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/reservation">
                    <i class="menu-icon mdi mdi-calendar-check"></i>
                    <span class="menu-title">예약관리</span>
                </a>
            </li>
            </c:otherwise>
            </c:choose>

        </ul>
    </nav>
    <%--        여기까지--%>
