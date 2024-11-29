<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>성별 통계 차트</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.0.1"></script>
</head>
<body>
<div class="col-sm-12">
    <h2>성별 통계</h2>
    <canvas id="genderChart" width="400" height="400" style="display: block; margin: 0 auto;"></canvas>
</div>

<script>
    const genderCounts = JSON.parse('${genderCounts}');
    console.log("genderCounts in JavaScript: ", genderCounts);  // JavaScript에서 확인

    const labels = Object.keys(genderCounts);  // ["남성", "여성"]
    const data = Object.values(genderCounts); // [남성 수, 여성 수]

    const ctx = document.getElementById('genderChart').getContext('2d');
    const genderChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: labels,
            datasets: [{
                label: '성별 인원 수',
                data: data,
                backgroundColor: [
                    'rgba(54, 162, 235, 0.6)', // 남성 색상
                    'rgba(255, 99, 132, 0.6)'  // 여성 색상
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
</script>


</body>
</html>
