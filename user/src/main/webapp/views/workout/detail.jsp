<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // 전체 선택 체크박스
        document.getElementById("selectAll").addEventListener("click", function () {
            const checkboxes = document.querySelectorAll("input[name='detailCheckbox']");
            checkboxes.forEach(function (checkbox) {
                checkbox.checked = this.checked;
            });
        });

        // 삭제 버튼 클릭 이벤트
        document.getElementById('btn_delete').addEventListener('click', function () {
            const selected = document.querySelectorAll('.detailCheckbox:checked');
            if (selected.length > 0) {
                const wdetailIds = Array.from(selected).map(checkbox => checkbox.value);
                if (confirm('선택한 항목을 삭제하시겠습니까?')) {
                    fetch('/workout/detail/delete', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({wdetailIds })
                    })
                        .then(response => {
                            if (response.ok) {
                                alert('삭제되었습니다.');
                                location.reload();
                            } else {
                                alert('삭제에 실패했습니다.');
                            }
                        });
                }
            } else {
                alert('삭제할 항목을 선택해주세요.');
            }
        });

        // 수정버튼 클릭시
        document.getElementById("btn_edit").addEventListener("click", function () {
            // 선택된 체크박스 가져오기
            const selectedCheckbox = document.querySelector('.detailCheckbox:checked');
            if (!selectedCheckbox) {
                alert("수정할 항목을 선택하세요!");
                return;
            }

            // 선택된 값 가져오기
            const selectedValue = selectedCheckbox.value;

            // 수정 페이지로 이동
            window.location.href = "/workout/editWorkoutDetail?wdetailId=" + selectedValue;
        });

        // 새로운 항목 추가 버튼 클릭 시
        document.getElementById("btn_add").addEventListener("click", function () {
            document.getElementById("newWorkoutDetail").style.display = "block"; // 추가 폼 표시
        });

        const currentDate = new Date().toISOString().split('T')[0];
        document.getElementById("workoutDate").value = currentDate;
        document.getElementById("workoutDate").setAttribute("min", currentDate);
    });

    // 선택된 운동 세부 항목들의 ID를 가져오는 함수
    function getSelectedDetails() {
        let selected = [];
        const checkboxes = document.querySelectorAll("input[name='detailCheckbox']:checked");
        checkboxes.forEach(function (checkbox) {
            selected.push(checkbox.value);
        });
        return selected;
    }
</script>

<style>
    body {
        background-color: #000000;
        color: #e0e0e0;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    h2 {
        color: #ae00c7;
        text-align: center;
        margin: 20px 0;
    }

    .container {
        margin-top: 20px;
        padding: 20px;
        color : #e0e0e0;
    }

    .btn {
        border-radius: 5px;
        padding: 10px 20px;
        transition: background-color 0.3s ease;
        border: 4px;
    }

    .btn-danger {
        background-color: #ae00c7;
        border: 4px #ae00c7;
    }

    .btn-danger:hover {
        background-color: #8a00a2;
        color: #ffffff;
    }

    .btn-success {
        background-color: #ae00c7;
        color: #f1f1f1;
        border: 4px #ae00c7;

    }

    .btn-success:hover {
        background-color: #8a00a2;
        color: #ffffff;
    }

    .btn-warning {
        background-color: #ae00c7;
        border: #ffc107;
    }

    .btn-warning:hover {
        background-color: #8a00a2;
        color: #ffffff;
    }

    .card {
        background-color: #000000;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        width: 80%;
        margin: 0 auto;
    }

    .form-control {
        background-color: #000000;
        color: #e0e0e0;
        border: 1px solid #ffffff;
        border-radius: 5px;
        margin-bottom: 15px;
        padding: 10px;
    }

    .form-control:focus {
        border-color: #ae00c7;
        box-shadow: 0 0 8px #ae00c7;
    }

    table {
        width: 100%;
        margin-top: 20px;
        color: #e0e0e0;
        border-collapse: collapse;
    }

    th, td {
        padding: 12px;
        text-align: center;
        border: 1px solid #ae00c7;
    }

    th {
        background-color: #333;
        font-weight: bold;
    }

    tbody tr:hover {
        background-color: #000000;
    }

    .card-footer {
        background-color: #000000;
        text-align: center;
        padding: 10px;
    }

    .footer-text a {
        color: #f1f1f1;
        text-decoration: none;
    }

    .footer-text a:hover {
        color: #ae00c7;
    }
</style>

<div class="container" style="width: 70%;">
    <h2>운동 상세 페이지</h2>

    <div class="mb-3 text-center">
        <button id="btn_add" class="btn btn-success">새로운 항목 추가</button>
        <button id="btn_edit" class="btn btn-warning">수정하기</button>
        <button id="btn_delete" class="btn btn-danger">삭제하기</button>
    </div>

    <form id="deleteForm" method="post">
        <table>
            <thead>
            <tr>
                <th><input type="checkbox" id="selectAll"></th>
                <th>운동 세부 번호</th>
                <th>운동 일지 번호</th>
                <th>운동 이름</th>
                <th>세트 수</th>
                <th>총 개수</th>
                <th>총 무게</th>
                <th>소모 칼로리</th>
                <th>운동 시간</th>
                <th>코멘트</th>
                <th>운동날짜</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="c" items="${details}">
                <tr>
                    <td><input type="checkbox" name="detailCheckbox" class="detailCheckbox" value="${c.wdetailId}"></td>
                    <td>${c.wdetailId}</td>
                    <td>${c.workoutNo}</td>
                    <td>${c.wdetailExname}</td>
                    <td>${c.wdetailSets}</td>
                    <td>${c.wdetailCount}</td>
                    <td>${c.wdetailWeight}</td>
                    <td>${c.wdetailCalories}</td>
                    <td>${c.wdetailTime}</td>
                    <td>${c.workoutComments}</td>
                    <td><fmt:formatDate value="${c.workoutDate}" pattern="yyyy-MM-dd" /></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </form>

    <!-- 새 운동 세부 정보 추가 폼 -->
    <div id="newWorkoutDetail" style="display:none;">
        <form id="addWorkoutDetailForm" action="<c:url value='/workout/addWorkoutDetail'/>" method="post">
            <input type="hidden" name="workoutNo" value="${workoutNo}" />

            <div class="form-group">
                <label for="wdetailExname">운동 이름</label>
                <input type="text" class="form-control" id="wdetailExname" name="wdetailExname" required />
            </div>
            <div class="form-group">
                <label for="wdetailSets">세트 수</label>
                <input type="number" class="form-control" id="wdetailSets" name="wdetailSets" required />
            </div>
            <div class="form-group">
                <label for="wdetailCount">총 개수</label>
                <input type="number" class="form-control" id="wdetailCount" name="wdetailCount" required />
            </div>
            <div class="form-group">
                <label for="wdetailWeight">총 무게</label>
                <input type="number" class="form-control" id="wdetailWeight" name="wdetailWeight" required />
            </div>
            <div class="form-group">
                <label for="wdetailCalories">소모 칼로리</label>
                <input type="number" class="form-control" id="wdetailCalories" name="wdetailCalories" required />
            </div>
            <div class="form-group">
                <label for="wdetailTime">운동 시간</label>
                <input type="number" class="form-control" id="wdetailTime" name="wdetailTime" required />
            </div>
            <div class="form-group">
                <label for="workoutComments">운동 코멘트</label>
                <input type="text" class="form-control" id="workoutComments" name="workoutComments" required />
            </div>
            <div class="form-group">
                <label for="workoutDate">운동 날짜</label>
                <input type="date" class="form-control" id="workoutDate" name="workoutDate" required />
            </div>

            <button type="submit" class="btn btn-primary">항목 추가</button>
        </form>
    </div>
</div>
