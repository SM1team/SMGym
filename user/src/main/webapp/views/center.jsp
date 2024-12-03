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
        <h4>러닝머신 1</h4>
        <div class="bubble">
          <p><strong>러닝머신이란?</strong></p>
          <img class="img-fluid" src="<c:url value="/assets/img/logos/running.jpg"/>" alt="..." />
          <p>러닝머신은 체력과 유산소 운동을 동시에 개선할 수 있는 운동 기계로, 조정 가능한 속도와 기울기로 다양한 운동 강도를 선택할 수 있습니다. 지속적인 운동을 통해 체중 감량과 심혈관 건강에 도움이 됩니다.</p>
          <p><strong>효율성:</strong> 고속 운동에 적합, 칼로리 소모가 많음</p>
          <p><strong>속도:</strong> 1 ~ 15 km/h</p>
        </div>
        <!-- 이미지 추가 -->
        <div class="light"></div>
      </div>

      <div class="equipment running" style="top: 8%; left: 14%;">
        <i class="fas fa-running"></i>
        <h4>런닝머신 2</h4>
        <div class="bubble">
          <p><strong>러닝머신이란?</strong></p>
          <img class="img-fluid" src="<c:url value="/assets/img/logos/running.jpg"/>" alt="..." />
          <p>러닝머신은 체력과 유산소 운동을 동시에 개선할 수 있는 운동 기계로, 조정 가능한 속도와 기울기로 다양한 운동 강도를 선택할 수 있습니다. 지속적인 운동을 통해 체중 감량과 심혈관 건강에 도움이 됩니다.</p>
          <p><strong>효율성:</strong> 고속 운동에 적합, 칼로리 소모가 많음</p>
          <p><strong>속도:</strong> 1 ~ 15 km/h</p>
        </div>
        <div class="light"></div>
      </div>
      <div class="equipment running" style="top: 8%; left: 25%;">
        <i class="fas fa-running"></i>
        <h4>런닝머신 3</h4>
        <div class="bubble">
          <p><strong>러닝머신이란?</strong></p>
          <img class="img-fluid" src="<c:url value="/assets/img/logos/running.jpg"/>" alt="..." />
          <p>러닝머신은 체력과 유산소 운동을 동시에 개선할 수 있는 운동 기계로, 조정 가능한 속도와 기울기로 다양한 운동 강도를 선택할 수 있습니다. 지속적인 운동을 통해 체중 감량과 심혈관 건강에 도움이 됩니다.</p>
          <p><strong>효율성:</strong> 고속 운동에 적합, 칼로리 소모가 많음</p>
          <p><strong>속도:</strong> 1 ~ 15 km/h</p>
        </div>
        <div class="light"></div>
      </div>
      <div class="equipment running" style="top: 8%; left: 36%;">
        <i class="fas fa-running"></i>
        <h4>런닝머신 4</h4>
        <div class="bubble">
          <p><strong>러닝머신이란?</strong></p>
          <img class="img-fluid" src="<c:url value="/assets/img/logos/running.jpg"/>" alt="..." />
          <p>러닝머신은 체력과 유산소 운동을 동시에 개선할 수 있는 운동 기계로, 조정 가능한 속도와 기울기로 다양한 운동 강도를 선택할 수 있습니다. 지속적인 운동을 통해 체중 감량과 심혈관 건강에 도움이 됩니다.</p>
          <p><strong>효율성:</strong> 고속 운동에 적합, 칼로리 소모가 많음</p>
          <p><strong>속도:</strong> 1 ~ 15 km/h</p>
        </div>
        <div class="light"></div>
      </div>
      <div class="equipment running" style="top: 8%; left: 47%;">
        <i class="fas fa-running"></i>
        <h4>런닝머신 5</h4>
        <div class="bubble">
          <p><strong>러닝머신이란?</strong></p>
          <img class="img-fluid" src="<c:url value="/assets/img/logos/running.jpg"/>" alt="..." />
          <p>러닝머신은 체력과 유산소 운동을 동시에 개선할 수 있는 운동 기계로, 조정 가능한 속도와 기울기로 다양한 운동 강도를 선택할 수 있습니다. 지속적인 운동을 통해 체중 감량과 심혈관 건강에 도움이 됩니다.</p>
          <p><strong>효율성:</strong> 고속 운동에 적합, 칼로리 소모가 많음</p>
          <p><strong>속도:</strong> 1 ~ 15 km/h</p>
        </div>
        <div class="light"></div>
      </div>
      <div class="equipment running" style="top: 8%; left: 58%;">
        <i class="fas fa-running"></i>
        <h4>런닝머신 6</h4>
        <div class="bubble">
          <p><strong>러닝머신이란?</strong></p>
          <img class="img-fluid" src="<c:url value="/assets/img/logos/running.jpg"/>" alt="..." />
          <p>러닝머신은 체력과 유산소 운동을 동시에 개선할 수 있는 운동 기계로, 조정 가능한 속도와 기울기로 다양한 운동 강도를 선택할 수 있습니다. 지속적인 운동을 통해 체중 감량과 심혈관 건강에 도움이 됩니다.</p>
          <p><strong>효율성:</strong> 고속 운동에 적합, 칼로리 소모가 많음</p>
          <p><strong>속도:</strong> 1 ~ 15 km/h</p>
        </div>
        <div class="light"></div>
      </div>
      <div class="equipment running" style="top: 8%; left: 69%;">
        <i class="fas fa-running"></i>
        <h4>런닝머신 7</h4>
        <div class="bubble">
          <p><strong>러닝머신이란?</strong></p>
          <img class="img-fluid" src="<c:url value="/assets/img/logos/running.jpg"/>" alt="..." />
          <p>러닝머신은 체력과 유산소 운동을 동시에 개선할 수 있는 운동 기계로, 조정 가능한 속도와 기울기로 다양한 운동 강도를 선택할 수 있습니다. 지속적인 운동을 통해 체중 감량과 심혈관 건강에 도움이 됩니다.</p>
          <p><strong>효율성:</strong> 고속 운동에 적합, 칼로리 소모가 많음</p>
          <p><strong>속도:</strong> 1 ~ 15 km/h</p>
        </div>
        <div class="light"></div>
      </div>


      <!-- 프론트 카운터 -->
      <div class="facility reception" style="top: 8%; left: 80%; width: 180px;">
        <i class="fas fa-cogs"></i>
        <h4>프론트 카운터</h4>
        <div class="bubble">
          <p><strong>프론트 카운터란?</strong></p>
          <img class="img-fluid" src="<c:url value="/assets/img/logos/counter.jpg"/>" alt="..." />
          <p>프론트 카운터는 운동 시설에서 입구 역할을 하며, 회원 관리, 요금 결제, 상담 등의 다양한 서비스를 제공합니다. 운동 전후로 필요한 정보를 제공하며, 시설 이용을 원활하게 지원합니다.</p>
          <p><strong>서비스:</strong> 상담, 예약, 요금 결제</p>
          <p><strong>위치:</strong> 입구 근처</p>
        </div>
      </div>

      <!-- 경계선 추가 (러닝머신과 다른 운동기구 구분) -->
      <div class="boundary-line" style="top: 22%; left: 0; width: 100%;"></div>

      <div class="boundary-line" style="top: 22%; left: 11%; width: 3px; height: 78%; background-color: black;"></div>

      <!-- 남자 화장실 -->
      <div class="facility manlocker" style="top: 23%; left: 1%; height: 60px;">
        <i class="fas fa-toilet"></i>
        <h4>남자 화장실</h4>
      </div>

      <!-- 남자 샤워실 -->
      <div class="facility manlocker" style="top: 33%; left: 1%; height: 60px;">
        <i class="fas fa-shower"></i>
        <h4>남자 샤워실</h4>
      </div>

      <!-- 남자 탈의실 -->
      <div class="facility manlocker" style="top: 43%; left: 1%; height: 60px;">
        <i class="fas fa-tshirt"></i>
        <h4>남자 탈의실</h4>
      </div>

      <!-- 여자 화장실 -->
      <div class="facility womanlocker" style="top: 53%; left: 1%; height: 60px;">
        <i class="fas fa-toilet"></i>
        <h4>여자 화장실</h4>
      </div>

      <!-- 여자 샤워실 -->
      <div class="facility womanlocker" style="top: 63%; left: 1%; height: 60px;">
        <i class="fas fa-shower"></i>
        <h4>여자 샤워실</h4>
      </div>

      <!-- 여자 탈의실 -->
      <div class="facility womanlocker" style="top: 73%; left: 1%; height: 60px;">
        <i class="fas fa-tshirt"></i>
        <h4>여자 탈의실</h4>
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
        <div class="bubble">
          <p><strong>밴치 프레스란?</strong></p>
          <img class="img-fluid" src="<c:url value="/assets/img/logos/벤치.jpg"/>" alt="..." />
          <p>밴치 프레스는 가슴과 어깨, 팔을 강화하는 운동으로, 바벨을 가슴 위로 밀어올리는 운동입니다. 가슴 근육을 집중적으로 강화하는 데 효과적이며, 상체 근육 발달에 중요한 역할을 합니다.</p>
          <p><strong>효과:</strong> 가슴, 어깨, 팔 강화</p>
          <p><strong>세트:</strong> 3~4세트, 8~12회 반복</p>
        </div>
        <div class="light"></div>
      </div>

      <!-- 숄더프레스 -->
      <div class="equipment weight" style="top: 25%; left: 25%;">
        <i class="fas fa-dumbbell"></i>
        <h4>숄더 프레스</h4>
        <div class="bubble">
          <p><strong>숄더 프레스란?</strong></p>
          <img class="img-fluid" src="<c:url value="/assets/img/logos/숄더프레스.jpg"/>" alt="..." />
          <p>숄더 프레스는 어깨를 강화하는 운동으로, 바벨이나 덤벨을 어깨 높이에서 위로 밀어 올리는 운동입니다. 어깨 근육의 발달과 함께 상체의 균형을 잡는 데 효과적입니다.</p>
          <p><strong>효과:</strong> 어깨 강화, 상체 균형</p>
          <p><strong>세트:</strong> 3~4세트, 8~12회 반복</p>
        </div>
        <div class="light"></div>
      </div>

      <!-- 플라잉 머신 -->
      <div class="equipment weight" style="top: 25%; left: 37%;">
        <i class="fas fa-dumbbell"></i>
        <h4>플라잉 머신</h4>
        <div class="bubble">
          <p><strong>플라잉 머신이란?</strong></p>
          <img class="img-fluid" src="<c:url value="/assets/img/logos/플라잉머신.jpg"/>" alt="..." />
          <p>플라잉 머신은 가슴 근육을 집중적으로 강화하는 운동 기구로, 팔을 벌리고 당기는 동작을 통해 가슴 근육을 자극합니다. 가슴을 넓히고 조각을 만들기 위한 운동입니다.</p>
          <p><strong>효과:</strong> 가슴 근육 강화, 가슴 넓히기</p>
          <p><strong>세트:</strong> 3~4세트, 8~12회 반복</p>
        </div>
        <div class="light"></div>
      </div>


      <!-- 단체 PT 존 -->
      <div class="equipment flexibility" style="top: 40%; left: 15%; width: 275px; height: 275px;">
        <i class="fas fa-dumbbell"></i>
        <h4>단체 PT 존</h4>
        <div class="bubble">
          <p><strong>단체 PT 존이란?</strong></p>
          <img class="img-fluid" src="<c:url value='/assets/img/logos/3.jpg'/>" alt="..." />
          <p>단체 PT 존은 개인 트레이닝뿐만 아니라, 그룹 운동 수업이나 단체 운동을 위한 공간입니다. 다양한 운동 기구와 함께, 트레이너가 그룹을 이끌며 운동을 할 수 있는 구역입니다.</p>
          <p><strong>효율성:</strong> 팀워크와 동기 부여를 통한 고강도 운동과 협동을 기반으로 한 운동.</p>
          <p><strong>제공되는 수업 종류:</strong></p>
          <ul>
            <li><strong>그룹 운동:</strong> 전신 유산소 운동 및 근력 강화</li>
            <li><strong>요가:</strong> 유연성 및 마음의 안정 운동</li>
            <li><strong>필라테스:</strong> 코어 강화 및 체형 개선 운동</li>
            <li><strong>스피닝:</strong> 심폐 지구력 및 하체 강화 운동</li>
          </ul>
        </div>
      </div>



      <!-- 사이클 머신 2개 추가 -->
      <div class="equipment cardio" style="top: 25%; left: 50%;">
        <i class="fas fa-bicycle"></i>
        <h4>스핀 바이크 1</h4>
        <div class="bubble">
          <p><strong>스핀 바이크란?</strong></p>
          <img class="img-fluid" src="<c:url value='/assets/img/logos/스핀바이크.jpg'/>" alt="..." />
          <p>스핀 바이크는 고강도의 유산소 운동과 하체 근력 강화를 동시에 할 수 있는 기구로, 조정 가능한 저항을 통해 다양한 운동 강도를 제공합니다.</p>
          <p><strong>효율성:</strong> 하체 근력 강화와 체중 감량에 효과적</p>
          <p><strong>저항 레벨:</strong> 1 ~ 20 단계</p>
        </div>
        <div class="light"></div>
      </div>
      <div class="equipment cardio" style="top: 38%; left: 50%; ">
        <i class="fas fa-bicycle"></i>
        <h4>스핀 바이크 2</h4>
        <div class="bubble">
          <p><strong>스핀 바이크란?</strong></p>
          <img class="img-fluid" src="<c:url value='/assets/img/logos/스핀바이크.jpg'/>" alt="..." />
          <p>스핀 바이크는 고강도의 유산소 운동과 하체 근력 강화를 동시에 할 수 있는 기구로, 조정 가능한 저항을 통해 다양한 운동 강도를 제공합니다.</p>
          <p><strong>효율성:</strong> 하체 근력 강화와 체중 감량에 효과적</p>
          <p><strong>저항 레벨:</strong> 1 ~ 20 단계</p>
        </div>
        <div class="light"></div>
      </div>

      <div class="equipment cardio" style="top: 51%; left: 50%; ">
        <i class="fas fa-bicycle"></i>
        <h4>인도어사이클 1</h4>
        <div class="bubble">
          <p><strong>인도어 사이클이란?</strong></p>
          <img class="img-fluid" src="<c:url value='/assets/img/logos/인도어바이크.jpg'/>" alt="..." />
          <p>인도어 사이클은 실내에서 자전거 타기 운동을 할 수 있는 기구로, 지속적인 페달 운동을 통해 심폐지구력을 높이고 칼로리 소모를 증가시킬 수 있습니다.</p>
          <p><strong>효율성:</strong> 유산소 운동에 최적화</p>
          <p><strong>저항 레벨:</strong> 1 ~ 15 단계</p>
        </div>
        <div class="light"></div>
      </div>
      <div class="equipment cardio" style="top: 64%; left: 50%;">
        <i class="fas fa-bicycle"></i>
        <h4>인도어사이클 2</h4>
        <div class="bubble">
          <p><strong>인도어 사이클이란?</strong></p>
          <img class="img-fluid" src="<c:url value='/assets/img/logos/인도어바이크.jpg'/>" alt="..." />
          <p>인도어 사이클은 실내에서 자전거 타기 운동을 할 수 있는 기구로, 지속적인 페달 운동을 통해 심폐지구력을 높이고 칼로리 소모를 증가시킬 수 있습니다.</p>
          <p><strong>효율성:</strong> 유산소 운동에 최적화</p>
          <p><strong>저항 레벨:</strong> 1 ~ 15 단계</p>
        </div>
        <div class="light"></div>
      </div>



      <div class="boundary-line" style="top: 22%; left: 60.6%; width: 2px; height: 57%; background-color: black;"></div>
      <!-- 레그 프레스 머신 -->
      <div class="equipment weight" style="top: 25%; left: 63%; width: 110px; height: 110px;">
        <i class="fas fa-dumbbell"></i>
        <h4 style="white-space: nowrap;">레그 프레스 머신</h4>
        <div class="bubble">
          <p><strong>레그 프레스 머신이란?</strong></p>
          <img class="img-fluid" src="<c:url value='/assets/img/logos/레그프레스.jpg'/>" alt="..." />
          <p>하체 근육 강화에 특화된 기구로, 앉아서 다리로 무게를 밀어내는 운동을 수행합니다.</p>
          <p><strong>효율성:</strong> 하체 근력 및 심폐지구력 강화</p>
          <p><strong>적재 가능 무게:</strong> 최대 300kg</p>
          <p><strong>추천 횟수:</strong> 10-15회 (1세트당)</p>
          <p><strong>추천 세트:</strong> 3-4세트</p>
        </div>
        <div class="light"></div>
      </div>

      <!-- 체스트 프레스 머신 -->
      <div class="equipment weight" style="top: 42.5%; left: 63%; width: 110px; height: 110px;">
        <i class="fas fa-dumbbell"></i>
        <h4 style="white-space: nowrap;">체스트 프레스 머신</h4>
        <div class="bubble">
          <p><strong>체스트 프레스 머신이란?</strong></p>
          <img class="img-fluid" src="<c:url value='/assets/img/logos/체스트프레스.jpg'/>" alt="..." />
          <p>가슴 근육을 강화하는 데 효과적인 기구로, 안정적인 자세에서 강도 높은 운동을 제공합니다.</p>
          <p><strong>효율성:</strong> 상체 근력 강화</p>
          <p><strong>적재 가능 무게:</strong> 최대 200kg</p>
          <p><strong>추천 횟수:</strong> 8-12회 (1세트당)</p>
          <p><strong>추천 세트:</strong> 3-4세트</p>
        </div>
        <div class="light"></div>
      </div>


      <!-- 스미스 머신 -->
      <div class="equipment weight" style="top: 60%; left: 63%; width: 110px; height: 110px;">
        <i class="fas fa-dumbbell"></i>
        <h4>스미스 머신</h4>
        <div class="bubble">
          <p><strong>스미스 머신이란?</strong></p>
          <img class="img-fluid" src="<c:url value='/assets/img/logos/스미스머신.jpg'/>" alt="..." />
          <p>안정적인 레일 시스템을 통해 다양한 근력 운동을 수행할 수 있는 기구입니다.</p>
          <p><strong>효율성:</strong> 전신 근력 강화</p>
          <p><strong>적재 가능 무게:</strong> 최대 250kg</p>
          <p><strong>추천 횟수:</strong> 8-12회 (1세트당)</p>
          <p><strong>추천 세트:</strong> 3-4세트</p>
        </div>
        <div class="light"></div>
      </div>


      <div class="boundary-line" style="top: 79%; left: 11%; width: 65%;"></div>

      <!-- 덤벨존 -->
      <div class="equipment strength" style="top: 81%; left: 13%; width: 130px; height: 120px;">
        <i class="fas fa-dumbbell"></i>
        <h4>덤벨존</h4>
        <div class="bubble">
          <p><strong>덤벨존이란?</strong></p>
          <img class="img-fluid" src="<c:url value='/assets/img/logos/덤벨존.jpg'/>" alt="..." />
          <p>덤벨존은 다양한 덤벨을 이용해 상체와 하체 근력을 강화할 수 있는 공간입니다.</p>
          <p><strong>효율성:</strong> 상체 및 하체 근력 강화</p>
          <p><strong>추천 횟수:</strong> 10-12회 반복</p>
          <p><strong>추천 세트:</strong> 3세트</p>
        </div>
      </div>

      <!-- 렛풀다운 -->
      <div class="equipment strength" style="top: 81%; left: 30%; width: 130px; height: 120px;">
        <i class="fas fa-dumbbell"></i>
        <h4>렛풀다운</h4>
        <div class="bubble">
          <p><strong>스쿼트랙이란?</strong></p>
          <img class="img-fluid" src="<c:url value='/assets/img/logos/렛풀다운.jpg'/>" alt="..." />
          <p>스쿼트랙은 안전하게 스쿼트를 할 수 있도록 도와주는 기구로, 전신 근력 강화를 목표로 합니다.</p>
          <p><strong>효율성:</strong> 하체 근력 강화 및 코어 안정성 향상</p>
          <p><strong>추천 횟수:</strong> 8-12회 반복</p>
          <p><strong>추천 세트:</strong> 3-4세트</p>
        </div>
        <div class="light"></div>
      </div>

      <!-- 풀업 바 -->
      <div class="equipment strength" style="top: 81%; left: 47%; width: 117px; height: 120px;">
        <i class="fas fa-fire-flame-simple"></i>
        <h4>풀업 바</h4>
        <div class="bubble">
          <p><strong>풀업 바란?</strong></p>
          <img class="img-fluid" src="<c:url value='/assets/img/logos/풀업바.jpg'/>" alt="..." />
          <p>풀업 바는 상체 근력을 강화하는 데 가장 기본적인 운동 기구로, 주로 팔과 어깨를 강화합니다.</p>
          <p><strong>효율성:</strong> 상체 근력 강화 및 팔꿈치, 어깨 관절 건강 증진</p>
          <p><strong>추천 횟수:</strong> 6-10회 반복</p>
          <p><strong>추천 세트:</strong> 3세트</p>
        </div>
        <div class="light"></div>
      </div>

      <!-- 딥스 바 -->
      <div class="equipment strength" style="top: 81%; left: 62%; width: 117px; height: 120px;">
        <i class="fas fa-fire-flame-simple"></i>
        <h4>딥스 바</h4>
        <div class="bubble">
          <p><strong>딥스 바란?</strong></p>
          <img class="img-fluid" src="<c:url value='/assets/img/logos/딥스바.jpg'/>" alt="..." />
          <p>딥스 바는 주로 상체 근력과 팔꿈치 주변 근육을 강화하는 운동 기구입니다.</p>
          <p><strong>효율성:</strong> 팔꿈치, 어깨 및 가슴 근육 강화</p>
          <p><strong>추천 횟수:</strong> 8-12회 반복</p>
          <p><strong>추천 세트:</strong> 3세트</p>
        </div>
        <div class="light"></div>
      </div>

      <!-- 준비운동 구역 -->
      <div class="area cardio" style="top: 30%; left: 70%;">
        <i class="fas fa-heartbeat"></i>
        <h4>준비운동 구역</h4>
        <div class="bubble">
          <p><strong>준비운동 구역이란?</strong></p>
          <img class="img-fluid" src="<c:url value='/assets/img/logos/준비운동.jpg'/>" alt="..." />
          <p>준비운동 구역은 운동 전에 몸을 풀고 스트레칭을 할 수 있는 공간으로, 심폐 지구력과 유연성을 증가시키기 위한 다양한 기구들이 배치되어 있습니다.</p>
          <p><strong>효율성:</strong> 운동 전 스트레칭과 워밍업을 통해 부상의 위험을 줄이고, 운동 성능을 향상시킵니다.</p>
          <p><strong>추천 시간:</strong> 10-15분</p>
        </div>
      </div>


      <div class="boundary-line" style="top: 22%; left: 76%; width: 3px; height: 78%; background-color: black;"></div>


      <!-- 스텝밀 머신 1 -->
      <div class="equipment running" style="top: 30%; left: 78%;">
        <i class="fas fa-running"></i>
        <h4>스텝밀 머신 1</h4>
        <div class="bubble">
          <p><strong>스텝밀 머신이란?</strong></p>
          <img class="img-fluid" src="<c:url value='/assets/img/logos/스텝밀머신.jpg'/>" alt="..." />
          <p>스텝밀은 계단 오르기 운동을 통해 하체 근력과 심폐지구력을 동시에 향상시킬 수 있는 기구입니다.</p>
          <p><strong>효율성:</strong> 하체 근력 강화 및 유산소 운동에 효과적</p>
          <p><strong>추천 횟수:</strong> 15-20분 (연속적으로 운동)</p>
          <p><strong>추천 세트:</strong> 3-4세트 (세트 간 휴식 포함)</p>
        </div>
        <div class="light"></div>
      </div>

      <!-- 스텝밀 머신 2 -->
      <div class="equipment running" style="top: 30%; left: 90%;">
        <i class="fas fa-running"></i>
        <h4>스텝밀 머신 2</h4>
        <div class="bubble">
          <p><strong>스텝밀 머신이란?</strong></p>
          <img class="img-fluid" src="<c:url value='/assets/img/logos/스텝밀머신.jpg'/>" alt="..." />
          <p>스텝밀은 계단 오르기 운동을 통해 하체 근력과 심폐지구력을 동시에 향상시킬 수 있는 기구입니다.</p>
          <p><strong>효율성:</strong> 하체 근력 강화 및 유산소 운동에 효과적</p>
          <p><strong>추천 횟수:</strong> 15-20분 (연속적으로 운동)</p>
          <p><strong>추천 세트:</strong> 3-4세트 (세트 간 휴식 포함)</p>
        </div>
        <div class="light"></div>
      </div>

    <%-- 첫번쨰--%>
      <div class="boundary-line" style="top: 45%; left: 76%; width: 24%;"></div>

      <!-- 스쿼트 존 -->
      <div class="equipment weight" style="top: 50%; left: 79%; width: 180px;">
        <i class="fas fa-dumbbell"></i>
        <h4>스쿼트 존</h4>
        <div class="bubble">
          <p><strong>스쿼트 존이란?</strong></p>
          <img class="img-fluid" src="<c:url value='/assets/img/logos/스쿼트존.jpg'/>" alt="..." />
          <p>스쿼트 존은 하체 근력을 강화하는 데 중점을 둔 구역으로, 안전한 방식으로 스쿼트 운동을 수행할 수 있도록 도와주는 기구들이 배치된 공간입니다.</p>
          <p><strong>효율성:</strong> 하체 근력 강화, 코어 안정성 향상</p>
          <p><strong>추천 횟수:</strong> 8-12회 반복</p>
          <p><strong>추천 세트:</strong> 3-4세트</p>
        </div>
        <div class="light"></div>
      </div>


    <%-- 2번쟤--%>
      <div class="boundary-line" style="top: 66%; left: 76%; width: 24%;"></div>

      <!-- 케이블 머신 존 -->
      <div class="equipment cardio" style="top: 70%; left: 79%; width: 185px; height: 185px; font-size: 24px;">
        <i class="fas fa-dumbbell" style="font-size: 48px;"></i>
        <h4>케이블 머신 존</h4>
        <div class="bubble">
          <p><strong>케이블 머신 존이란?</strong></p>
          <img class="img-fluid" src="<c:url value='/assets/img/logos/케이블머신존.jpg'/>" alt="..." />
          <p>케이블 머신 존은 다양한 운동을 할 수 있는 기구가 배치된 구역으로, 주로 상체 근육 강화를 위한 기구들이 포함됩니다.</p>
          <p><strong>효율성:</strong> 근육의 풀 동작 범위를 활용한 운동 효과</p>
          <p><strong>추천 세트:</strong></p>
          <ul>
            <li><strong>케이블 크로스오버:</strong> 3세트 x 12~15회</li>
            <li><strong>케이블 로우:</strong> 3세트 x 10~12회</li>
            <li><strong>케이블 푸쉬다운:</strong> 3세트 x 12~15회</li>
          </ul>
        </div>
      </div>




    </div>
  </div>
</section>

<!-- 스타일링 추가 -->
<style>


  .bubble {
    position: absolute;
    top: 20px; /* 말풍선의 위치 조정 */
    left: 50%;
    transform: translateX(-50%);
    background-color: #f1f1f1;
    padding: 15px;
    border-radius: 10px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    width: 300px; /* 말풍선 너비 */
    font-size: 14px;
    color: #333;
    opacity: 0; /* 처음에는 숨김 처리 */
    visibility: hidden; /* 처음에는 보이지 않게 설정 */
    transition: opacity 0.3s ease, visibility 0.3s ease; /* 부드럽게 나타나고 사라짐 */
    z-index: 999; /* 말풍선의 기본 z-index 설정 */
  }

  .facility:hover .bubble {
    opacity: 1; /* 마우스를 가져다 대면 말풍선이 보이게 */
    visibility: visible; /* 마우스를 가져다 대면 보이게 설정 */
    z-index: 9999; /* 말풍선이 부모 컨테이너에서 가장 위로 가도록 설정 */
  }

  .equipment:hover .bubble {
    opacity: 1; /* 마우스를 가져다 대면 말풍선이 보이게 */
    visibility: visible; /* 마우스를 가져다 대면 보이게 설정 */
    z-index: 9999; /* 말풍선이 부모 컨테이너에서 가장 위로 가도록 설정 */
  }

  .area:hover .bubble {
    opacity: 1; /* 마우스를 가져다 대면 말풍선이 보이게 */
    visibility: visible; /* 마우스를 가져다 대면 보이게 설정 */
    z-index: 9999; /* 말풍선이 부모 컨테이너에서 가장 위로 가도록 설정 */
  }






  .bubble::after {
    content: "";
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    border-width: 10px;
    border-style: solid;
    border-color: #f1f1f1 transparent transparent transparent;
  }


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
    z-index: 9999; /* 마우스를 올리면 해당 equipment가 최상위로 올라가게 설정 */
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


  .equipment:hover .tooltip {
    opacity: 1;
    visibility: visible;
  }

  /* 불빛 이펙트 */
  .light {
    position: absolute;
    top: -10px; /* 러닝머신 1 아이템 위쪽 */
    left: 50%;
    transform: translateX(-50%);
    width: 20px;
    height: 20px;
    background-color: red;
    border-radius: 50%;
    box-shadow: 0 0 15px rgba(255, 255, 0, 0.5);
    animation: blink 3s infinite; /* 5초 간격으로 깜빡임 */
  }

  /* 깜빡이는 애니메이션 */
  @keyframes blink {
    0%, 50%, 100% {
      opacity: 1; /* 켜짐 */
    }
    25%, 75% {
      opacity: 0; /* 꺼짐 */
    }
  }

  /* 운동기구 색깔 */
  .running { background-color: #a8d0e6; }
  .cardio { background-color: #f7a8b8; }
  .weight { background-color: #d4edda; }
  .strength { background-color: #f9e2a1; } /* 새로운 색: 밝은 노랑 */
  .flexibility { background-color: #f8e6e6; } /* 새로운 색: 밝은 분홍 */
  .lightblock { background-color: #e8f8f0; } /* 새로운 색: 거의 하얀색 */

  /* 시설 색깔 */
  .reception { background-color: #f6c23e; }
  .emergency { background-color: #e74a3b; }
  .shower { background-color: #70a1ff; }
  .changing { background-color: #3498db; }
  .restroom { background-color: #2ecc71; }

  /* 남자 탈의실 (연한 파란색) */
  .manlocker {
    background-color: #add8e6; /* 연한 파란색 */
  }

  /* 여자 탈의실 (연한 빨간색) */
  .womanlocker {
    background-color: #ffb6c1; /* 연한 빨간색 */
  }

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
