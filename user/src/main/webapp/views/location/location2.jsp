<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09e7accab0008dfff9a01527bd9d411f"></script>

<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>아산역점</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

  <style>
    #map2 {
      width: 100%;
      height: 500px;
      border: 2px solid darkred;
    }
  </style>

  <script>
    let map2 = {
      map: null,
      marker: null,
      initMap: function () {
        let mapContainer = document.getElementById('map2');
        let mapOption = {
          center: new kakao.maps.LatLng(36.7989764, 127.0750025),
          level: 5
        };

        this.map = new kakao.maps.Map(mapContainer, mapOption);
        let mapTypeControl = new kakao.maps.MapTypeControl();
        this.map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

        let zoomControl = new kakao.maps.ZoomControl();
        this.map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

        let markerPosition = new kakao.maps.LatLng(36.7989764, 127.0750025);
        this.marker = new kakao.maps.Marker({
          position: markerPosition
        });
        this.marker.setMap(this.map);

        let iwContent = '<div>Hello World!</div><img style="width:100px;" src="<c:url value="/img/health1.jpg"/>">';
        let infowindow = new kakao.maps.InfoWindow({
          position: markerPosition,
          content: iwContent
        });

        kakao.maps.event.addListener(this.marker, 'mouseover', function () {
          infowindow.open(map1.map, map1.marker);
        });
        kakao.maps.event.addListener(this.marker, 'mouseout', function () {
          infowindow.close();
        });
        kakao.maps.event.addListener(this.marker, 'click', function () {
          window.location.href = 'http://sunmoon.ac.kr';
        });
      }
    };

    $(document).ready(function () {
      $('#locationModal2').on('shown.bs.modal', function () {
        if (!map2.map) {
          map2.initMap(); // 모달이 열릴 때 지도를 초기화
        } else {
          map2.map.relayout(); // 이미 지도가 생성되어 있다면 크기 재조정
          map2.map.setCenter(new kakao.maps.LatLng(36.7989764, 127.0750025));
        }
      });
    });
  </script>
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
              <div id="map2"></div>
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
