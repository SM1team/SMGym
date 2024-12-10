<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>통계 차트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.0.1"></script>
</head>
<div>
<div class="container mt-5">
    <div class="row">
        <!-- 월별 매출 통계 -->
        <div class="col-md-4">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    월별 매출 통계
                </div>
                <div class="card-body">
                    <canvas id="monthlySalesChart" width="400" height="400"></canvas>
                </div>
            </div>
        </div>

        <!-- 성별 매출 통계 -->
        <div class="col-md-4">
            <div class="card">
                <div class="card-header bg-success text-white">
                    성별 매출 통계
                </div>
                <div class="card-body">
                    <canvas id="genderSalesChart" width="400" height="400"></canvas>
                </div>
            </div>
        </div>

        <!-- 나이대별 매출 통계 -->
        <div class="col-md-4">
            <div class="card">
                <div class="card-header bg-warning text-white">
                    나이대별 매출 통계
                </div>
                <div class="card-body">
                    <canvas id="oldSalesChart" width="400" height="400"></canvas>
                </div>
            </div>
        </div>

        <!-- 피트니스 방문자 차트 카드 -->
        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-header">
                    <h5 class="card-title mb-0 text-center">일별 방문자 수</h5>
                </div>
                <div class="card-body text-center">
                    <canvas id="performanceLine4" width="500" height="180"></canvas>
                </div>
            </div>
        </div>

        <!-- 성별 통계 차트 카드 -->
        <div class="col-md-4">
            <div class="card mb-4 shadow">
                <div class="card-header">
                    <h5 class="card-title mb-0 text-center">성별 통계</h5>
                </div>
                <div class="card-body text-center">
                    <canvas id="genderChart1" width="400" height="400"></canvas>
                </div>
            </div>
        </div>

        <!-- 차트 캔버스 -->
        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-header">
                    <h5 class="card-title mb-0 text-center">월별 방문자 수</h5>
                </div>
                <div class="card-body text-center">
                    <canvas id="performanceLine5" width="500" height="180"></canvas>
                </div>
            </div>
        </div>

        <div class="col-md-8">

            <div class="row flex-grow">
                <div class="col-12 grid-margin stretch-card">
                    <div class="card card-rounded">
                        <div class="card-body">
                            <div class="d-sm-flex justify-content-between align-items-start">
                                <div>
                                    <h4 class="card-title card-title-dash"> ${currentMonth}월 우수 트레이너
                                    </h4>

                                </div>

                            </div>
                            <div class="table-responsive  mt-1">
<%--                               우수 트레이너 테이블시작--%>
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
                                        <th>트레이너 ID</th>
                                        <th>담당 회원수</th>

                                    </tr>
                                    </thead>
<%--                                    여기서부터 내용--%>
                                    <tbody>
                                    <c:forEach var="member" items="${trainermember}">
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
                                                    <img src="<c:url value='/assets/images/cust2.jpg'/>" alt="">
                                                    <div>
                                                        <h6>${member.trainerName}</h6>
                                                        <p>${member.trainerId}</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <h6>${member.memberCount}</h6>
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




    </div>
</div>
</div>
<script>
    // ======= 성별 통계 차트 =======
    const genderCounts = JSON.parse('${genderCounts}');
    const genderLabels1 = Object.keys(genderCounts);  // ["남성", "여성"]
    const genderData1 = Object.values(genderCounts); // [남성 수, 여성 수]

    const genderCtx1 = document.getElementById('genderChart1').getContext('2d');
    new Chart(genderCtx1, {
        type: 'doughnut',
        data: {
            labels: genderLabels1,
            datasets: [{
                label: '성별 인원 수',
                data: genderData1,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.6)', // 남성 색상
                    'rgba(54, 162, 235, 0.6)'
                    // 여성 색상
                ],
                borderColor: [
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 99, 132, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
            }
        }
    });

    // ======= 피트니스 방문자 차트 =======

    // ======= 피트니스 방문자 차트 =======
    fetch('/chart/visitor')
        .then(response => response.json())
        .then(data => {
            // 데이터를 날짜 기준으로 내림차순 정렬 (최신 데이터가 먼저 오도록)
            data.sort((a, b) => new Date(b.visit_date) - new Date(a.visit_date));

            // 최신 7개의 데이터만 추출
            const recentData = data.slice(0, 7);

            // 요일만 뽑아서 배열로 저장
            const weekdays = ['일', '월', '화', '수', '목', '금', '토'];
            const visitorLabels = recentData.map(entry => {
                const date = new Date(entry.visit_date); // visit_date가 "YYYY-MM-DD" 형식이라고 가정
                const weekday = weekdays[date.getDay()]; // 요일 (0: 일요일, 1: 월요일, ..., 6: 토요일)
                return weekday; // 요일만 반환
            });

            // 방문자 수 데이터
            const visitorData = recentData.map(entry => entry.daily_visitors);

            const visitorCtx = document.getElementById('performanceLine4').getContext('2d');

            // 그라데이션 배경 설정
            const gradient = visitorCtx.createLinearGradient(0, 0, 0, 400);
            gradient.addColorStop(0, 'rgba(75, 192, 192, 0.4)');
            gradient.addColorStop(1, 'rgba(75, 192, 192, 0.1)');

            new Chart(visitorCtx, {
                type: 'line',
                data: {
                    labels: visitorLabels.reverse(), // X축에 요일만 표시, 최신 날짜부터 표시하기 위해 reverse()
                    datasets: [{
                        label: '일별 방문자 수',
                        data: visitorData.reverse(), // 최근 7개 데이터만 표시, 방문자 수도 최신 데이터부터
                        borderColor: 'rgba(75, 192, 192, 1)', // 선 색상
                        backgroundColor: gradient, // 그라데이션 배경
                        borderWidth: 3, // 선의 두께
                        pointBackgroundColor: 'rgba(75, 192, 192, 1)', // 포인트 색상
                        pointBorderColor: '#fff', // 포인트 경계선 색상
                        pointBorderWidth: 3, // 포인트 경계선 두께
                        pointRadius: 6, // 포인트 크기
                        pointHoverRadius: 8, // 포인트 마우스 오버시 크기
                        tension: 0.4 // 선의 부드러움
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top'
                        },
                        tooltip: {
                            backgroundColor: 'rgba(0, 0, 0, 0.7)', // 툴팁 배경 색상
                            titleColor: '#fff', // 툴팁 제목 색상
                            bodyColor: '#fff', // 툴팁 내용 색상
                            cornerRadius: 4, // 툴팁 모서리 둥글게
                            padding: 10, // 툴팁 안쪽 여백
                        }
                    },
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: '요일' // X축 제목을 '요일'로 설정
                            },
                            grid: {
                                display: false // X축 그리드선 숨기기
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: '방문자 수'
                            },
                            beginAtZero: true,
                            ticks: {
                                stepSize: 1, // Y축 눈금 간격을 1로 설정
                                color: 'rgba(0, 0, 0, 0.7)' // Y축 눈금 색상
                            },
                            grid: {
                                color: 'rgba(0, 0, 0, 0.1)' // Y축 그리드선 색상
                            }
                        }
                    }
                }
            });
        })
        .catch(error => console.error('Error fetching visitor data:', error));

    async function renderMonthlyVisitorChart() {
        try {
            const response = await fetch('/chart/monthly');
            const data = await response.json();

            // 현재 날짜 기준으로 최근 6개월을 계산
            const today = new Date();
            const lastSixMonths = [];

            for (let i = 0; i < 6; i++) {
                const month = new Date(today);
                month.setMonth(today.getMonth() - i);
                lastSixMonths.push(month.toISOString().slice(0, 7)); // 'YYYY-MM' 형식으로 저장
            }

            // 최근 6개월의 데이터만 필터링
            const filteredData = data.filter(item => lastSixMonths.includes(item.month));

            // 차트에 표시할 월과 방문자 수
            const labels = filteredData.map(item => item.month);
            const visitorCounts = filteredData.map(item => item.visitorCount);

            const ctx = document.getElementById('performanceLine5').getContext('2d');

            // 배경 그라데이션 추가
            const gradientBg = ctx.createLinearGradient(0, 0, 0, 400);
            gradientBg.addColorStop(0, 'rgba(75, 192, 192, 0.2)');
            gradientBg.addColorStop(1, 'rgba(75, 192, 192, 0.1)');

            // 막대 차트의 색상 설정
            const gradientBar = ctx.createLinearGradient(0, 0, 0, 400);
            gradientBar.addColorStop(0, 'rgba(75, 192, 192, 1)');
            gradientBar.addColorStop(1, 'rgba(75, 192, 192, 0.5)');

            new Chart(ctx, {
                type: 'bar', // 'line'에서 'bar'로 변경
                data: {
                    labels: labels,
                    datasets: [{
                        label: '월별 방문자 수',
                        data: visitorCounts,
                        backgroundColor: gradientBar, // 막대 색상
                        borderColor: 'rgba(75, 192, 192, 1)', // 막대의 테두리 색상
                        borderWidth: 2,
                        hoverBackgroundColor: 'rgba(75, 192, 192, 0.6)', // hover 시 막대 색상
                        hoverBorderColor: 'rgba(75, 192, 192, 1)', // hover 시 테두리 색상
                        hoverBorderWidth: 3
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top',
                            labels: {
                                font: {
                                    size: 14,
                                    family: 'Arial, sans-serif',
                                    weight: 'bold'
                                },
                                color: '#333'
                            }
                        },
                        tooltip: {
                            backgroundColor: 'rgba(0, 0, 0, 0.7)',
                            titleFont: {
                                size: 16
                            },
                            bodyFont: {
                                size: 14
                            },
                            callbacks: {
                                label: function(tooltipItem) {
                                    return `${tooltipItem.label}: ${tooltipItem.raw}명`;
                                }
                            },
                            animation: {
                                duration: 500, // 툴팁 애니메이션 시간
                                easing: 'easeOutCubic'
                            }
                        }
                    },
                    animation: {
                        duration: 1500, // 차트 애니메이션 시간
                        easing: 'easeOutBounce', // 탄력적인 애니메이션 효과
                        onComplete: function() {
                            console.log('차트 렌더링 완료!');
                        }
                    },
                    scales: {
                        x: {
                            grid: {
                                color: 'rgba(0, 0, 0, 0.1)', // x축 그리드 색상
                            },
                            ticks: {
                                font: {
                                    size: 12,
                                    family: 'Arial, sans-serif',
                                },
                                color: '#333'
                            }
                        },
                        y: {
                            grid: {
                                color: 'rgba(0, 0, 0, 0.1)', // y축 그리드 색상
                            },
                            ticks: {
                                font: {
                                    size: 12,
                                    family: 'Arial, sans-serif',
                                },
                                color: '#333',
                                beginAtZero: true
                            }
                        }
                    },
                    hover: {
                        mode: 'nearest',
                        intersect: true,
                        animationDuration: 400 // hover 시 포인트의 애니메이션 속도
                    }
                }
            });
        } catch (error) {
            console.error('Failed to render chart:', error);
        }
    }

    document.addEventListener('DOMContentLoaded', renderMonthlyVisitorChart);

    // 월별 매출 데이터
    const monthlySales = JSON.parse('${monthlySales}');
    const monthlyLabels = Object.keys(monthlySales); // ["1월", "2월", "3월", ...]
    const monthlyData = Object.values(monthlySales); // [매출1, 매출2, 매출3, ...]

    const monthlyCtx = document.getElementById('monthlySalesChart').getContext('2d');
    new Chart(monthlyCtx, {
        type: 'bar',
        data: {
            labels: monthlyLabels,
            datasets: [{
                label: '월별 매출',
                data: monthlyData,
                backgroundColor: 'rgba(54, 162, 235, 0.6)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: true,
                    position: 'top'
                }
            }
        }
    });

    // 나이대별 매출 데이터
    const oldSales = JSON.parse('${oldSales}');
    const oldLabels = Object.keys(oldSales); // ["20대", "30대", "40대", "50대", "60대 이상"]
    const oldData = Object.values(oldSales); // [20대 매출, 30대 매출, ...]

    const oldCtx = document.getElementById('oldSalesChart').getContext('2d');
    new Chart(oldCtx, {
        type: 'doughnut',
        data: {
            labels: oldLabels,
            datasets: [{
                label: '나이대별 매출',
                data: oldData,
                backgroundColor: ['#FF5733', '#FFC300', '#28A745', '#17A2B8', '#6F42C1']
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: true,
                    position: 'top'
                }
            }
        }
    });

    // 성별 매출 데이터
    const genderSales = JSON.parse('${genderSales}');
    const genderLabels = Object.keys(genderSales); // ["남성", "여성", "기타"]
    const genderData = Object.values(genderSales); // [남성 매출, 여성 매출, 기타 매출]

    const genderCtx = document.getElementById('genderSalesChart').getContext('2d');
    new Chart(genderCtx, {
        type: 'doughnut',
        data: {
            labels: genderLabels,
            datasets: [{
                label: '성별 매출',
                data: genderData,
                backgroundColor: ['#36A2EB', '#FF6384', '#FFCE56']
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: true,
                    position: 'top'
                }
            }
        }
    });






</script>
<script>





</script>



</body>
</html>

