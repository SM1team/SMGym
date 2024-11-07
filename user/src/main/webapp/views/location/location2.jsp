<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>아산역점</title>
</head>
<body>
<!-- Location Modal 2 (아산역점) -->
<div class="portfolio-modal modal fade" id="locationModal2" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="close-modal" data-bs-dismiss="modal">
        <img src="<c:url value='/assets/img/close-icon.svg'/>" alt="Close modal" />
      </div>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="modal-body">
              <h2 class="text-uppercase">아산역점</h2>
              <p class="item-intro text-muted">주소: 충청남도 아산시 배방면 동아리 456</p>
              <img class="img-fluid d-block mx-auto" src="<c:url value='/assets/img/location/asan.jpg'/>" alt="아산역점" />
              <p>아산역점은 회원님들의 편리한 접근성을 고려하여 최적의 위치에 자리 잡고 있습니다. 다양한 운동 프로그램과 함께 여러분을 기다리고 있습니다.</p>
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
