<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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




<section class="page-section" id="services">
  <div class="container">
    <div class="text-center">
      <h2 class="section-heading text-uppercase">헬스장 플로어 맵</h2>
      <h3 class="section-subheading text-muted">운동 기구와 주요 시설을 한눈에 확인해보세요!</h3>
    </div>
    <div class="gym-layout">
      <!-- 러닝머신 7개 -->
      <div class="equipment running" style="top: 8%; left: 3%;">
        <i class="fas fa-running"></i>
        <h4>런닝머신 1</h4>
      </div>
      <div class="equipment running" style="top: 8%; left: 14%;">
        <i class="fas fa-running"></i>
        <h4>런닝머신 2</h4>
      </div>
      <div class="equipment running" style="top: 8%; left: 25%;">
        <i class="fas fa-running"></i>
        <h4>런닝머신 3</h4>
      </div>
      <div class="equipment running" style="top: 8%; left: 36%;">
        <i class="fas fa-running"></i>
        <h4>런닝머신 4</h4>
      </div>
      <div class="equipment running" style="top: 8%; left: 47%;">
        <i class="fas fa-running"></i>
        <h4>런닝머신 5</h4>
      </div>
      <div class="equipment running" style="top: 8%; left: 58%;">
        <i class="fas fa-running"></i>
        <h4>런닝머신 6</h4>
      </div>
      <div class="equipment running" style="top: 8%; left: 69%;">
        <i class="fas fa-running"></i>
        <h4>런닝머신 7</h4>
      </div>


      <!-- 프론트 카운터 -->
      <div class="facility reception" style="top: 8%; left: 80%; width: 180px;">
        <i class="fas fa-cogs"></i>
        <h4>프론트 카운터</h4>
      </div>

      <!-- 경계선 추가 (러닝머신과 다른 운동기구 구분) -->
      <div class="boundary-line" style="top: 22%; left: 0; width: 100%;"></div>



      <div class="boundary-line" style="top: 22%; left: 11%; width: 3px; height: 78%; background-color: black;"></div>


      <!-- 화장실 -->
      <div class="facility light" style="top: 23%; left: 0.5%; height: 120px;">
        <i class="fas fa-toilet"></i>
        <h4>화장실</h4>
      </div>

      <!-- 샤워실 -->
      <div class="facility light" style="top: 43%; left: 0.5%; height: 120px;">
        <i class="fas fa-shower"></i>
        <h4>샤워실</h4>
      </div>

      <!-- 탈의실 -->
      <div class="facility light" style="top: 63%; left: 0.5%; height: 120px;">
        <i class="fas fa-tshirt"></i>
        <h4>탈의실</h4>
      </div>

      <!-- 비상구 -->
      <div class="facility emergency" style="top: 83%; left: 0.5%; height: 120px;">
        <i class="fas fa-exclamation-triangle"></i>
        <h4>비상구</h4>
      </div>



      <!-- 밴치프레스 -->
      <div class="equipment weight" style="top: 25%; left: 13%;">
        <i class="fas fa-dumbbell"></i>
        <h4>밴치 프레스</h4>
      </div>

      <!-- 숄더프레스 -->
      <div class="equipment weight" style="top: 25%; left: 25%;">
        <i class="fas fa-dumbbell"></i>
        <h4>숄더 프레스</h4>
      </div>

      <!-- 플라잉 머신 -->
      <div class="equipment weight" style="top: 25%; left: 37%;">
        <i class="fas fa-dumbbell"></i>
        <h4>플라잉 머신</h4>
      </div>

      <!-- 단체 pt 존 -->
      <div class="equipment flexibility" style="top: 40%; left: 15%; width: 275px; height: 275px;">
        <i class="fas fa-dumbbell"></i>
        <h4>단체 PT 존</h4>
      </div>

      <div class="boundary-line" style="top: 22%; left: 48%; width: 3px; height: 57%; background-color: black;"></div>



      <!-- 사이클 머신 2개 추가 -->
      <div class="equipment cardio" style="top: 25%; left: 50%; white-space: nowrap;">
        <i class="fas fa-bicycle"></i>
        <h4>스핀 바이크 1</h4>
      </div>
      <div class="equipment cardio" style="top: 38%; left: 50%; white-space: nowrap;">
        <i class="fas fa-bicycle"></i>
        <h4>스핀 바이크 2</h4>
      </div>

      <div class="equipment cardio" style="top: 51%; left: 50%; white-space: nowrap;">
        <i class="fas fa-bicycle"></i>
        <h4>인도어사이클 1</h4>
      </div>
      <div class="equipment cardio" style="top: 64%; left: 50%; white-space: nowrap;">
        <i class="fas fa-bicycle"></i>
        <h4>인도어사이클 2</h4>
      </div>


      <div class="boundary-line" style="top: 22%; left: 60.6%; width: 2px; height: 57%; background-color: black;"></div>

      <!-- 레그 프레스 머신 -->
      <div class="equipment weight" style="top: 25%; left: 63%;width: 110px; height: 110px;">
        <i class="fas fa-dumbbell"></i>
        <h4 style="white-space: nowrap;">레그 프레스 머신</h4>
      </div>


      <!-- 체스트 프레스 머신 -->
      <div class="equipment weight" style="top: 42.5%; left: 63%; width: 110px; height: 110px;">
        <i class="fas fa-dumbbell"></i>
        <h4 style="white-space: nowrap;">체스트 프레스 머신</h4>
      </div>


      <!-- 스미스 머신 -->
      <div class="equipment weight" style="top: 60%; left: 63%;width: 110px; height: 110px;">
        <i class="fas fa-dumbbell"></i>
        <h4>스미스 머신</h4>
      </div>


      <div class="boundary-line" style="top: 79%; left: 11%; width: 65%;"></div>

      <!-- 덤벨존 -->
      <div class="equipment strength" style="top: 81%; left: 13%; width: 130px; height: 120px;">
        <i class="fas fa-dumbbell"></i>
        <h4>덤벨존</h4>
      </div>

      <!-- 스쿼트랙 -->
      <div class="equipment strength" style="top: 81%; left: 30%; width: 130px; height: 120px;">
        <i class="fas fa-dumbbell"></i>
        <h4>스쿼트랙</h4>
      </div>
      <script src="https://kit.fontawesome.com/a076d05399.js"></script>

      <!-- 풀업 바 -->
      <div class="equipment strength" style="top: 81%; left: 47%; width: 117px; height: 120px;">
        <i class="fas fa-fire-flame-simple"></i>
        <h4>풀업 바</h4>
      </div>

      <!-- 딥스 바 -->
      <div class="equipment strength" style="top: 81%; left: 62%; width: 117px; height: 120px;">
        <i class="fas fa-fire-flame-simple"></i>
        <h4>딥스 바</h4>
      </div>


      <!-- 준비운동 구역 -->
      <div class="area cardio" style="top: 30%; left: 70%;">
        <i class="fas fa-heartbeat"></i>
        <h4>준비운동 구역</h4>
      </div>

      <div class="boundary-line" style="top: 22%; left: 76%; width: 3px; height: 78%; background-color: black;"></div>


      <!-- 스텝밀 머신 -->
      <div class="equipment running" style="top: 30%; left: 78%;">
        <i class="fas fa-running"></i>
        <h4>스텝밀 머신1</h4>
      </div>

      <div class="equipment running" style="top: 30%; left: 90%;">
        <i class="fas fa-running"></i>
        <h4>스텝밀 머신2</h4>
      </div>



<%--       첫번쨰--%>
      <div class="boundary-line" style="top: 45%; left: 76%; width: 24%;"></div>





      <!-- 스쿼트 존 -->
      <div class="equipment weight" style="top: 50%; left: 79%; width: 180px;">
        <i class="fas fa-dumbbell"></i>
        <h4>스쿼트 존</h4>
      </div>


<%--      2번쟤--%>
      <div class="boundary-line" style="top: 66%; left: 76%; width: 24%;"></div>

      <!-- 케이블 머신 존 -->
      <div class="equipment cardio" style="top: 70%; left: 79%; width: 185px; height: 185px; font-size: 24px;">
        <i class="fas fa-dumbbell" style="font-size: 48px;"></i>
        <h4>케시블 머신 존</h4>
      </div>


    </div>
  </div>
</section>

<!-- 스타일링 추가 -->
<style>
  .gym-layout {
    position: relative;
    width: 100%;
    height: 780px;
    background-color: #f0f0f0;
    border: 2px solid #ccc;
    margin-left: auto;
    margin-right: auto;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
  }

  .equipment, .facility {
    position: absolute;
    padding: 10px;
    border-radius: 8px;
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    width: 90px;
    height: 90px;
    font-size: 12px;
    border: 2px solid #333; /* 경계선 추가 */
    background-color: rgba(255, 255, 255, 0.8); /* 투명도 약간 추가 */
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.2); /* 아이템 그림자 */
    transition: transform 0.3s ease, box-shadow 0.3s ease; /* 애니메이션 추가 */
  }

  .equipment i, .facility i {
    font-size: 24px;
    margin-bottom: 5px;
  }

  .equipment:hover, .facility:hover {
    transform: scale(1.1); /* 호버 시 크기 확대 */
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.3); /* 호버 시 그림자 강조 */
  }

  .boundary-line {
    position: absolute;
    top: 20%; /* 경계선의 위치 */
    left: 0;
    width: 100%;
    height: 2px;
    background-color: black;
  }

  /* 운동기구 색깔 */
  /* 운동기구 색깔 */
  .running { background-color: #a8d0e6; }
  .cardio { background-color: #f7a8b8; }
  .weight { background-color: #d4edda; }
  .strength { background-color: #f9e2a1; } /* 새로운 색: 밝은 노랑 */
  .flexibility { background-color: #f8e6e6; } /* 새로운 색: 밝은 분홍 */
  .light { background-color: #e8f8f0; } /* 새로운 색: 거의 하얀색 */

  /* 시설 색깔 */
  .reception { background-color: #f6c23e; }
  .emergency { background-color: #e74a3b; }
  .shower { background-color: #70a1ff; }
  .changing { background-color: #3498db; }
  .restroom { background-color: #2ecc71; }

  h4 {
    font-size: 12px;
    color: #333;
    margin: 0;
    font-weight: bold; /* 제목 글씨 두껍게 */
  }
</style>

<!-- Font Awesome CDN 추가 -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

































<%-- 주석처리 길게--%>

<!-- 트레이너 소개 페이지-->
<section class="page-section bg-light" id="trainer">
  <div class="container">
    <div class="text-center">
      <h2 class="section-heading text-uppercase">Trainer Profile</h2>
<%--      <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>--%>
    </div>
    <div class="row">
      <div class="col-lg-4 col-sm-6 mb-4">
        <!-- Portfolio item 1-->
        <div class="portfolio-item">
          <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
            </div>
            <img class="img-fluid" src="<c:url value="/assets/img/logos/teacher1.jpg"/>" alt="..." />
          </a>
          <div class="portfolio-caption">
            <div class="portfolio-caption-heading">지피티</div>
            <div class="portfolio-caption-subheading text-muted">28세,남성</div>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 mb-4">
        <!-- Portfolio item 2-->
        <div class="portfolio-item">
          <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal2">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
            </div>
            <img class="img-fluid" src="<c:url value="/assets/img/logos/teacher2.jpg"/>" alt="..." />
          </a>
          <div class="portfolio-caption">
            <div class="portfolio-caption-heading">조준</div>
            <div class="portfolio-caption-subheading text-muted">27세,남성</div>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 mb-4">
        <!-- Portfolio item 3-->
        <div class="portfolio-item">
          <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal3">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
            </div>
            <img class="img-fluid" src="<c:url value="/assets/img/logos/teacher3.jpg"/>" alt="..." />
          </a>
          <div class="portfolio-caption">
            <div class="portfolio-caption-heading">심으뜸</div>
            <div class="portfolio-caption-subheading text-muted">30세,여성</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- About  < 헬스장의 역사 , 차별점 -->
<section class="page-section" id="about">
  <div class="container">
    <div class="text-center">
      <h2 class="section-heading text-uppercase">About</h2>
      <h3 class="section-subheading text-muted">다른 헬스장과는 차원이 다른 우리의 헬스 서비스</h3>
    </div>
    <ul class="timeline">
      <li>
        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value='/assets/img/about/5.png'/>" alt="..." /></div>
        <div class="timeline-panel">
          <div class="timeline-heading">
            <h4>최첨단 IoT 기술 적용</h4>
            <h4 class="subheading">출근 기록 및 실시간 데이터 확인</h4>
          </div>
          <div class="timeline-body"><p class="text-muted">우리 헬스장은 IoT 기술을 적용하여 회원님들의 출근 기록을 실시간으로 확인할 수 있습니다. 운동 시작 전, 언제든지 자신의 출석 상태를 확인할 수 있습니다.</p></div>
        </div>
      </li>
      <li class="timeline-inverted">
        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value='/assets/img/about/2.jpg'/>" alt="..." /></div>
        <div class="timeline-panel">
          <div class="timeline-heading">
            <h4>자동 추적 운동 기록</h4>
            <h4 class="subheading">IoT 기구를 통한 실시간 운동 데이터</h4>
          </div>
          <div class="timeline-body"><p class="text-muted">우리 헬스장은 최신 IoT 기구를 사용하여 운동 기구에 부착된 센서를 통해 사용자의 운동 횟수와 세트 수를 자동으로 기록하고, 실시간으로 피드백을 제공합니다.</p></div>
        </div>
      </li>
      <li>
        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value='/assets/img/about/3.jpg'/>" alt="..." /></div>
        <div class="timeline-panel">
          <div class="timeline-heading">
            <h4>칼로리 소모 계산</h4>
            <h4 class="subheading">오늘의 운동량에 따른 소모 칼로리 분석</h4>
          </div>
          <div class="timeline-body"><p class="text-muted">오늘 운동한 양을 바탕으로 소모된 칼로리를 자동으로 계산하여 회원님이 얼마나 효과적으로 운동을 했는지 시각적으로 확인할 수 있습니다.</p></div>
        </div>
      </li>
      <li class="timeline-inverted">
        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value='/assets/img/about/4.jpg'/>" alt="..." /></div>
        <div class="timeline-panel">
          <div class="timeline-heading">
            <h4>홈트레이닝 정보 제공</h4>
            <h4 class="subheading">언제 어디서나 함께 할 수 있는 홈트레이닝</h4>
          </div>
          <div class="timeline-body"><p class="text-muted">홈트레이닝도 지원합니다. 헬스장에 오지 못한 날에는 앱을 통해 제공되는 맞춤형 홈트레이닝 정보를 통해 운동을 계속 이어갈 수 있습니다.</p></div>
        </div>
      </li>
      <!-- 5번 항목은 왼쪽으로 배치 -->
      <li>
        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value='/assets/img/about/1.jpg'/>" alt="..." /></div>
        <div class="timeline-panel">
          <div class="timeline-heading">
            <h4>언제 어디서든 스마트한 운동 경험</h4>
            <h4 class="subheading">최신 기술이 적용된 헬스장에서 운동의 새로운 경험을 즐기세요!</h4>
          </div>
          <div class="timeline-body"><p class="text-muted">헬스장에 방문하지 않아도 언제든지 최신 기술을 통해 스마트한 운동을 경험할 수 있습니다. IoT 기기와 모바일 앱을 통해 어디서나 연결되고, 실시간 피드백을 제공합니다.</p></div>
        </div>
      </li>
    </ul>
  </div>
</section>


<!-- Location 지점별 위치 소개 -->
<section class="page-section bg-light" id="location">
  <div class="container">
    <div class="text-center">
      <h2 class="section-heading text-uppercase">우리의 지점들</h2>
      <h3 class="section-subheading text-muted">여러분의 건강과 목표 달성을 돕기 위해 함께합니다.</h3>
    </div>
    <div class="row">
      <div class="col-lg-4">
        <div class="team-member d-flex flex-column align-items-center text-center">
          <img class="mx-auto rounded-circle" src="<c:url value='/assets/img/logos/1.jpg'/>" alt="탕정역점" data-toggle="modal" data-target="#locationModal1" />
          <h4>탕정역점</h4>
          <p class="text-muted">주소: 충청남도 아산시 탕정면 탕정리 123</p>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="team-member d-flex flex-column align-items-center text-center">
          <img class="mx-auto rounded-circle" src="<c:url value='/assets/img/logos/2.jpg'/>" alt="아산역점" data-bs-toggle="modal" data-bs-target="#locationModal2" />
          <h4>아산역점</h4>
          <p class="text-muted">주소: 충청남도 아산시 배방면 동아리 456</p>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="team-member d-flex flex-column align-items-center text-center">
          <img class="mx-auto rounded-circle" src="<c:url value='/assets/img/logos/3.jpg'/>" alt="천안역점" data-bs-toggle="modal" data-bs-target="#locationModal3" />
          <h4>천안역점</h4>
          <p class="text-muted">주소: 충청남도 천안시 동남구 원성동 789</p>
        </div>
      </div>
    </div>
  </div>
</section>



<%--<questionquestion.jsp end>--%>
