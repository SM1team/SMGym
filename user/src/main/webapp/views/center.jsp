<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- Services < 웹사이트 소개 부분 > -->
<section class="page-section" id="services">
  <div class="container">
    <div class="text-center">
      <h2 class="section-heading text-uppercase">우리의 서비스</h2>
      <h3 class="section-subheading text-muted">건강한 라이프스타일을 위한 최선의 선택입니다.</h3>
    </div>
    <div class="row text-center">
      <div class="col-md-4">
                <span class="fa-stack fa-4x">
                    <i class="fas fa-circle fa-stack-2x text-primary"></i>
                    <i class="fas fa-dumbbell fa-stack-1x fa-inverse"></i>
                </span>
        <h4 class="my-3">피트니스 프로그램</h4>
        <p class="text-muted">개개인의 목표에 맞춘 맞춤형 피트니스 프로그램을 제공합니다. 다양한 운동과 트레이닝을 경험해보세요.</p>
      </div>
      <div class="col-md-4">
                <span class="fa-stack fa-4x">
                    <i class="fas fa-circle fa-stack-2x text-primary"></i>
                    <i class="fas fa-apple-alt fa-stack-1x fa-inverse"></i>
                </span>
        <h4 class="my-3">영양 상담</h4>
        <p class="text-muted">전문 영양사가 제공하는 건강한 식단과 영양 상담으로 더욱 건강한 라이프스타일을 누리세요.</p>
      </div>
      <div class="col-md-4">
                <span class="fa-stack fa-4x">
                    <i class="fas fa-circle fa-stack-2x text-primary"></i>
                    <i class="fas fa-heartbeat fa-stack-1x fa-inverse"></i>
                </span>
        <h4 class="my-3">체력 평가</h4>
        <p class="text-muted">체력 평가를 통해 현재의 건강 상태를 파악하고, 향후 목표를 설정하는 데 도움을 드립니다.</p>
      </div>
    </div>
  </div>
</section>


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
          <img class="mx-auto rounded-circle" src="<c:url value='/assets/img/logos/1.jpg'/>" alt="탕정역점" data-bs-toggle="modal" data-bs-target="#locationModal1" />
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
  </head>
  </html>
</section>

<%--<center.jsp end>--%>
