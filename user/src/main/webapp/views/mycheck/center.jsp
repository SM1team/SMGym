<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
    #dataTable img {
        width: 100px !important;
    }
</style>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">내 출결</h1>

    <!-- Chart Example -->
    <div class="row">
        <div class="col-md-8">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h5 class="card-title mb-0 text-center">일별 방문자 수</h5>
                </div>
                <div class="card-body text-center">
                    <canvas id="performanceLine4" width="500" height="180"></canvas>
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

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">출결 정보</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <form action="/custcheckimpl" method="get">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-2">
                                <h3>Select list:</h3>
                            </div>
                            <div class="col-sm-3">
                                <select class="form-control" name="keyword">
                                    <option value="id" <c:if test="${search.keyword == 'id'}"> selected </c:if>>회원ID</option>
                                    <option value="month" <c:if test="${search.keyword == 'month'}"> selected </c:if>>월</option>
                                </select>
                            </div>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="search"
                                       <c:if test="${search.search != null}">value="${search.search}"</c:if>>
                            </div>
                            <div class="col-sm-3">
                                <button type="submit" class="btn btn-primary">Search</button>
                            </div>
                        </div>
                    </div>
                </form>

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
                <c:if test="${custcheckpage.getSize() != null}">
                    <jsp:include page="/views/custchecknav.jsp"/>
                </c:if>
            </div>
        </div>
    </div>
</div>