<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="main-panel">
  <div class="content-wrapper">
    <div class="row">
      <div class="col-sm-12">
        <div class="home-tab">
          <div class="d-sm-flex align-items-center justify-content-between border-bottom">
            <ul class="nav nav-tabs" role="tablist">
              <li class="nav-item">
                <a class="nav-link active ps-0" id="home-tab" data-bs-toggle="tab"
                   href="#overview" role="tab" aria-controls="overview" aria-selected="true">첫번째 페이지</a>
              </li>

            </ul>
            <div>
              <div class="btn-wrapper">
                <a href="#" class="btn btn-otline-dark align-items-center"><i
                        class="icon-share"></i> Share</a>
                <a href="#" class="btn btn-otline-dark"><i class="icon-printer"></i> Print</a>
                <a href="#" class="btn btn-primary text-white me-0"><i
                        class="icon-download"></i> Export</a>
              </div>
            </div>
          </div>
          <div class="tab-content tab-content-basic">
            <div class="tab-pane fade show active" id="overview" role="tabpanel"
                 aria-labelledby="overview">
              <%--                                    통계--%>
              <div class="row">
                <div class="col-sm-12">
                  <div class="statistics-details d-flex align-items-center justify-content-between">
                    <div>
                      <p class="statistics-title">Bounce Rate</p>
                      <h3 class="rate-percentage">32.53%</h3>
                      <p class="text-danger d-flex"><i
                              class="mdi mdi-menu-down"></i><span>-0.5%</span></p>
                    </div>
                    <div>
                      <p class="statistics-title">Page Views</p>
                      <h3 class="rate-percentage">8,1235</h3>
                      <p class="text-success d-flex"><i class="mdi mdi-menu-up"></i><span>+0.1%</span>
                      </p>
                    </div>
                    <div>
                      <p class="statistics-title">New Sessions</p>
                      <h3 class="rate-percentage">68.8</h3>
                      <p class="text-danger d-flex"><i
                              class="mdi mdi-menu-down"></i><span>68.8</span></p>
                    </div>
                    <div class="d-none d-md-block">
                      <p class="statistics-title">Avg. Time on Site</p>
                      <h3 class="rate-percentage">2m:35s</h3>
                      <p class="text-success d-flex"><i
                              class="mdi mdi-menu-down"></i><span>+0.8%</span></p>
                    </div>
                    <div class="d-none d-md-block">
                      <p class="statistics-title">New Sessions</p>
                      <h3 class="rate-percentage">68.8</h3>
                      <p class="text-danger d-flex"><i
                              class="mdi mdi-menu-down"></i><span>68.8</span></p>
                    </div>
                    <div class="d-none d-md-block">
                      <p class="statistics-title">Avg. Time on Site</p>
                      <h3 class="rate-percentage">2m:35s</h3>
                      <p class="text-success d-flex"><i
                              class="mdi mdi-menu-down"></i><span>+0.8%</span></p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-8 d-flex flex-column">
                  <div class="row flex-grow">
                    <div class="col-12 col-lg-4 col-lg-12 grid-margin stretch-card">
                      <div class="card card-rounded">
                        <div class="card-body">
                          <div class="d-sm-flex justify-content-between align-items-start">
                            <div>
                              <h4 class="card-title card-title-dash">일별 방문자 수</h4>
                            </div>
                            <div id="performanceLine-legend"></div>
                          </div>
                          <div class="chartjs-wrapper mt-4">
                            <canvas id="performanceLine2"></canvas>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <script>
                  // 차트 객체를 추적할 변수 선언
                  let myChart = null;

                  // 차트를 그리는 함수
                  function drawChart(dates, visitors, canvasElement) {
                    const ctx = canvasElement.getContext('2d');
                    ctx.clearRect(0, 0, canvasElement.width, canvasElement.height);

                    // 그라데이션 효과를 위한 배경 설정
                    const gradient = ctx.createLinearGradient(0, 0, 0, canvasElement.height);
                    gradient.addColorStop(0, 'rgba(75, 192, 192, 0.2)');
                    gradient.addColorStop(1, 'rgba(75, 192, 192, 0.6)');

                    // 새 차트를 그리기
                    myChart = new Chart(ctx, {
                      type: 'line',
                      data: {
                        labels: dates,  // x축에 날짜
                        datasets: [{
                          label: '일별 방문자 수',
                          data: visitors,  // y축에 방문자 수
                          borderColor: 'rgb(75, 192, 192)',  // 라인 색상
                          backgroundColor: gradient,  // 그라데이션 색상
                          fill: true,  // 영역 채우기
                          tension: 0.4,  // 곡선의 부드러움 조절
                          pointRadius: 5,  // 데이터 포인트의 크기
                          pointBackgroundColor: 'rgb(75, 192, 192)',  // 데이터 포인트 색상
                          borderWidth: 2,  // 선의 두께
                        }]
                      },
                      options: {
                        responsive: true,
                        maintainAspectRatio: false,  // 화면 크기에 맞게 비율 조정
                        plugins: {
                          legend: {
                            position: 'top',  // 범례 위치 설정
                            labels: {
                              font: {
                                size: 14,
                                weight: 'bold',
                              }
                            }
                          },
                          tooltip: {
                            callbacks: {
                              label: function(tooltipItem) {
                                return tooltipItem.raw + '명';  // 툴팁에 방문자 수 표시
                              }
                            },
                            backgroundColor: 'rgba(0,0,0,0.7)',  // 툴팁 배경 색상
                            titleFont: {
                              weight: 'bold',
                              size: 14
                            }
                          }
                        },
                        scales: {
                          x: {
                            ticks: {
                              font: {
                                size: 12,
                                weight: 'bold'
                              }
                            },
                            grid: {
                              color: 'rgba(0, 0, 0, 0.1)',  // x축 그리드 색상
                            }
                          },
                          y: {
                            ticks: {
                              font: {
                                size: 12,
                                weight: 'bold'
                              },
                              callback: function(value) {
                                return value + '명';  // y축 값 뒤에 '명' 추가
                              }
                            },
                            grid: {
                              color: 'rgba(0, 0, 0, 0.1)',  // y축 그리드 색상
                            }
                          }
                        }
                      }
                    });
                  }

                  fetch('/api/attendance/getDailyVisitors')
                          .then(response => response.json())
                          .then(data => {
                            // 날짜와 방문자 수 배열 만들기
                            const dates = data.map(item => item.visit_date);
                            const visitors = data.map(item => item.daily_visitors);

                            console.log('Dates:', dates);
                            console.log('Visitors:', visitors);

                            // 차트를 그리기 전에 기존 차트를 파괴하고 canvas 초기화
                            const canvasElement = document.getElementById('performanceLine2');

                            if (myChart) {
                              myChart.destroy();  // 기존 차트 파괴
                            }

                            // 차트를 새로 그리기 전에 canvas 크기 재설정
                            const canvasParentWidth = canvasElement.parentElement.clientWidth; // 부모 요소의 너비
                            canvasElement.width = canvasParentWidth; // 부모 너비에 맞게 canvas 크기 설정
                            canvasElement.height = 300; // 차트의 높이를 고정 (필요에 따라 변경)

                            drawChart(dates, visitors, canvasElement);
                          })
                          .catch(error => {
                            console.error('Error fetching daily visitors data:', error);
                          });
                </script>






              <%--     오른쪽 표 --%>
                <div class="col-lg-4 d-flex flex-column">
                  <div class="row flex-grow">
                    <div class="col-md-6 col-lg-12 grid-margin stretch-card">
                      <div class="card bg-primary card-rounded">
                        <div class="card-body pb-0">
                          <h4 class="card-title card-title-dash text-white mb-4">
                            Status Summary</h4>
                          <div class="row">
                            <div class="col-sm-4">
                              <p class="status-summary-ight-white mb-1">이용중인 회원 수</p>
                              <h2 class="text-info" id="activeMemberCount">Loading...</h2> <!-- activeMemberCount 값 표시 -->
                            </div>
                            <div class="col-sm-8">
                              <div class="status-summary-chart-wrapper pb-4">
                                <canvas id="status-summary"></canvas>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <script>
                      // 페이지 로드 후 activeMemberCount를 가져오는 AJAX 요청
                      document.addEventListener('DOMContentLoaded', function () {
                        fetch('/api/attendance/active-member-count')
                                .then(response => response.json()) // JSON 형식으로 응답 받기
                                .then(data => {

                                  document.getElementById('activeMemberCount').textContent = data;
                                })
                                .catch(error => {
                                  console.error('Error fetching active member count:', error);
                                  document.getElementById('activeMemberCount').textContent = 'Error';
                                });
                      });
                    </script>

                    <div class="col-md-6 col-lg-12 grid-margin stretch-card">
                      <div class="card card-rounded">
                        <div class="card-body">
                          <div class="row">
                            <div class="col-lg-6">
                              <div class="d-flex justify-content-between align-items-center mb-2 mb-sm-0">
                                <div>
                                  <p class="text-small mb-2">누적 방문자 수</p>
                                  <!-- 누적 방문자 수는 JavaScript로 값이 변경됨 -->
                                  <h4 id="totalVisitorsCount2" class="mb-0 fw-bold">0</h4>
                                </div>
                              </div>
                            </div>
                            <div class="col-lg-6">
                              <div class="d-flex justify-content-between align-items-center">
                                <div>
                                  <p class="text-small mb-2">오늘 방문자 수</p>
                                  <!-- 오늘 방문자 수는 JavaScript로 값이 변경됨 -->
                                  <h4 id="todayVisitorsCount2" class="mb-0 fw-bold">0</h4>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <script>

                      // 누적 방문자 수 가져오기
                      fetch('/api/attendance/getTotalVisitors')
                              .then(response => response.json())
                              .then(data => {
                                console.log("누적 방문자 수 응답:", data); // 응답 확인
                                document.getElementById('totalVisitorsCount2').innerText = data || 0; // 기본값 처리
                              })
                              .catch(error => {
                                console.error('Error fetching total visitors:', error);
                              });

                      // 오늘 방문자 수 가져오기
                      fetch('/api/attendance/getVisitorsToday')
                              .then(response => response.json())
                              .then(data => {
                                console.log("오늘 방문자 수 응답:", data); // 응답 확인
                                document.getElementById('todayVisitorsCount2').innerText = data || 0; // 기본값 처리
                              })
                              .catch(error => {
                                console.error('Error fetching visitors today:', error);
                              });

                    </script>


                  </div>
                </div>
              </div>
              <%--    하단 막대그래프 위치와 투두--%>
              <div class="row">
                <div class="col-lg-8 d-flex flex-column">
                  <div class="row flex-grow">
                    <div class="col-12 grid-margin stretch-card">
                      <div class="card card-rounded">
                        <div class="card-body">
                          <div class="d-sm-flex justify-content-between align-items-start">
                            <div>
                              <h4 class="card-title card-title-dash">Market
                                Overview</h4>
                              <p class="card-subtitle card-subtitle-dash">Lorem
                                ipsum dolor sit amet consectetur adipisicing
                                elit</p>
                            </div>
                            <div>
                              <div class="dropdown">
                                <button class="btn btn-light dropdown-toggle toggle-dark btn-lg mb-0 me-0"
                                        type="button" id="dropdownMenuButton2"
                                        data-bs-toggle="dropdown"
                                        aria-haspopup="true"
                                        aria-expanded="false"> This month
                                </button>
                                <div class="dropdown-menu"
                                     aria-labelledby="dropdownMenuButton2">
                                  <h6 class="dropdown-header">Settings</h6>
                                  <a class="dropdown-item" href="#">Action</a>
                                  <a class="dropdown-item" href="#">Another
                                    action</a>
                                  <a class="dropdown-item" href="#">Something
                                    else here</a>
                                  <div class="dropdown-divider"></div>
                                  <a class="dropdown-item" href="#">Separated
                                    link</a>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="d-sm-flex align-items-center mt-1 justify-content-between">
                            <div class="d-sm-flex align-items-center mt-4 justify-content-between">
                              <h2 class="me-2 fw-bold">$36,2531.00</h2>
                              <h4 class="me-2">USD</h4>
                              <h4 class="text-success">(+1.37%)</h4>
                            </div>
                            <div class="me-3">
                              <div id="marketingOverview-legend"></div>
                            </div>
                          </div>
                          <div class="chartjs-bar-wrapper mt-3">
                            <canvas id="marketingOverview"></canvas>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row flex-grow">
                    <div class="col-12 grid-margin stretch-card">
                      <div class="card card-rounded table-darkBGImg">
                        <div class="card-body">
                          <div class="col-sm-8">
                            <h3 class="text-white upgrade-info mb-0"> Enhance your
                              <span class="fw-bold">Campaign</span> for better
                              outreach </h3>
                            <a href="#" class="btn btn-info upgrade-btn">Upgrade
                              Account!</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="row flex-grow">
                    <div class="col-12 grid-margin stretch-card">
                      <div class="card card-rounded">
                        <div class="card-body">
                          <div class="d-sm-flex justify-content-between align-items-start">
                            <div>
                              <h4 class="card-title card-title-dash"> ${currentMonth}달 출석왕 회원
                                </h4>

                            </div>
                            <div>
                              <button class="btn btn-primary btn-lg text-white mb-0 me-0"
                                      type="button"><i
                                      class="mdi mdi-account-plus"></i>Add new
                                member
                              </button>
                            </div>
                          </div>
                          <div class="table-responsive  mt-1">
                            <table class="table select-table">
                              <thead>
                              <tr>
                                <th>
                                  <div class="form-check form-check-flat mt-0">
                                    <label class="form-check-label">
                                      <input type="checkbox"
                                             class="form-check-input"
                                             aria-checked="false"
                                             id="check-all"><i
                                            class="input-helper"></i></label>
                                  </div>
                                </th>
                                <th>회원ID</th>
                                <th>Progress</th>

                              </tr>
                              </thead>
                                <tbody>
                                  <c:forEach var="member" items="${members}">
                                    <tr>
                                      <td>
                                        <div class="form-check form-check-flat mt-0">
                                          <label class="form-check-label">
                                            <input type="checkbox" class="form-check-input" aria-checked="false"><i class="input-helper"></i>
                                          </label>
                                        </div>
                                      </td>
                                      <td>
                                        <div class="d-flex ">
                                          <img src="<c:url value='/assets/images/faces/face1.jpg'/>" alt="">
                                          <div>
                                            <h6>${member.custId}</h6>
                                            <p>Head admin</p>
                                          </div>
                                        </div>
                                      </td>
                                      <td>
                                        <h6>${member.attendanceCount}/${member.totalDaysInMonth}</h6>
                                        <div>
                                          <div class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">
                                            <p class="text-success">${member.attendanceRate}%</p>
                                          </div>
                                          <div class="progress progress-md">
                                            <div class="progress-bar bg-success" role="progressbar"
                                                 style="width: ${member.attendanceRate}%"
                                                 aria-valuenow="${member.attendanceRate}" aria-valuemin="0" aria-valuemax="100"></div>
                                          </div>
                                        </div>
                                      </td>
                                      <td>
                                        <div class="badge badge-opacity-warning">In progress</div>

                                      </td>

                                    </tr>
                                  </c:forEach>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 d-flex flex-column">
                  <div class="row flex-grow">
                    <div class="col-12 grid-margin stretch-card">
                      <div class="card card-rounded">
                        <div class="card-body">
                          <div class="row">
                            <div class="col-lg-12">
                              <div class="d-flex justify-content-between align-items-center">
                                <h4 class="card-title card-title-dash">Todo list</h4>
                                <div class="add-items d-flex mb-0">
                                  <button class="add btn btn-icons btn-rounded btn-primary todo-list-add-btn text-white me-0 pl-12p">
                                    <i class="mdi mdi-plus"></i></button>
                                </div>
                              </div>
                              <div class="list-wrapper">
                                <ul class="todo-list todo-list-rounded">
                                  <li class="d-block">
                                    <div class="form-check w-100">
                                      <label class="form-check-label">
                                        <input class="checkbox"
                                               type="checkbox"> Lorem
                                        Ipsum is simply dummy text of
                                        the printing <i
                                              class="input-helper rounded"></i>
                                      </label>
                                      <div class="d-flex mt-2">
                                        <div class="ps-4 text-small me-3">
                                          24 June 2020
                                        </div>
                                        <div class="badge badge-opacity-warning me-3">
                                          Due tomorrow
                                        </div>
                                        <i class="mdi mdi-flag ms-2 flag-color"></i>
                                      </div>
                                    </div>
                                  </li>
                                  <li class="d-block">
                                    <div class="form-check w-100">
                                      <label class="form-check-label">
                                        <input class="checkbox"
                                               type="checkbox"> Lorem
                                        Ipsum is simply dummy text of
                                        the printing <i
                                              class="input-helper rounded"></i>
                                      </label>
                                      <div class="d-flex mt-2">
                                        <div class="ps-4 text-small me-3">
                                          23 June 2020
                                        </div>
                                        <div class="badge badge-opacity-success me-3">
                                          Done
                                        </div>
                                      </div>
                                    </div>
                                  </li>
                                  <li>
                                    <div class="form-check w-100">
                                      <label class="form-check-label">
                                        <input class="checkbox"
                                               type="checkbox"> Lorem
                                        Ipsum is simply dummy text of
                                        the printing <i
                                              class="input-helper rounded"></i>
                                      </label>
                                      <div class="d-flex mt-2">
                                        <div class="ps-4 text-small me-3">
                                          24 June 2020
                                        </div>
                                        <div class="badge badge-opacity-success me-3">
                                          Done
                                        </div>
                                      </div>
                                    </div>
                                  </li>
                                  <li class="border-bottom-0">
                                    <div class="form-check w-100">
                                      <label class="form-check-label">
                                        <input class="checkbox"
                                               type="checkbox"> Lorem
                                        Ipsum is simply dummy text of
                                        the printing <i
                                              class="input-helper rounded"></i>
                                      </label>
                                      <div class="d-flex mt-2">
                                        <div class="ps-4 text-small me-3">
                                          24 June 2020
                                        </div>
                                        <div class="badge badge-opacity-danger me-3">
                                          Expired
                                        </div>
                                      </div>
                                    </div>
                                  </li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row flex-grow">
                    <div class="col-12 grid-margin stretch-card">
                      <div class="card card-rounded">
                        <div class="card-body">
                          <div class="row">
                            <div class="col-lg-12">
                              <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="card-title card-title-dash">Type By
                                  Amount</h4>
                              </div>
                              <div>
                                <canvas class="my-auto"
                                        id="doughnutChart"></canvas>
                              </div>
                              <div id="doughnutChart-legend"
                                   class="mt-5 text-center"></div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row flex-grow">
                    <div class="col-12 grid-margin stretch-card">
                      <div class="card card-rounded">
                        <div class="card-body">
                          <div class="row">
                            <div class="col-lg-12">
                              <div class="d-flex justify-content-between align-items-center mb-3">
                                <div>
                                  <h4 class="card-title card-title-dash">Leave
                                    Report</h4>
                                </div>
                                <div>
                                  <div class="dropdown">
                                    <button class="btn btn-light dropdown-toggle toggle-dark btn-lg mb-0 me-0"
                                            type="button"
                                            id="dropdownMenuButton3"
                                            data-bs-toggle="dropdown"
                                            aria-haspopup="true"
                                            aria-expanded="false"> Month
                                      Wise
                                    </button>
                                    <div class="dropdown-menu"
                                         aria-labelledby="dropdownMenuButton3">
                                      <h6 class="dropdown-header">week
                                        Wise</h6>
                                      <a class="dropdown-item" href="#">Year
                                        Wise</a>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="mt-3">
                                <canvas id="leaveReport"></canvas>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row flex-grow">
                    <div class="col-12 grid-margin stretch-card">
                      <div class="card card-rounded">
                        <div class="card-body">
                          <h4 class="card-title card-title-dash">오늘 출석한 트레이너들</h4>
                          <div class="mt-3">
                            <c:forEach var="trainer" items="${trainers}">
                              <div class="wrapper d-flex align-items-center justify-content-between py-2 border-bottom">
                                <div class="d-flex">
                                  <div class="wrapper ms-3">
                                    <p class="ms-1 mb-1 fw-bold">${trainer.trainer_Name}</p>
                                    <small class="text-muted mb-0">트레이너 ID: ${trainer.trainer_Id}</small>
                                  </div>
                                </div>
                                <div class="text-muted text-small">${trainer.tcheck_Start}</div>
                              </div>
                            </c:forEach>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
  <!-- content-wrapper ends -->
