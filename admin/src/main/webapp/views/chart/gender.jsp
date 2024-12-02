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
<body>
<div class="container mt-5">
    <div class="row">

        <!-- 피트니스 방문자 차트 카드 -->
        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-header">
                    <h5 class="card-title mb-0 text-center">피트니스 방문자 수</h5>
                </div>
                <div class="card-body text-center">
                    <canvas id="performanceLine" width="400" height="180"></canvas>
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
                    <canvas id="genderChart" width="400" height="400"></canvas>
                </div>
            </div>
        </div>


    </div>
</div>


<script>
    // ======= 성별 통계 차트 =======
    const genderCounts = JSON.parse('${genderCounts}');
    const genderLabels = Object.keys(genderCounts);  // ["남성", "여성"]
    const genderData = Object.values(genderCounts); // [남성 수, 여성 수]

    const genderCtx = document.getElementById('genderChart').getContext('2d');
    new Chart(genderCtx, {
        type: 'doughnut',
        data: {
            labels: genderLabels,
            datasets: [{
                label: '성별 인원 수',
                data: genderData,
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

            const visitorCtx = document.getElementById('performanceLine').getContext('2d');

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


</script>
</body>
</html>

