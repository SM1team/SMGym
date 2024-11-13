<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>탕정역점</title>
  <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=737d0cec6c3eb294f25b1661d51a9f29"></script>

  <style>
    #map {
      width: 100%;
      height: 600px;
      border: 3px solid red;
      border-radius: 8px;
    }

    .modal-dialog {
      max-width: 900px;
    }
  </style>
</head>
<body>

<!-- Location Modal 1 -->
<div class="portfolio-modal modal fade" id="locationModal1" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="close-modal" data-bs-dismiss="modal">
        <img src="<c:url value='/assets/img/close-icon.svg'/>" alt="Close modal" />
      </div>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-10">
            <div class="modal-body">
              <h2 class="text-uppercase">탕정역점</h2>
              <p class="item-intro text-muted">주소: 충청남도 아산시 탕정면 탕정리 123</p>
              <div id="map"></div>
              <p>탕정역점은 최신 운동 기구와 다양한 프로그램을 통해 회원 여러분의 목표 달성을 돕습니다.</p>
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

<script type="text/javascript">
  var map = null;

  function initMap() {
    try {
      if (!map) {
        // 지도 컨테이너 설정
        var mapContainer = document.getElementById('map');
        var mapOption = {
          center: new kakao.maps.LatLng(36.7785, 127.0856),
          level: 3
        };

        // Kakao Map 객체 생성
        map = new kakao.maps.Map(mapContainer, mapOption);

        // 마커 설정
        var markerPosition = new kakao.maps.LatLng(36.7785, 127.0856);
        var marker = new kakao.maps.Marker({ position: markerPosition });
        marker.setMap(map);
      } else {
        // 이미 지도 초기화가 되어 있으면, 레이아웃 재조정
        map.relayout();
        map.setCenter(new kakao.maps.LatLng(36.7785, 127.0856));
      }
    } catch (error) {
      console.error('지도 초기화 중 오류 발생:', error);
    }
  }

  // 모달이 열린 후에 지도 초기화 함수 호출
  $('#locationModal1').on('shown.bs.modal', function () {
    initMap();
  });
</script>

</body>
</html>
