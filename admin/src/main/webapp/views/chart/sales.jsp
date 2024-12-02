<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>매출 통계</title>
    <!-- Bootstrap CSS 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.0.1"></script>
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <!-- 월별 매출 통계 -->
        <div class="col-md-6">
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
        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-success text-white">
                    성별 매출 통계
                </div>
                <div class="card-body">
                    <canvas id="genderSalesChart" width="400" height="400"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
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
</body>
</html>
