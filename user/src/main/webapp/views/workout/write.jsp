<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>운동 기록 작성</title>
    <script type="text/javascript">
        // 숫자만 입력받는 필드에 대한 검증
        function validateNumberInput(event) {
            var key = event.key;
            var regex = /^[0-9]+$/; // 숫자만 허용

            if (!regex.test(key) && key !== 'Backspace' && key !== 'Tab' && key !== 'ArrowLeft' && key !== 'ArrowRight') {
                event.preventDefault(); // 입력을 막음
            }
        }

        // 숫자와 문자 입력을 허용하는 필드에 대한 검증
        function validateTextOrNumberInput(event) {
            var key = event.key;
            var regex = /^[a-zA-Z0-9가-힣\s]*$/; // 숫자와 문자, 한글 및 공백만 허용

            if (!regex.test(key) && key !== 'Backspace' && key !== 'Tab' && key !== 'ArrowLeft' && key !== 'ArrowRight') {
                event.preventDefault(); // 입력을 막음
            }
        }

        // 입력값이 모두 채워졌는지 확인하는 함수
        function validateForm() {
            var workoutNo = document.getElementById("workoutNo").value;
            var custId = document.getElementById("custId").value;
            var workoutDate = document.getElementById("workoutDate").value;
            var workoutTime = document.getElementById("workoutTime").value;
            var workoutCalories = document.getElementById("workoutCalories").value;

            // 하나라도 비어있는 필드가 있으면 저장할 수 없게 합니다.
            if (workoutNo === "" || custId === "" || workoutDate === "" || workoutTime === "" || workoutCalories === "") {
                alert("모든 필드를 채워주세요.");
                return false;
            }

            // 알림창을 띄우고 "저장" 버튼을 클릭하면 폼을 제출하도록 합니다.
            var result = confirm("저장하시겠습니까?");
            if (result) {
                // "저장"을 클릭하면 폼을 제출합니다.
                document.getElementById("workoutForm").submit();
            }
            // "거절"을 클릭하면 아무 동작도 하지 않음
            return false;
        }

        // 입력 필드가 변경될 때마다 "저장" 버튼을 활성화하거나 비활성화하는 함수
        function toggleSaveButton() {
            var workoutNo = document.getElementById("workoutNo").value;
            var custId = document.getElementById("custId").value;
            var workoutDate = document.getElementById("workoutDate").value;
            var workoutTime = document.getElementById("workoutTime").value;
            var workoutCalories = document.getElementById("workoutCalories").value;

            // 모든 필드가 채워지면 저장 버튼 활성화, 그렇지 않으면 비활성화
            var saveButton = document.getElementById("saveButton");
            if (workoutNo && custId && workoutDate && workoutTime && workoutCalories) {
                saveButton.disabled = false;
            } else {
                saveButton.disabled = true;
            }
        }
    </script>
</head>
<body>
<h2>운동 기록 작성</h2>

<!-- 운동 기록 폼 -->
<form id="workoutForm" action="saveWorkoutLog" method="post">
    <table>
        <tr>
            <td><label for="workoutNo">운동 번호:</label></td>
            <td><input type="text" id="workoutNo" name="workoutNo" value="" onkeyup="toggleSaveButton()" onkeypress="validateNumberInput(event)" required /></td>
        </tr>
        <tr>
            <td><label for="custId">고객 ID:</label></td>
            <td><input type="text" id="custId" name="custId" value="" onkeyup="toggleSaveButton()" onkeypress="validateTextOrNumberInput(event)" required /></td>
        </tr>
        <tr>
            <td><label for="workoutDate">운동 날짜:</label></td>
            <td><input type="date" id="workoutDate" name="workoutDate" value="" onkeyup="toggleSaveButton()" required /></td>
        </tr>
        <tr>
            <td><label for="workoutTime">운동 시간 (분):</label></td>
            <td><input type="number" id="workoutTime" name="workoutTime" value="" onkeyup="toggleSaveButton()" onkeypress="validateNumberInput(event)" required /></td>
        </tr>
        <tr>
            <td><label for="workoutCalories">소모된 칼로리:</label></td>
            <td><input type="number" id="workoutCalories" name="workoutCalories" value="" onkeyup="toggleSaveButton()" onkeypress="validateNumberInput(event)" required /></td>
        </tr>
        <tr>
            <td><label for="workoutComments">운동 코멘트:</label></td>
            <td><textarea id="workoutComments" name="workoutComments" rows="4" cols="50" onkeyup="toggleSaveButton()" onkeypress="validateTextOrNumberInput(event)"></textarea></td>
        </tr>
    </table>

    <br />
    <!-- 저장 버튼 클릭 시 validateForm() 함수 호출 -->
    <input type="button" id="saveButton" value="운동 기록 저장" onclick="return validateForm()" disabled />
    <br /><br />

    <!-- 돌아가기 버튼: 이전 페이지로 이동 -->
    <a href="javascript:history.back()">돌아가기</a>
</form>
</body>
</html>
<%--(번호, machine_name, ) <----- 형태  --%>
<%--배열 안에 있는 값을 랜덤으로 불러오는 형식을 형태에 적용 하는 코드--%>
<%--운동 번호, 고객 id, 운동 날짜는 sql 통해서 진행--%>
<%--나머지 3개만 랜덤값 받아서 사용되게끔 --%>

