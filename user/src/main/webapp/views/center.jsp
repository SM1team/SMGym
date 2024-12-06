<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="edu.sm.app.dto.MachineDto" %>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="<c:url value="/js/index.js"/> "></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09e7accab0008dfff9a01527bd9d411f"></script>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>



<%--HighCharts Lib  start --%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<%--HighCharts Lib  end --%>

<%--     Web Socket Lib    --%>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>

<!-- AOS 라이브러리 추가 -->
<link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>

<script>
  AOS.init({
    duration: 1200, // 애니메이션 지속 시간 (ms)
    easing: 'ease-in-out', // 애니메이션 효과
    once: false // 한 번만 애니메이션 실행
  });
</script>
<style>
  body {
    background-color: #000000; /* 검정색 배경 */
    color: #ffffff; /* 텍스트 색을 흰색으로 설정 */
    font-family: Arial, sans-serif; /* 글꼴 설정 */
  }

</style>

<style>
  @keyframes slideInFromLeft {
    0% {
      transform: translateX(-100%);
      opacity: 0;
    }
    100% {
      transform: translateX(0);
      opacity: 1;
    }
  }

</style>
<!-- Services < 웹사이트 소개 부분 > -->
<section class="page-section" id="services">
  <div class="container"data-aos="fade-up">
    <div class="text-center">
      <h2 class="section-heading text-uppercase" >SM짐 회원들이 누릴수 있는 서비스</h2>
      <h3 class="section-subheading text-uppercase" style="color:#ae00c7; font-weight: normal; font-size: 1.5rem;">
        건강한 라이프스타일을 위한 최선의 선택입니다.
      </h3>

    </div>
    <div class="row text-center">
      <div class="col-md-4">
                <span class="fa-stack fa-4x">
                    <i class="fas fa-circle fa-stack-2x text-primary" style="color:#ae00c7 !important; "></i>
                    <i class="fas fa-dumbbell fa-stack-1x fa-inverse"></i>
                </span>
        <h4 class="my-3" style="font-weight: bold;">피트니스 프로그램</h4>
      </div>
      <div class="col-md-4">
                <span class="fa-stack fa-4x">
                    <i class="fas fa-circle fa-stack-2x text-primary" style="color:#ae00c7 !important;"></i>
                    <i class="fas fa-apple-alt fa-stack-1x fa-inverse"></i>
                </span>
        <h4 class="my-3" style="font-weight: bold;">영양 상담</h4>
      </div>
      <div class="col-md-4" style="font-weight: bold;">
                <span class="fa-stack fa-4x">
                    <i class="fas fa-circle fa-stack-2x text-primary"style="color:#ae00c7 !important;"></i>
                    <i class="fas fa-heartbeat fa-stack-1x fa-inverse"></i>
                </span>
        <h4 class="my-3" style="font-weight: bold;" >체력 평가</h4>
      </div>
    </div>
  </div>
</section>


<section class="page-section" id="trainer" style="background-color: #000; color: #fff;">
  <div class="container" style="background-color: #000; color: #fff;">
    <h1 style="text-align: center; color: #fff;">TRAINER PROFILE</h1>
    <div class="row" style="background-color: #000; padding: 20px;">
      <!-- 첫 번째 프로필 -->
      <div class="col-lg-4 col-sm-6 mb-4 d-flex justify-content-center" data-aos="fade-left">
        <div class="portfolio-item" style="background-color: #000; width: 100%; height: 300px; display: flex; flex-direction: column; align-items: center; justify-content: center; border: 2px solid transparent; border-radius: 10px; transition: border-color 0.3s ease, transform 0.3s ease; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);">
          <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
            <img class="img-fluid" src="<c:url value='/assets/img/logos/teacher1.jpg' />" alt="지피티" style="width: 100%; height: 100%; object-fit: cover; border-radius: 10px; transition: border-color 0.3s ease;" />
          </a>
          <div class="portfolio-caption" style="text-align: center;">
            <div class="portfolio-caption-heading" style="color: #fff; font-weight: bold; font-size: 1.5rem;">지피티</div>
            <div class="portfolio-caption-subheading text-muted" style="color: #ccc; font-weight: bold;">28세, 남성</div>
          </div>
        </div>
      </div>

      <!-- 두 번째 프로필 -->
      <div class="col-lg-4 col-sm-6 mb-4 d-flex justify-content-center" data-aos="fade-left" data-aos-delay="200">
        <div class="portfolio-item" style="background-color: #000; width: 100%; height: 300px; display: flex; flex-direction: column; align-items: center; justify-content: center; border: 2px solid transparent; border-radius: 10px; transition: border-color 0.3s ease, transform 0.3s ease; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);">
          <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal2">
            <img class="img-fluid" src="<c:url value='/assets/img/logos/teacher2.jpg' />" alt="조준" style="width: 100%; height: 100%; object-fit: cover; border-radius: 10px; transition: border-color 0.3s ease;" />
          </a>
          <div class="portfolio-caption" style="text-align: center;">
            <div class="portfolio-caption-heading" style="color: #fff; font-weight: bold; font-size: 1.5rem;">조준</div>
            <div class="portfolio-caption-subheading text-muted" style="color: #ccc; font-weight: bold;">28세, 남성</div>
          </div>
        </div>
      </div>

      <!-- 세 번째 프로필 -->
      <div class="col-lg-4 col-sm-6 mb-4 d-flex justify-content-center" data-aos="fade-left" data-aos-delay="400">
        <div class="portfolio-item" style="background-color: #000; width: 100%; height: 300px; display: flex; flex-direction: column; align-items: center; justify-content: center; border: 2px solid transparent; border-radius: 10px; transition: border-color 0.3s ease, transform 0.3s ease; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);">
          <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal3">
            <img class="img-fluid" src="<c:url value='/assets/img/logos/teacher3.jpg' />" alt="심으뜸" style="width: 100%; height: 100%; object-fit: cover; border-radius: 10px; transition: border-color 0.3s ease;" />
          </a>
          <div class="portfolio-caption" style="text-align: center;">
            <div class="portfolio-caption-heading" style="color: #fff; font-weight: bold; font-size: 1.5rem;">심으뜸</div>
            <div class="portfolio-caption-subheading text-muted" style="color: #ccc; font-weight: bold;">30세, 여성</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>




<style>
  .portfolio-item:hover {
    border-color: #ae00c7; !important; /* 보라색 테두리 */
    transform: translateY(-10px); /* 카드가 약간 올라가는 효과 */
    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2); /* 그림자 강조 */
  }


</style>


<section class="page-section" id="about">
  <div class="container">
    <div class="text-center">
      <h2 class="section-heading text-uppercase">About</h2>
    </div>
    <ul class="timeline">
      <li data-aos="fade-up" data-aos-duration="1000">
        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value='/assets/img/about/5.png'/>" alt="..." /></div>
        <div class="timeline-panel">
          <div class="timeline-heading">
            <h4 style="font-weight: bold">최첨단 IoT 기술 적용</h4>
            <h4 class="subheading" style="font-weight: bold">출근 기록 실시간 데이터확인</h4>
          </div>
          <div class="timeline-body"><p class="text-muted">우리 헬스장은 IoT 기술을 적용하여 회원님들의 출근 기록을 실시간으로 확인할 수 있습니다. 운동 시작 전, 언제든지 자신의 출석 상태를 확인할 수 있습니다.</p></div>
        </div>
      </li>
      <li class="timeline-inverted" data-aos="fade-up" data-aos-duration="1000">
        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value='/assets/img/about/2.jpg'/>" alt="..." /></div>
        <div class="timeline-panel">
          <div class="timeline-heading">
            <h4 style="font-weight: bold">자동 추적 운동 기록</h4>
            <h4 class="subheading" style="font-weight: bold"> IoT 기구를 통한 운동 데이터</h4>
          </div>
          <div class="timeline-body"><p class="text-muted" style="color:#ae00c7;">우리 헬스장은 최신 IoT 기구를 사용하여 운동 기구에 부착된 센서를 통해 사용자의 운동 횟수와 세트 수를 자동으로 기록하고, 실시간으로 피드백을 제공합니다.</p></div>
        </div>
      </li>
      <li data-aos="fade-up" data-aos-duration="1000">
        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value='/assets/img/about/3.jpg'/>" alt="..." /></div>
        <div class="timeline-panel">
          <div class="timeline-heading">
            <h4 style="font-weight: bold">칼로리 소모 계산</h4>
            <h4 class="subheading" style="font-weight: bold">하루 운동 소모 칼로리 분석</h4>
          </div>
          <div class="timeline-body"><p class="text-muted">오늘 운동한 양을 바탕으로 소모된 칼로리를 자동으로 계산하여 회원님이 얼마나 효과적으로 운동을 했는지 시각적으로 확인할 수 있습니다.</p></div>
        </div>
      </li>
      <li class="timeline-inverted" data-aos="fade-up" data-aos-duration="1000">
        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value='/assets/img/about/4.jpg'/>" alt="..." /></div>
        <div class="timeline-panel">
          <div class="timeline-heading">
            <h4 style="font-weight: bold">홈트레이닝 정보 제공</h4>
            <h4 class="subheading" style="font-weight: bold">어디서나 가능한 홈트레이닝</h4>
          </div>
          <div class="timeline-body" ><p class="text-muted" style="font-weight: bold">홈트레이닝도 지원합니다. 헬스장에 오지 못한 날에는 앱을 통해 제공되는 맞춤형 홈트레이닝 정보를 통해 운동을 계속 이어갈 수 있습니다.</p></div>
        </div>
      </li>
      <!-- 5번 항목은 왼쪽으로 배치 -->
      <li data-aos="fade-up" data-aos-duration="1000">
        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value='/assets/img/about/1.jpg'/>" alt="..." /></div>
        <div class="timeline-panel">
          <div class="timeline-heading">
            <h4 style="font-weight: bold">어디서든 스마트한 운동 경험</h4>
            <h4 class="subheading" style="font-weight: bold">최신 기술이 적용된 헬스장에서 새로운 경험을 즐기세요!</h4>
          </div>
          <div class="timeline-body" style="font-weight: bold"><p class="text-muted">헬스장에 방문하지 않아도 언제든지 최신 기술을 통해 스마트한 운동을 경험할 수 있습니다. IoT 기기와 모바일 앱을 통해 어디서나 연결되고, 실시간 피드백을 제공합니다.</p></div>
        </div>
      </li>
    </ul>
  </div>
</section>

<!-- AOS 초기화 스크립트 -->
<script>
  AOS.init();
</script>
<!-- Location 지점별 위치 소개 -->
<!-- Location 지점별 위치 소개 -->
<section class="page-section" id="location" style="background-color: #000000; color: #ffffff;">
  <div class="container">
    <div class="text-center">
      <h2 class="section-heading text-uppercase">Location</h2>
    </div>
    <div class="row" style="margin-top: 30px;"> <!-- row 클래스에 마진 추가 -->
      <!-- 왼쪽: 지점 이미지 세로 배치 -->
      <div class="col-lg-4" data-aos="fade-left" style="max-height: 200px">
        <div class="team-member d-flex flex-column align-items-center text-center">
          <img class="mx-auto circle img-hover" src="<c:url value='/assets/img/logos/1.jpg'/>" alt="탕정역점" data-toggle="modal" data-target="#locationModal1" style="margin-bottom: 5px;"/>
          <h4 style="font-weight: bold; margin-top: 0;">탕정역점</h4>
          <p class="text-muted" style="font-weight: bold; margin-top: 0;">주소: 충청남도 아산시 탕정면 탕정리 123</p>
        </div>
        <div class="team-member d-flex flex-column align-items-center text-center">
          <img class="mx-auto circle img-hover" src="<c:url value='/assets/img/logos/2.jpg'/>" alt="아산역점" data-bs-toggle="modal" data-bs-target="#locationModal2" style="max-height: 200px; margin-bottom: 5px;"/>
          <h4 style="font-weight: bold; margin-top: 0;">아산역점</h4>
          <p class="text-muted" style="font-weight: bold; margin-top: 0;">주소: 충청남도 아산시 배방면 동아리 456</p>
        </div>
        <div class="team-member d-flex flex-column align-items-center text-center">
          <img class="mx-auto circle img-hover" src="<c:url value='/assets/img/logos/3.jpg'/>" alt="천안역점" data-bs-toggle="modal" data-bs-target="#locationModal3" style="max-height: 200px; margin-bottom: 5px;"/>
          <h4 style="font-weight: bold; margin-top: 0;">천안역점</h4>
          <p class="text-muted" style="font-weight: bold; margin-top: 0;">주소: 충청남도 천안시 동남구 원성동 789</p>
        </div>
      </div>
      <!-- 오른쪽: 지도 -->
      <div class="col-lg-8"data-aos="fade-right">
        <div id="map" style="width: 100%; height: 700px;"></div>
      </div>
    </div>
  </div>
</section>

<style>
  /* 이미지에 마우스 커서 올라갔을 때 애니메이션 효과 */
  .img-hover {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
  }

  .img-hover:hover {
    transform: scale(1.05); /* 이미지 크기 5% 증가 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* 살짝 그림자 추가 */
  }
</style>




<!-- 카카오 지도 및 위치 마커 스크립트 추가 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09e7accab0008dfff9a01527bd9d411f"></script>
<script>
  let map = {
    map: null,
    currentLocationMarker: null, // 현재 위치 마커
    existingMarkers: [], // 기존 위치 마커들

    initMap: function () {
      let mapContainer = document.getElementById('map');
      let mapOption = {
        center: new kakao.maps.LatLng(36.7945989, 127.1045622), // 초기 중심 위치 (탕정역점)
        level: 7
      };

      this.map = new kakao.maps.Map(mapContainer, mapOption);

      let mapTypeControl = new kakao.maps.MapTypeControl();
      this.map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

      let zoomControl = new kakao.maps.ZoomControl();
      this.map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

      // 마커 추가
      this.setExistingMarker(new kakao.maps.LatLng(36.7945989, 127.1045622), '탕정역점'); // 탕정역점
      this.setExistingMarker(new kakao.maps.LatLng(36.8151122, 127.1138884), '아산역점'); // 아산역점
      this.setExistingMarker(new kakao.maps.LatLng(36.7975413, 127.0605217), '천안역점'); // 천안역점
    },

    setExistingMarker: function (position, title) {
      let marker = new kakao.maps.Marker({
        position: position
      });
      marker.setMap(this.map);


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




<%--<questionquestion.jsp end>--%>
