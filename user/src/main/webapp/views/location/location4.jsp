<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>모든 지점 위치</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="<c:url value='/js/index.js'/>"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09e7accab0008dfff9a01527bd9d411f"></script>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
  #map {
    width: 100%;
    height: 500px;
    border: 2px solid darkred;
  }
</style>

<script>
  let map = {
    map: null,
    currentLocationMarker: null, // 현재 위치 마커
    existingMarkers: [], // 기존 위치 마커들

    initMap: function () {
      let mapContainer = document.getElementById('map');
      let mapOption = {
        center: new kakao.maps.LatLng(36.7945989, 127.1045622), // 초기 중심 위치 (탕정역점)
        level: 5
      };

      this.map = new kakao.maps.Map(mapContainer, mapOption);

      let mapTypeControl = new kakao.maps.MapTypeControl();
      this.map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

      let zoomControl = new kakao.maps.ZoomControl();
      this.map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

      // 마커 추가
      this.setExistingMarker(new kakao.maps.LatLng(36.7945989, 127.1045622), '탕정역점'); // 탕정역점
      this.setExistingMarker(new kakao.maps.LatLng(36.7989764, 127.0750025), '아산역점'); // 아산역점
      this.setExistingMarker(new kakao.maps.LatLng(36.7975413, 127.0605217), '천안역점'); // 천안역점
    },

    setExistingMarker: function (position, title) {
      let marker = new kakao.maps.Marker({
        position: position
      });
      marker.setMap(this.map);

      let iwContent = `<div>${title}</div>`;
      let infowindow = new kakao.maps.InfoWindow({
        position: position,
        content: iwContent
      });

      kakao.maps.event.addListener(marker, 'mouseover', function () {
        infowindow.open(map.map, marker);
      });
      kakao.maps.event.addListener(marker, 'mouseout', function () {
        infowindow.close();
      });

      this.existingMarkers.push(marker);
    },

    setCurrentLocationMarker: function (position) {
      if (this.currentLocationMarker) {
        this.currentLocationMarker.setMap(null); // 기존 현재 위치 마커 제거
      }

      this.currentLocationMarker = new kakao.maps.Marker({
        position: position,
        image: new kakao.maps.MarkerImage(
                "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png",
                new kakao.maps.Size(24, 35)
        ) // 현재 위치를 구분하기 위한 커스텀 마커 이미지
      });
      this.currentLocationMarker.setMap(this.map);

      let iwContent = `<div>내 현재 위치</div>`;
      let infowindow = new kakao.maps.InfoWindow({
        position: position,
        content: iwContent
      });

      kakao.maps.event.addListener(this.currentLocationMarker, 'click', function () {
        infowindow.open(map.map, map.currentLocationMarker);
      });
    }
  };

  $(document).ready(function () {
    if (!map.map) {
      map.initMap(); // 페이지 로드 시 지도 초기화
    }

    // 현재 위치 설정
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
              function (position) {
                let lat = position.coords.latitude; // 위도
                let lng = position.coords.longitude; // 경도
                let currentPosition = new kakao.maps.LatLng(lat, lng);

                map.setCurrentLocationMarker(currentPosition); // 현재 위치 마커 설정
                map.map.setCenter(currentPosition); // 현재 위치 중심으로 지도 이동
              },
              function (error) {
                console.error("Error obtaining geolocation:", error);
              }
      );
    } else {
      alert("현재 위치 정보를 사용할 수 없습니다.");
    }
  });
</script>

<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>모든 지점</title>
</head>
<body>
<div id="map"></div>
</body>
</html>
