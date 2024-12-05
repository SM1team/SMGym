<!-- views/index.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="nav.jsp" %>
<%@ include file="trainer/trainer1.jsp" %>
<%@ include file="trainer/trainer2.jsp" %>
<%@ include file="trainer/trainer3.jsp" %>
<%@ include file="location/location1.jsp" %>
<%@ include file="location/location2.jsp" %>
<%@ include file="location/location3.jsp" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>



<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="<c:url value="/js/index.js"/> "></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09e7accab0008dfff9a01527bd9d411f"></script>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>



<%--HighCharts Lib  start --%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<%--HighCharts Lib  end --%>

<%--     Web Socket Lib    --%>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>


<div class="container" style="max-width: 100%">
    <div class="row">
        <c:choose>
            <c:when test="${top == null}">
                <jsp:include page="top.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${top}.jsp"/>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${center == null}">
                <jsp:include page="center.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${center}.jsp"/>
            </c:otherwise>
        </c:choose>

    </div>
</div>

<!-- Footer-->
<footer class="footer">

    <style>
        footer {
            width: 100%;
            background-color: #000000;
            color: #f1f1f1;
            text-align: center;
            padding: 20px 0;
        }
    </style><!-- 지점들 section 색상과 동일한 배경색 -->

    <style>
        .btn-social {
            background-color: #ffffff !important; /* 배경색 흰색으로 변경 */
            color: #000000 !important; /* 아이콘 색상 검정으로 변경 */
            border: 1px solid #ccc; /* 선택적으로 테두리 추가 */
        }

    </style>
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-4 text-lg-start">Copyright &copy; Your Website 2023</div>
            <div class="col-lg-4 my-3 my-lg-0">
                <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Twitter">
                    <i class="fab fa-twitter"></i>
                </a>
                <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Facebook">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="LinkedIn">
                    <i class="fab fa-linkedin-in"></i>
                </a>
            </div>

            <div class="col-lg-4 text-lg-end">
                <a class="text-decoration-none me-3" href="#!" style="color: #f1f1f1">Privacy Policy</a>
                <a class="text-decoration-none" href="#!" style="color: #f1f1f1">Terms of Use</a>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="<c:url value='/js/scripts.js'/>"></script>

<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
