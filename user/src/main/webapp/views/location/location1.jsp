<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>탕정역점</title>
  <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=4d6c420f59edfb20579ef2824075540b"></script>

  <style>
    #map {
      width: 100%;
      height: 400px;
      border: 3px solid red;
      border-radius: 8px;
    }

    .modal-dialog {
      max-width: 900px;
    }

    #map-loading {
      display: none;
      font-size: 18px;
      color: green;
    }

    #map-error {
      display: none;
      font-size: 18px;
      color: red;
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
              <p id="map-loading">지도 로딩 중...</p>
              <p id="map-error">지도 로딩 실패! 다시 시도해 주세요.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  var map = null; // 전역 변수로 지도 객체 관리

  $('#locationModal1').on('shown.bs.modal', function () {
    var mapContainer = document.getElementById('map'); // 지도를 표시할 div
    var mapOption = {
      center: new kakao.maps.LatLng(36.799165, 127.074981), // 기본 좌표
      level: 3 // 확대 레벨
    };

    // 지도 로딩 중 메시지 표시
    document.getElementById('map-loading').style.display = 'block';
    document.getElementById('map-error').style.display = 'none'; // 오류 메시지 숨김

    try {
      if (!map) { // 지도 객체가 아직 초기화되지 않았다면
        map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성
      } else {
        map.setCenter(mapOption.center); // 기존 지도 객체가 있을 경우 센터 좌표 재설정
      }

      // 지도에 타입 컨트롤 추가
      var mapTypeControl = new kakao.maps.MapTypeControl();
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

      // 지도 확대/축소 제어 추가
      var zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

      // 모달이 열린 후 지도의 크기를 재조정
      kakao.maps.event.trigger(map, 'resize');

      // 기본 위치에 마커 추가
      var markerPosition = new kakao.maps.LatLng(36.799165, 127.074981);
      var marker = new kakao.maps.Marker({
        position: markerPosition
      });
      marker.setMap(map);

      // 인포윈도우 설정
      var iwContent = '<div>탕정역점</div><img style="width:100px;" src="<c:url value="asset/img/logos/1.jpg"/>">';
      var infowindow = new kakao.maps.InfoWindow({
        position: markerPosition,
        content: iwContent
      });

      // 마커에 마우스 오버/아웃 이벤트 추가
      kakao.maps.event.addListener(marker, 'mouseover', function() {
        infowindow.open(map, marker);
      });
      kakao.maps.event.addListener(marker, 'mouseout', function() {
        infowindow.close();
      });
      kakao.maps.event.addListener(marker, 'click', function() {
        location.href = '<c:url value="/views/location/location1.jsp"/>';
      });

      // 지도 로딩 성공 메시지 숨김
      document.getElementById('map-loading').style.display = 'none';
    } catch (error) {
      // 지도 로딩 실패 시 오류 처리
      console.error("지도 로딩 실패:", error);
      document.getElementById('map-loading').style.display = 'none';
      document.getElementById('map-error').style.display = 'block'; // 오류 메시지 표시
    }
  });
</script>

</body>
</html>
