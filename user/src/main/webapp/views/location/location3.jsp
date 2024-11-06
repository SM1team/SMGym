<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>천안역점</title>
</head>
<body>
<!-- Location Modal 3 (천안역점) -->
<div class="portfolio-modal modal fade" id="locationModal3" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-bs-dismiss="modal">
                <img src="<c:url value='/assets/img/close-icon.svg'/>" alt="Close modal" />
            </div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="modal-body">
                            <h2 class="text-uppercase">천안역점</h2>
                            <p class="item-intro text-muted">주소: 충청남도 천안시 동남구 원성동 789</p>
                            <img class="img-fluid d-block mx-auto" src="<c:url value='/assets/img/location/cheonan.jpg'/>" alt="천안역점" />
                            <p>천안역점은 편리한 접근성과 함께 최고 수준의 서비스를 제공합니다. 다양한 운동 옵션과 전문적인 트레이너가 여러분을 도와드립니다.</p>
                            <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                <i class="fas fa-xmark me-1"></i>
                                닫기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
