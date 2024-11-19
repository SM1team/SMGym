<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="<c:url value="/js/index.js"/>"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09e7accab0008dfff9a01527bd9d411f"></script>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
    #map1 {
        width: 100%;
        height: 500px;
        border: 2px solid darkred;
    }
</style>

<script>
    let map1 = {
        map: null,
        marker: null,
        initMap: function () {
            let mapContainer = document.getElementById('map1');
            let mapOption = {
                center: new kakao.maps.LatLng(36.7945989, 127.1045622),
                level: 5
            };

            this.map = new kakao.maps.Map(mapContainer, mapOption);
            let mapTypeControl = new kakao.maps.MapTypeControl();
            this.map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            let zoomControl = new kakao.maps.ZoomControl();
            this.map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            let markerPosition = new kakao.maps.LatLng(36.7945989, 127.1045622);
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
        $('#locationModal1').on('shown.bs.modal', function () {
            if (!map1.map) {
                map1.initMap(); // 모달이 열릴 때 지도를 초기화
            } else {
                map1.map.relayout(); // 이미 지도가 생성되어 있다면 크기 재조정
                map1.map.setCenter(new kakao.maps.LatLng(36.7945989, 127.1045622));
            }
        });
    });
</script>

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
            <div class="close-modal" data-dismiss="modal">
                <img src="<c:url value='/assets/img/close-icon.svg'/>" alt="Close modal" />
            </div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="modal-body">
                            <h2 class="text-uppercase">탕정역점</h2>
                            <p class="item-intro text-muted">주소: 충청남도 아산시 탕정면 탕정리 123</p>
                            <div id="map1"></div>
                            <p>탕정역점은 최신 운동 기구와 다양한 프로그램을 통해 회원 여러분의 목표 달성을 돕습니다. 전문 트레이너들이 상주하며 개인 맞춤형 운동을 지원합니다.</p>
                            <button class="btn btn-primary btn-xl text-uppercase" data-dismiss="modal" type="button">
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
