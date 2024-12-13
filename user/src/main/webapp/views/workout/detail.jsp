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

            //수정버튼 클릭시,
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

<div class="col-sm-10">
    <h2>운동상세 Page</h2>

    <!-- 버튼들 -->
    <div class="mb-3">
        <button id="btn_add" type="button" class="btn btn-success">새로운 항목 추가</button>
        <button id="btn_edit" type="button" class="btn btn-warning">수정하기</button>
        <button id="btn_delete" type="button" class="btn btn-danger">삭제하기</button>

    </div>

    <!-- 운동 세부 정보 테이블 -->
    <form id="deleteForm" method="post">
        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th><input type="checkbox" id="selectAll"></th>
                <th>운동 세부 번호</th>
                <th>운동 일지 번호</th>
                <th>운동기구 번호</th>
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
                    <td>${c.machineNo}</td>
                    <td>${c.wdetailExname}</td>
                    <td>${c.wdetailSets}</td>
                    <td>${c.wdetailCount}</td>
                    <td>${c.wdetailWeight}</td>
                    <td>${c.wdetailCalories}</td>
                    <td>${c.wdetailTime}</td>
                    <td>${c.workoutComments}</td>
                    <td>${c.workoutDate}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </form>

    <!-- 새 운동 세부 정보 추가 폼 -->
    <div id="newWorkoutDetail" style="display:none; margin-top: 20px;">
        <form id="addWorkoutDetailForm" action="<c:url value='/workout/addWorkoutDetail'/>" method="post">
            <input type="hidden" name="workoutNo" value="${workoutNo}" />

            <div class="form-group">
                <label for="wdetailExname">운동 이름</label>
                <input type="text" class="form-control" id="wdetailExname" name="wdetailExname" />
            </div>
            <div class="form-group">
                <label for="wdetailSets">세트 수</label>
                <input type="number" class="form-control" id="wdetailSets" name="wdetailSets" />
            </div>
            <div class="form-group">
                <label for="wdetailCount">총 개수</label>
                <input type="number" class="form-control" id="wdetailCount" name="wdetailCount" />
            </div>
            <div class="form-group">
                <label for="wdetailWeight">총 무게</label>
                <input type="number" class="form-control" id="wdetailWeight" name="wdetailWeight" />
            </div>
            <div class="form-group">
                <label for="wdetailCalories">소모 칼로리</label>
                <input type="number" class="form-control" id="wdetailCalories" name="wdetailCalories" />
            </div>
            <div class="form-group">
                <label for="wdetailTime">운동 시간</label>
                <input type="number" class="form-control" id="wdetailTime" name="wdetailTime" />
            </div>
            <div class="form-group">
                <label for="workoutComments">운동 코멘트</label>
                <input type="text" class="form-control" id="workoutComments" name="workoutComments" placeholder="운동에 대한 코멘트를 작성하세요"/>
            </div>
            <div class="form-group">
                <label for="workoutDate">운동 날짜</label>
                <input type="date" id="workoutDate" name="workoutDate" class="form-control" required />
            </div>

            <button type="submit" class="btn btn-primary">항목 추가</button>
        </form>
    </div>
</div>
