<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- styles.css 파일을 링크로 추가 -->
<link rel="stylesheet" href="<c:url value='/css/styles.css' />">

<%--헬스장 플로어 맵 동적 스크립트--%>
<script>

    // document.addEventListener('DOMContentLoaded', function() {
    //     // 모든 운동기구를 대상으로 클릭 이벤트를 등록
    //     const equipmentElements = document.querySelectorAll('.equipment');
    //
    //     equipmentElements.forEach(function(equipment) {
    //         // 각 운동기구 블록에 click 이벤트 추가
    //         equipment.addEventListener('click', function() {
    //             // 클릭된 운동기구의 ID 값을 가져옴
    //             const machineNo = equipment.getAttribute('data-machine_no');
    //             const equipmentName = equipment.getAttribute('data-machine_name');
    //
    //             // 알림 창을 띄움
    //             alert(equipmentName + ' 버튼이 눌렸습니다!');
    //
    //             // toggleLight 함수 호출
    //             toggleLight(equipment);
    //         });
    //     });
    // });

    <%--fetch(`/machine/toggle/${machineNo}`, {  // 수정된 경로 사용--%>
    <%--    method: 'POST',  // 상태 변경에는 POST 메서드 사용--%>
    <%--    headers: {--%>
    <%--        'Accept': 'application/json',  // JSON 형식의 응답을 받을 것임을 명시--%>
    <%--    },--%>
    <%--})--%>
    <%--    .then(response => {--%>
    <%--        if (!response.ok) {--%>
    <%--            throw new Error('Failed to toggle machine status');--%>
    <%--        }--%>
    <%--        return response.json();  // JSON 응답으로 변환--%>
    <%--    })--%>
    <%--    .then(data => {--%>
    <%--        console.log('Machine status toggled:', data);  // 새 상태 출력--%>
    <%--        alert(`Machine status: ${data ? 'Active' : 'Inactive'}`);  // 상태에 따라 출력--%>
    <%--    })--%>
    <%--    .catch(error => {--%>
    <%--        if (error instanceof Error) {--%>
    <%--            console.error('Error:', error);  // 에러 로그 콘솔에 출력--%>
    <%--            console.error('Error message:', error.message);  // 에러 메시지를 별도로 출력--%>
    <%--            console.error('Error stack:', error.stack);  // 에러의 stack trace도 출력--%>
    <%--        } else {--%>
    <%--            console.error('Unknown error:', error);  // error가 Error 객체가 아니면 다른 처리--%>
    <%--        }--%>

    <%--        alert('An error occurred while toggling the machine status.\n' + error.message);  // alert 창에서 에러 메시지 출력--%>
    <%--    });--%>

    <%--}--%>
    function confirmStatusChange(event, form) {
        // form 요소의 부모인 .equipment에서 data-machine_name 값을 가져옵니다.
        let machineName = form.parentElement.getAttribute('data-machine_name');

        // machineName 값 확인
        console.log("machineName:", machineName);  // 여기가 제대로 출력되는지 확인
        console.log('선택한 운동기구의 상태를 변경하시겠습니까?');

        // 백틱을 사용하여 문자열 안에 동적으로 machineName 값을 삽입
        const confirmation = confirm(`${machineName}의 상태를 변경하시겠습니까?`);

        // '예'를 클릭하면 폼 제출, '아니오'를 클릭하면 제출 취소
        if (!confirmation) {
            event.preventDefault(); // 폼 제출 취소
        }
        return confirmation; // '예' 클릭 시 폼이 제출됨
    }





    function toggleMachineStatus(element) {
        const machineNo = element.getAttribute('data-machine_no'); // data-machine_no에서 번호 가져오기
        const machineName = element.getAttribute('data-machine_name');

        const form = document.createElement('form'); // 폼 태그 생성
        form.method = 'POST'; // POST 방식 설정
        form.action = `/machine/toggle/${machineNo}`; // 컨트롤러 경로 설정

        // 폼 제출 시 화면 새로고침 방지
        form.style.display = 'none';
        document.body.appendChild(form);
        form.submit();

        // 기계 상태 변경 후 메시지 출력
        alert(`Machine ${machineNo} 상태를 변경 요청하였습니다.`);
    }


    document.addEventListener('DOMContentLoaded', function() {
        // 체크박스 상태 변경 이벤트 리스너
        const showDescriptionsCheckbox = document.getElementById('showDescriptions');

        // 모든 bubble 요소들
        const allBubbles = document.querySelectorAll('.gym-layout .bubble');

        // 체크박스 상태에 따라 각 운동기구의 bubble 표시/숨김
        showDescriptionsCheckbox.addEventListener('change', function() {
            // 체크박스가 체크되었으면 bubble을 보이게, 체크 해제되면 숨기게
            if (showDescriptionsCheckbox.checked) {
                allBubbles.forEach(function(bubble) {
                    bubble.style.display = 'block'; // bubble 보이기
                });
            } else {
                allBubbles.forEach(function(bubble) {
                    bubble.style.display = 'none'; // bubble 숨기기
                });
            }
        });
    });
</script>

<div>
    <input type="checkbox" id="showDescriptions" checked>
    <label for="showDescriptions" class="switch-label">기구 설명 및 사용법 확인</label>
</div>
</div>


<div class="container">
    <div class="text-center">
        <h2 class="section-heading text-uppercase">헬스장 플로어 맵</h2>
        <h3 class="section-subheading text-muted">운동 기구와 주요 시설을 한눈에 확인해보세요!</h3>
    </div>

    <!-- 운동기구 설명 보기 체크박스 추가 -->
    <div class="gym-layout">
        <div class="equipment running" style="top: 8%; left: 3%;" data-machine_no="1" data-machine_name="러닝머신1">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="1">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-running"></i>
                    <h4>러닝머신 1</h4>
                </button>
            </form>
            <div class="bubble">
                <p><strong>러닝머신이란?</strong></p>
                <img class="img-fluid" src="<c:url value='/assets/img/logos/running.jpg'/>" alt="..." />
                <p>러닝머신은 체력과 유산소 운동을 동시에 개선할 수 있는 운동 기계로...</p>
                <p><strong>효율성:</strong> 고속 운동에 적합, 칼로리 소모가 많음</p>
                <p><strong>속도:</strong> 1 ~ 15 km/h</p>
            </div>
            <div class="light"></div> <!-- 기본 상태: inactive -->
        </div>

        <div class="equipment running" style="top: 8%; left: 14%;" data-machine_no="2" data-machine_name="러닝머신2">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="2">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-running"></i>
                    <h4>러닝머신 2</h4>
                </button>
            </form>
            <div class="bubble">
                <p><strong>러닝머신이란?</strong></p>
                <img class="img-fluid" src="<c:url value='/assets/img/logos/running.jpg'/>" alt="..." />
                <p>러닝머신은 체력과 유산소 운동을 동시에 개선할 수 있는 운동 기계로...</p>
                <p><strong>효율성:</strong> 고속 운동에 적합, 칼로리 소모가 많음</p>
                <p><strong>속도:</strong> 1 ~ 15 km/h</p>
            </div>
            <div class="light"></div> <!-- 기본 상태: inactive -->
        </div>

        <div class="equipment running" style="top: 8%; left: 25%;" data-machine_no="3" data-machine_name="러닝머신3">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="3">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-running"></i>
                    <h4>러닝머신 3</h4>
                </button>
            </form>
            <div class="bubble">
                <p><strong>러닝머신이란?</strong></p>
                <img class="img-fluid" src="<c:url value='/assets/img/logos/running.jpg'/>" alt="..." />
                <p>러닝머신은 체력과 유산소 운동을 동시에 개선할 수 있는 운동 기계로...</p>
                <p><strong>효율성:</strong> 고속 운동에 적합, 칼로리 소모가 많음</p>
                <p><strong>속도:</strong> 1 ~ 15 km/h</p>
            </div>
            <div class="light"></div> <!-- 기본 상태: inactive -->
        </div>

        <div class="equipment running" style="top: 8%; left: 36%;" data-machine_no="4" data-machine_name="러닝머신4">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="4">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-running"></i>
                    <h4>러닝머신 4</h4>
                </button>
            </form>
            <div class="bubble">
                <p><strong>러닝머신이란?</strong></p>
                <img class="img-fluid" src="<c:url value='/assets/img/logos/running.jpg'/>" alt="..." />
                <p>러닝머신은 체력과 유산소 운동을 동시에 개선할 수 있는 운동 기계로...</p>
                <p><strong>효율성:</strong> 고속 운동에 적합, 칼로리 소모가 많음</p>
                <p><strong>속도:</strong> 1 ~ 15 km/h</p>
            </div>
            <div class="light"></div> <!-- 기본 상태: inactive -->
        </div>

        <div class="equipment running" style="top: 8%; left: 47%;" data-machine_no="5" data-machine_name="러닝머신5">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="5">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-running"></i>
                    <h4>러닝머신 5</h4>
                </button>
            </form>
            <div class="bubble">
                <p><strong>러닝머신이란?</strong></p>
                <img class="img-fluid" src="<c:url value='/assets/img/logos/running.jpg'/>" alt="..." />
                <p>러닝머신은 체력과 유산소 운동을 동시에 개선할 수 있는 운동 기계로...</p>
                <p><strong>효율성:</strong> 고속 운동에 적합, 칼로리 소모가 많음</p>
                <p><strong>속도:</strong> 1 ~ 15 km/h</p>
            </div>
            <div class="light"></div> <!-- 기본 상태: inactive -->
        </div>

        <div class="equipment running" style="top: 8%; left: 58%;" data-machine_no="6" data-machine_name="러닝머신6">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="6">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-running"></i>
                    <h4>러닝머신 6</h4>
                </button>
            </form>
            <div class="bubble">
                <p><strong>러닝머신이란?</strong></p>
                <img class="img-fluid" src="<c:url value='/assets/img/logos/running.jpg'/>" alt="..." />
                <p>러닝머신은 체력과 유산소 운동을 동시에 개선할 수 있는 운동 기계로...</p>
                <p><strong>효율성:</strong> 고속 운동에 적합, 칼로리 소모가 많음</p>
                <p><strong>속도:</strong> 1 ~ 15 km/h</p>
            </div>
            <div class="light"></div> <!-- 기본 상태: inactive -->
        </div>

        <div class="equipment running" style="top: 8%; left: 69%;" data-machine_no="7" data-machine_name="러닝머신7">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="7">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-running"></i>
                    <h4>러닝머신 7</h4>
                </button>
            </form>
            <div class="bubble">
                <p><strong>러닝머신이란?</strong></p>
                <img class="img-fluid" src="<c:url value='/assets/img/logos/running.jpg'/>" alt="..." />
                <p>러닝머신은 체력과 유산소 운동을 동시에 개선할 수 있는 운동 기계로...</p>
                <p><strong>효율성:</strong> 고속 운동에 적합, 칼로리 소모가 많음</p>
                <p><strong>속도:</strong> 1 ~ 15 km/h</p>
            </div>
            <div class="light"></div> <!-- 기본 상태: inactive -->
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
        <div class="equipment weight" style="top: 25%; left: 13%;" data-machine_no="8" data-machine_name="벤치 프레스">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="8">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-dumbbell"></i>
                    <h4>밴치 프레스</h4>
                </button>
            </form>
            <div class="bubble">
                <p><strong>밴치 프레스란?</strong></p>
                <img class="img-fluid" src="<c:url value='/assets/img/logos/벤치.jpg'/>" alt="..." />
                <p>밴치 프레스는 가슴과 어깨, 팔을 강화하는 운동으로, 바벨을 가슴 위로 밀어올리는 운동입니다. 가슴 근육을 집중적으로 강화하는 데 효과적이며, 상체 근육 발달에 중요한 역할을 합니다.</p>
                <p><strong>효과:</strong> 가슴, 어깨, 팔 강화</p>
                <p><strong>세트:</strong> 3~4세트, 8~12회 반복</p>
            </div>
            <div class="light"></div>
        </div>


        <!-- 숄더프레스 -->
        <div class="equipment weight" style="top: 25%; left: 25%;" data-machine_no="9" data-machine_name="숄더프레스">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="9">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-dumbbell"></i>
                    <h4>숄더 프레스</h4>
                </button>
            </form>
            <div class="bubble">
                <p><strong>숄더 프레스란?</strong></p>
                <img class="img-fluid" src="<c:url value='/assets/img/logos/숄더프레스.jpg'/>" alt="..." />
                <p>숄더 프레스는 어깨를 강화하는 운동으로, 바벨이나 덤벨을 어깨 높이에서 위로 밀어 올리는 운동입니다. 어깨 근육의 발달과 함께 상체의 균형을 잡는 데 효과적입니다.</p>
                <p><strong>효과:</strong> 어깨 강화, 상체 균형</p>
                <p><strong>세트:</strong> 3~4세트, 8~12회 반복</p>
            </div>
            <div class="light"></div>
        </div>

        <!-- 플라잉 머신 -->
        <div class="equipment weight" style="top: 25%; left: 37%;" data-machine_no="10" data-machine_name="플라잉머신">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="10">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-dumbbell"></i>
                    <h4>플라잉 머신</h4>
                </button>
            </form>
            <div class="bubble">
                <p><strong>플라잉 머신이란?</strong></p>
                <img class="img-fluid" src="<c:url value='/assets/img/logos/플라잉머신.jpg'/>" alt="..." />
                <p>플라잉 머신은 가슴 근육을 집중적으로 강화하는 운동 기구로, 팔을 벌리고 당기는 동작을 통해 가슴 근육을 자극합니다. 가슴을 넓히고 조각을 만들기 위한 운동입니다.</p>
                <p><strong>효과:</strong> 가슴 근육 강화, 가슴 넓히기</p>
                <p><strong>세트:</strong> 3~4세트, 8~12회 반복</p>
            </div>
            <div class="light"></div>
        </div>



        <!-- 단체 PT 존 -->
        <div class="equipment flexibility" style="top: 40%; left: 19%; width: 275px; height: 275px;" data-machine_no="26" data-machine_name="단체 PT 존">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="26">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-dumbbell"></i>
                    <h4>단체 PT 존</h4>
                </button>
            </form>
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
            <div class="light"></div>
        </div>


        <!-- 사이클 머신 2개 추가 -->
        <div class="equipment cardio" style="top: 25%; left: 50%;" data-machine_no="11" data-machine_name="스핀 바이크 1">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="11">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-bicycle"></i>
                    <h4>스핀 바이크 1</h4>
                </button>
            </form>
            <div class="bubble">
                <p><strong>스핀 바이크란?</strong></p>
                <img class="img-fluid" src="<c:url value='/assets/img/logos/스핀바이크.jpg'/>" alt="..." />
                <p>스핀 바이크는 고강도의 유산소 운동과 하체 근력 강화를 동시에 할 수 있는 기구로, 조정 가능한 저항을 통해 다양한 운동 강도를 제공합니다.</p>
                <p><strong>효율성:</strong> 하체 근력 강화와 체중 감량에 효과적</p>
                <p><strong>저항 레벨:</strong> 1 ~ 20 단계</p>
            </div>
            <div class="light"></div>
        </div>

        <div class="equipment cardio" style="top: 38%; left: 50%;" data-machine_no="12" data-machine_name="스핀 바이크 2">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="12">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-bicycle"></i>
                    <h4>스핀 바이크 2</h4>
                </button>
            </form>
            <div class="bubble">
                <p><strong>스핀 바이크란?</strong></p>
                <img class="img-fluid" src="<c:url value='/assets/img/logos/스핀바이크.jpg'/>" alt="..." />
                <p>스핀 바이크는 고강도의 유산소 운동과 하체 근력 강화를 동시에 할 수 있는 기구로, 조정 가능한 저항을 통해 다양한 운동 강도를 제공합니다.</p>
                <p><strong>효율성:</strong> 하체 근력 강화와 체중 감량에 효과적</p>
                <p><strong>저항 레벨:</strong> 1 ~ 20 단계</p>
            </div>
            <div class="light"></div>
        </div>



        <div class="equipment cardio" style="top: 51%; left: 50%;" data-machine_no="13" data-machine_name="인도어사이클 1">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="13">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-bicycle"></i>
                    <h4>인도어사이클 1</h4>
                </button>
            </form>
            <div class="bubble">
                <p><strong>인도어 사이클이란?</strong></p>
                <img class="img-fluid" src="<c:url value='/assets/img/logos/인도어바이크.jpg'/>" alt="..." />
                <p>인도어 사이클은 실내에서 자전거 타기 운동을 할 수 있는 기구로, 지속적인 페달 운동을 통해 심폐지구력을 높이고 칼로리 소모를 증가시킬 수 있습니다.</p>
                <p><strong>효율성:</strong> 유산소 운동에 최적화</p>
                <p><strong>저항 레벨:</strong> 1 ~ 15 단계</p>
            </div>
            <div class="light"></div>
        </div>

        <div class="equipment cardio" style="top: 64%; left: 50%;" data-machine_no="14" data-machine_name="인도어사이클 2">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="14">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-bicycle"></i>
                    <h4>인도어사이클 2</h4>
                </button>
            </form>
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
        <div class="equipment weight"
             style="top: 25%; left: 63%; width: 110px; height: 110px;"
             data-machine_no="15"
             data-machine_name="레그 프레스 머신">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="15">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-dumbbell"></i>
                    <h4 style="white-space: nowrap;">레그 프레스 머신</h4>
                </button>
            </form>
            <div class="bubble">
                <p><strong>레그 프레스 머신이란?</strong></p>
                <img class="img-fluid" src="<c:url value='/assets/img/logos/레그프레스.jpg'/>" alt="..." />
                <p>하체 근육 강화에 특화된 기구로, 앉아서 다리로 무게를 밀어내는 운동을 수행합니다.</p>
                <p><strong>효율성:</strong> 하체 근력 및 심폐지구력 강화</p>
                <p><strong>적재 가능 무게:</strong> 최대 300kg</p>
                <p><strong>추천 횟수:</strong> 10-15회 (1세트당)</p>
                <p><strong>추천 세트:</strong> 3-4세트</p>
            </div>
        </div>

        <!-- 체스트 프레스 머신 -->
        <div class="equipment weight" style="top: 42.5%; left: 63%; width: 110px; height: 110px;" data-machine_no="16" data-machine_name="체스트 프레스 머신">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="16">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-dumbbell"></i>
                    <h4 style="white-space: nowrap;">체스트 프레스 머신</h4>
                </button>
            </form>
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
        <div class="equipment weight" style="top: 60%; left: 63%; width: 110px; height: 110px;" data-machine_no="17" data-machine_name="스미스 머신">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="17">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-dumbbell"></i>
                    <h4>스미스 머신</h4>
                </button>
            </form>
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

        <!-- 덤벨존 -->
        <div class="equipment strength" style="top: 81%; left: 13%; width: 130px; height: 120px;" data-machine_no="18" data-machine_name="덤벨 존">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="18">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-dumbbell"></i>
                    <h4>덤벨존</h4>
                </button>
            </form>
            <div class="bubble">
                <p><strong>덤벨존이란?</strong></p>
                <img class="img-fluid" src="<c:url value='/assets/img/logos/덤벨존.jpg'/>" alt="..." />
                <p>덤벨존은 다양한 덤벨을 이용해 상체와 하체 근력을 강화할 수 있는 공간입니다.</p>
                <p><strong>효율성:</strong> 상체 및 하체 근력 강화</p>
                <p><strong>추천 횟수:</strong> 10-12회 반복</p>
                <p><strong>추천 세트:</strong> 3세트</p>
            </div>
            <div class="light"></div>
        </div>

        <!-- 렛풀다운 -->
        <div class="equipment strength" style="top: 81%; left: 30%; width: 130px; height: 120px;" data-machine_no="19" data-machine_name="렛풀다운">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="19">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-dumbbell"></i>
                    <h4>렛풀다운</h4>
                </button>
            </form>
            <div class="bubble">
                <p><strong>렛풀다운이란?</strong></p>
                <img class="img-fluid" src="<c:url value='/assets/img/logos/렛풀다운.jpg'/>" alt="렛풀다운" />
                <p>렛풀다운은 상체 근력을 강화하는 운동으로, 주로 등과 어깨 근육을 목표로 합니다. 풀다운 머신을 이용해 팔꿈치를 아래로 당겨서 강한 상체 근육을 만들 수 있습니다.</p>
                <p><strong>효율성:</strong> 등, 어깨, 팔 근력 강화 및 체형 개선</p>
                <p><strong>추천 횟수:</strong> 8-12회 반복</p>
                <p><strong>추천 세트:</strong> 3-4세트</p>
            </div>
            <div class="light"></div>
        </div>

        <!-- 풀업 바 -->
        <div class="equipment strength" style="top: 81%; left: 47%; width: 117px; height: 120px;" data-machine_no="20" data-machine_name="벤치 프레스">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="20">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-fire-flame-simple"></i>
                    <h4>풀업 바</h4>
                </button>
            </form>
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
        <div class="equipment strength" style="top: 81%; left: 62%; width: 117px; height: 120px;" data-machine_no="21" data-machine_name="벤치 프레스">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="21">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-fire-flame-simple"></i>
                    <h4>딥스 바</h4>
                </button>
            </form>
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
        <div class="equipment running" style="top: 30%; left: 78%;" data-machine_no="22" data-machine_name="스텝업 머신1">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="22">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-running"></i>
                    <h4>스텝밀 머신 1</h4>
                </button>
            </form>
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
        <div class="equipment running" style="top: 30%; left: 90%;" data-machine_no="23" data-machine_name="스텝업 머신2">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="23">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-running"></i>
                    <h4>스텝밀 머신 2</h4>
                </button>
            </form>
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
        <div class="equipment weight" style="top: 50%; left: 81%; width: 180px;" data-machine_no="24" data-machine_name="스쿼트 존">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="24">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-dumbbell"></i>
                    <h4>스쿼트 존</h4>
                </button>
            </form>
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
        <div class="equipment cardio" style="top: 70%; left: 79%; width: 185px; height: 185px; font-size: 24px;" data-machine_no="25" data-machine_name="케이블 머신 존">
            <form action="/machine/toggle" method="POST" onsubmit="return confirmStatusChange(event, this)">
                <input type="hidden" name="machineNo" value="25">
                <button type="submit" style="all: unset; cursor: pointer;">
                    <i class="fas fa-dumbbell" style="font-size: 48px;"></i>
                    <h4>케이블 머신 존</h4>
                </button>
            </form>
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
            <div class="light"></div>
        </div>

 </div>



<!-- 스타일링 추가 -->
<style>
    /* 운동기구 설명 보기 스위치 스타일 */
    .switch-label {
        display: inline-block;
        position: relative;
        padding-left: 50px;
        cursor: pointer;
        font-size: 18px;
        font-weight: bold;
        color: #555;
    }

    /* 스위치 버튼 */
    .switch-label::before {
        content: '';
        position: absolute;
        left: 0;
        top: 0;
        width: 40px;
        height: 25px;
        background-color: #ccc;
        border-radius: 50px;
        transition: 0.3s;
    }

    .switch-label::after {
        content: '';
        position: absolute;
        top: 2px;
        left: 2px;
        width: 16px;
        height: 16px;
        background-color: white;
        border-radius: 50%;
        transition: 0.3s;
    }

    /* 체크박스가 체크되었을 때 */
    input[type="checkbox"]:checked + .switch-label::before {
        background-color: #4caf50; /* 스위치가 켜졌을 때 */
    }

    input[type="checkbox"]:checked + .switch-label::after {
        left: 22px; /* 스위치가 오른쪽으로 이동 */
    }

    /* 체크박스 숨기기 */
    input[type="checkbox"] {
        display: none;
    }


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
        top: -10px;
        left: 50%;
        transform: translateX(-50%);
        width: 20px;
        height: 20px;
        border-radius: 50%;
        background-color: transparent; /* 초기 상태: 꺼짐 */
        transition: background-color 0.3s ease;
        animation: blink 1s infinite; /* 깜빡이는 애니메이션 */
    }

    /* 'on' 클래스가 추가되면 불빛이 켜짐 */
    .light.on {
        background-color: yellow; /* 불빛 켜짐 */
        box-shadow: 0 0 15px rgba(255, 255, 0, 0.7); /* 빛나는 효과 */
    }

    /* 깜빡이는 효과 */
    @keyframes blink {
        0% { opacity: 1; }
        50% { opacity: 0.5; }
        100% { opacity: 1; }
    }

    .machine.active {
        animation: blink 2s ease-in-out infinite; /* 2초 동안 깜빡이도록 설정 */
    }

    .machine {
        position: relative;
        width: 100px;
        height: 100px;
        margin: 20px;
        display: inline-block;
        text-align: center;
        cursor: pointer;
    }

    .machine .light {
        display: block;
        position: absolute;
        top: 8px;
        left: 50%;
        transform: translateX(-50%);
        width: 15px;
        height: 15px;
        border-radius: 50%;
        background-color: transparent;
    }

    .machine .icon {
        font-size: 30px;
        margin-top: 10px;
    }


    /* 운동기구 색깔 */
    .running { background-color: #a8d0e6; }
    .cardio { background-color: #f7a8b8; }
    .weight { background-color: #d4edda; }
    .strength { background-color: #f9e2a1; } /* 새로운 색: 밝은 노랑 */
    .flexibility { background-color: #f8e6e6; } /* 새로운 색: 밝은 분홍 */


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


