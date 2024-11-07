<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>탕정역점</title>
</head>
<body>
<!-- Location Modal 1 (탕정역점) -->
<div class="portfolio-modal modal fade" id="locationModal1" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="close-modal" data-bs-dismiss="modal">
        <img src="<c:url value='/assets/img/close-icon.svg'/>" alt="Close modal" />
      </div>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="modal-body">
              <h2 class="text-uppercase">탕정역점</h2>
              <p class="item-intro text-muted">주소: 충청남도 아산시 탕정면 탕정리 123</p>
              <img class="img-fluid d-block mx-auto" src="<c:url value='/assets/img/location/tangjeong.jpg'/>" alt="탕정역점" />
              <p>탕정역점은 최신 운동 기구와 다양한 프로그램을 통해 회원 여러분의 목표 달성을 돕습니다. 전문 트레이너들이 상주하며 개인 맞춤형 운동을 지원합니다.</p>
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
