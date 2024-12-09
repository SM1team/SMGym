<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<style>
    #map3 {
        width: 100%;
        height: 500px;
        border: 2px solid darkred;
    }
</style>

<script>
    let map3 = {
        map: null,
        existingMarker: null, // 기존 위치 마커
        currentLocationMarker: null, // 현재 위치 마커

        initMap: function () {
            let mapContainer = document.getElementById('map3');
            let mapOption = {
                center: new kakao.maps.LatLng(36.7975413, 127.0605217), // 초기 중심 위치
                level: 7
            };

            this.map = new kakao.maps.Map(mapContainer, mapOption);

            let mapTypeControl = new kakao.maps.MapTypeControl();
            this.map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            let zoomControl = new kakao.maps.ZoomControl();
            this.map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            this.setExistingMarker(new kakao.maps.LatLng(36.7946071, 127.1045608)); // 기존 마커 설정
        },

        setExistingMarker: function (position) {
            if (!this.existingMarker) {
                this.existingMarker = new kakao.maps.Marker({
                    position: position
                });
                this.existingMarker.setMap(this.map);

                let iwContent = `<div>천안역점</div>`;
                let infowindow = new kakao.maps.InfoWindow({
                    position: position,
                    content: iwContent
                });

                kakao.maps.event.addListener(this.existingMarker, 'mouseover', function () {
                    infowindow.open(map3.map, map3.existingMarker);
                });
                kakao.maps.event.addListener(this.existingMarker, 'mouseout', function () {
                    infowindow.close();
                });
            }
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
                infowindow.open(map3.map, map3.currentLocationMarker);
            });
        }
    };

    $(document).ready(function () {
        $('#locationModal3').on('shown.bs.modal', function () {
            if (!map3.map) {
                map3.initMap(); // 모달 열릴 때 지도 초기화
            } else {
                map3.map.relayout(); // 지도 크기 재조정
                map3.map.setCenter(new kakao.maps.LatLng(36.7975413, 127.0605217));
            }

            // 현재 위치 설정
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(
                    function (position) {
                        let lat = position.coords.latitude; // 위도
                        let lng = position.coords.longitude; // 경도
                        let currentPosition = new kakao.maps.LatLng(lat, lng);

                        map3.setCurrentLocationMarker(currentPosition); // 현재 위치 마커 설정
                        map3.map.setCenter(currentPosition); // 현재 위치 중심으로 지도 이동
                    },
                    function (error) {
                        console.error("Error obtaining geolocation:", error);
                    }
                );
            } else {
                alert("현재 위치 정보를 사용할 수 없습니다.");
            }
        });
    });
</script>




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
                            <div id="map3"></div>
<%--                            <img class="img-fluid d-block mx-auto" src="<c:url value='/assets/img/location/cheonan.jpg'/>" alt="천안역점" />--%>
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
