<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>운동 기록 작성</title>
    <script>
        // 운동 시간 랜덤 생성 함수 (5분 단위로 5분부터 120분까지)
        function getRandomWorkoutTime() {
            const minTime = 5;
            const maxTime = 120;
            const time = Math.floor(Math.random() * (maxTime / 5)) * 5 + 5;
            return time;
        }

        // 소모된 칼로리 랜덤 값 생성 함수 (예시: 5개의 값 중 랜덤 선택)
        function getRandomCalories() {
            const caloriesExamples = [150, 250, 300, 400, 500];
            const randomIndex = Math.floor(Math.random() * caloriesExamples.length);
            return caloriesExamples[randomIndex];
        }

        // 운동 코멘트 랜덤 선택 함수 (5개 예시 중 랜덤 선택)
        function getRandomComment() {
            const commentsExamples = [
                "오늘은 정말 힘든 운동이었어요!",
                "상체 운동이 너무 좋았어요.",
                "운동 후 기분이 상쾌해요.",
                "목표 칼로리를 초과했어요!",
                "운동을 계속 해야겠어요, 건강을 위해!"
            ];
            const randomIndex = Math.floor(Math.random() * commentsExamples.length);
            return commentsExamples[randomIndex];
        }

        // 랜덤 값 설정 함수
        function setRandomValues() {
            document.getElementById('workoutTime').value = getRandomWorkoutTime();
            document.getElementById('workoutCalories').value = getRandomCalories();
            document.getElementById('workoutComments').value = getRandomComment();
        }

        // 페이지 로딩 시 랜덤 값 채우기
        window.onload = function () {
            // 운동 날짜 필드에 오늘 날짜 자동 설정
            const currentDate = new Date().toISOString().split('T')[0];
            document.getElementById("workoutDate").value = currentDate;
            document.getElementById("workoutDate").setAttribute("min", currentDate);

            // 랜덤 값 설정
            setRandomValues();
        };

        // 폼을 제출하는 함수
        function submitForm() {
            const form = document.getElementById('workoutForm'); // form 요소를 정확히 선택
            if (form) {
                form.submit(); // 폼을 제출
            } else {
                console.error('폼을 찾을 수 없습니다.');
            }
        }

        // 폼 검증 후 제출 함수
        function validateForm() {
            // 알림창을 띄우고 "저장" 버튼을 클릭하면 폼을 제출하도록 합니다.
            var result = confirm("저장하시겠습니까?");
            if (result) {
                // "저장" 클릭 시 폼을 제출합니다.
                submitForm();

                // 폼 제출 후 알림을 띄운 후 이전 페이지로 돌아갑니다.
                alert("저장되었습니다!");
                history.back();  // 이전 페이지로 돌아가기
            } else {
                // "취소" 클릭 시 취소 알림을 띄우고, 페이지 새로고침
                alert("취소되었습니다!");
                return false;  // 폼 제출하지 않음
            }
        }
    </script>
</head>
<body>
<h2>운동 기록 작성</h2>

<!-- 운동 기록 폼 -->
<form id="workoutForm" action="<c:url value='/workout/save' />" method="post">
    <div class="form-group">
        <label for="exerciseName">운동 이름</label>
        <input type="text" id="exerciseName" name="exerciseName" value="" class="form-control" required placeholder="운동 이름을 입력하세요">
    </div>

    <div class="form-group">
        <label for="workoutDate">운동 날짜</label>
        <input type="date" id="workoutDate" name="workoutDate" class="form-control" required />
    </div>

    <div class="form-group">
        <label for="workoutTime">운동 시간 (분)</label>
        <input type="number" id="workoutTime" name="workoutTime" class="form-control" required />
    </div>

    <div class="form-group">
        <label for="workoutCalories">소모된 칼로리</label>
        <input type="number" id="workoutCalories" name="workoutCalories" class="form-control" required />
    </div>

    <div class="form-group">
        <label for="workoutComments">운동 코멘트</label>
        <textarea id="workoutComments" name="workoutComments" class="form-control" rows="4" placeholder="운동에 대한 코멘트를 작성하세요"></textarea>
    </div>

    <!-- machineName 필드 추가 -->
    <div class="form-group">
        <label for="machineName">운동 기기</label>
        <input type="text" id="machineName" name="machineName" class="form-control" required placeholder="운동 기기를 입력하세요" value="${randomExerciseName}">
    </div>

    <button type="submit" class="btn btn-primary">운동 기록 저장</button>
    <a href="<c:url value='/workout' />" class="btn btn-secondary" style="margin-left: 10px;">취소</a>
</form>
</body>
</html>
