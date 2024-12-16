<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <style>
        /* 전체 배경과 텍스트 색상 설정 */
        body {
            background-color: #000000;
            color: #ffffff;
            font-family: Arial, sans-serif;
        }

        /* 카드 스타일 */
        .card {
            background-color: #1a1a1a;
            border: 2px solid transparent;
            color: #ffffff;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .card-header {
            background-color: #333333;
            color: #ae00c7;
        }

        .card-title, .card-body h5 {
            color: #ae00c7;
        }

        /* 차트 및 검색창 배치 */
        .row {
            margin-top: 20px;
        }

        /* 차트 영역 */
        .chart-container {
            background-color: #1a1a1a;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        /* 차트 캔버스 */
        #performanceLine4 {
            width: 100% !important;
            height: 280px !important; /* 차트의 높이를 조금 더 크게 설정 */
        }

        /* 검색폼 스타일 */
        .search-form {
            background-color: #333333;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        /* 검색창 내 텍스트 필드 스타일 */
        .form-control {
            background-color: #444444;
            border: 1px solid #444444;
            color: #ffffff;
            margin-bottom: 10px;
        }

        .form-control:focus {
            background-color: #555555;
            border-color: #ae00c7;
        }

        /* 버튼 스타일 */
        .btn-primary {
            background-color: #ae00c7;
            border-color: #ae00c7;
        }

        .btn-primary:hover {
            background-color: #85009e;
            border-color: #85009e;
        }

        /* 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            color: #ffffff; /* 테이블 내용은 흰색으로 */
        }

        th {
            background-color: #333333;
            color: #ae00c7;
        }

        tr:nth-child(even) {
            background-color: #222222;
        }

        tr:hover {
            background-color: #444444;
        }

        /* 테이블 내 검색 및 필터링 입력 스타일 */
        .form-group {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container-fluid" style="width: 70%">

    <!-- 차트와 검색창을 가로로 배치 -->
    <div class="row">
        <!-- 차트 영역 -->
        <div class="col-md-8">
            <div class="chart-container">
                <h5 class="card-title mb-0 text-center">일별 방문자 수</h5>
                <canvas id="performanceLine4" style="background-color: #1a1a1a"></canvas>
            </div>
        </div>

        <!-- 검색폼 영역 -->
        <div class="col-md-4">
            <div class="search-form">
                <h5 class="card-title mb-0 text-center">검색</h5>
                <form action="/custcheckimpl" method="get">
                    <div class="form-group">
                        <label for="keyword">검색 옵션</label>
                        <select class="form-control" name="keyword" id="keyword">
                            <option value="id" <c:if test="${search.keyword == 'id'}"> selected </c:if>>회원ID</option>
                            <option value="month" <c:if test="${search.keyword == 'month'}"> selected </c:if>>월</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="search">검색어</label>
                        <input type="text" class="form-control" name="search"
                               <c:if test="${search.search != null}">value="${search.search}"</c:if> id="search">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">검색</button>
                </form>
            </div>
        </div>
    </div>

    <!-- 출결 정보 테이블 -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">출결 정보</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>회원 ID</th>
                        <th>출입시간</th>
                        <th>퇴실시간</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="c" items="${custcheckpage.getList()}">
                        <tr>
                            <td>${c.checkNo}</td>
                            <td>${c.custId}</td>
                            <td>${c.checkStart}</td>
                            <td>${c.checkEnd}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        const custId = '<c:out value="${sessionScope.loginid.custId}"/>'; // 현재 로그인된 사용자 ID

        $.ajax({
            url: '/monthlyAttendance',
            type: 'GET',
            data: { custId: custId },
            success: function(data) {
                const labels = data.map(item => item.month); // X축: 월
                const counts = data.map(item => item.attendance_count); // Y축: 출석수

                const ctx = document.getElementById('performanceLine4').getContext('2d');

                // 그래프의 색상 그라데이션 추가
                const gradient = ctx.createLinearGradient(0, 0, 0, 400);
                gradient.addColorStop(0, 'rgba(75, 192, 192, 0.8)');
                gradient.addColorStop(1, 'rgba(153, 102, 255, 0.3)');

                new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: '월별 출석 수',
                            data: counts,
                            fill: true,
                            backgroundColor: gradient,
                            borderColor: 'rgba(75, 192, 192, 1)',
                            pointBackgroundColor: 'rgba(255, 99, 132, 1)',
                            pointBorderColor: '#fff',
                            pointHoverBackgroundColor: '#fff',
                            pointHoverBorderColor: 'rgba(255, 99, 132, 1)',
                            tension: 0.4 // 곡선 스타일
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                position: 'top',
                                labels: {
                                    font: {
                                        size: 14,
                                        family: "'Poppins', sans-serif"
                                    },
                                    color: '#333'
                                }
                            },
                            tooltip: {
                                enabled: true,
                                callbacks: {
                                    label: function(context) {
                                        return `${context.raw}회 출석`;
                                    }
                                },
                                backgroundColor: 'rgba(0,0,0,0.8)',
                                titleColor: '#fff',
                                bodyColor: '#fff'
                            }
                        },
                        scales: {
                            x: {
                                grid: {
                                    color: 'rgba(200, 200, 200, 0.3)'
                                },
                                ticks: {
                                    font: {
                                        size: 12
                                    }
                                }
                            },
                            y: {
                                beginAtZero: true,
                                grid: {
                                    color: 'rgba(200, 200, 200, 0.3)'
                                },
                                ticks: {
                                    font: {
                                        size: 12
                                    }
                                }
                            }
                        }
                    }
                });
            },
            error: function(err) {
                console.error('Error fetching monthly attendance data:', err);
            }
        });
    });
</script>
</body>
</html>
