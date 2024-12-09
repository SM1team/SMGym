  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <script>
    // 페이지 로드 후 화면을 중간으로 이동
    window.onload = function() {
      // 페이지 높이의 50% 위치로 스크롤
      const middlePosition = document.body.scrollHeight / 2.7;
      window.scrollTo({
        top: middlePosition,
        behavior: "smooth" // 부드러운 스크롤 효과
      });
    };
  </script>
<style>
  /* 전체 페이지 스타일 */
  body {
    background-color: #000000;
    color: #ffffff;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    min-height: 100vh; /* 화면 높이를 채우도록 설정 */

  }


  /* 헤더 스타일 */
  header {
    background-color: #1a1a1a;
    text-align: center;
    padding: 20px 0;
  }

  /* 메인 컨텐츠 영역 */
  main {
    flex: 1; /* 메인 영역이 푸터 위의 남는 공간을 채움 */
    padding: 20px;
    margin-bottom: 50px; /* 푸터와 간격 확보 */
  }


  /* 카드 기본 스타일 */
  .card {
    background-color: #1a1a1a;
    border: 1px solid transparent; /* 기본 테두리를 투명하게 설정 */
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
    padding: 20px;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;

    /* 크기와 정렬 관련 수정 */
    width: 60%; /* 카드의 가로 길이: 화면의 50% */
    margin: 100px auto; /* 세로 여백 100px, 좌우 자동 정렬 */
  }

  .card:hover {
    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2); /* 그림자 강화 */
    border-color: #ae00c7; /* 카드 hover 시 테두리 색을 #ae00c7로 변경 */
  }

  /* 입력 필드 스타일 */
  .form-control {
    background-color: #000000;
    color: #ffffff;
    border: 1px solid #ffffff;
    border-radius: 5px;
    margin-bottom: 15px;
    padding: 10px;
  }

  .form-control:focus {
    border-color: #ae00c7;
    box-shadow: 0 0 8px #ae00c7;
    color: #ffffff; /* 텍스트 흰색 */
    background-color: #000000; /* 입력 필드 배경색 검정 */
  }


  /* 버튼 스타일 */
  .btn-primary {
    background-color: #ae00c7;
    border: none;
    padding: 12px 20px;
    border-radius: 5px;
    transition: background-color 0.3s ease;
  }

  .btn-primary:hover {
    background-color: #85009e;
  }

  .card-footer{
    background-color: #1a1a1a;

  }
  .footer-text a {
    color: #f1f1f1; /* 기본 색상: 흰색 */
    text-decoration: none; /* 밑줄 제거 */
    transition: color 0.3s ease; /* 색상 변화 애니메이션 */
    display: inline-block; /* 여백이 적용되도록 inline-block으로 변경 */
  }

  /* 링크 hover 효과 */
  .footer-text a:hover {
    color: #ae00c7; /* 커서 올릴 때 보라색 */
  }

</style>

  <div class="container register-container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card">
          <div class="card-body">
            <div class="card-header text-center" style="background-color: #1a1a1a; color: white; padding: 10px; border-radius: 5px;">
              <h3 style="font-weight: bold; margin: 0;">Sign Up</h3>
            </div>

            <form action="<c:url value='/registerimpl' />" method="post">
              <div class="form-group">
                <label for="cust_id">사용자 id</label>
                <input type="text" class="form-control" id="cust_id" name="custId" required maxlength="20">
              </div>
              <div class="form-group">
                <label for="cust_name">이름</label>
                <input type="text" class="form-control" id="cust_name" name="custName" required maxlength="10">
              </div>
              <div class="form-group">
                <label for="cust_pwd">비밀번호</label>
                <input type="password" class="form-control" id="cust_pwd" name="custPwd" required maxlength="30">
              </div>
              <div class="form-group">
                <label for="cust_age">나이</label>
                <input type="number" class="form-control" id="cust_age" name="custAge" required min="1">
              </div>
              <div class="form-group">
                <label for="cust_gender">성별</label>
                <select class="form-control" id="cust_gender" name="custGender" required>
                  <option value="1">남성</option>
                  <option value="2">여성</option>
                </select>
              </div>
              <div class="form-group">
                <label for="cust_phone">전화번호</label>
                <input type="text" class="form-control" id="cust_phone" name="custPhone" required maxlength="20">
              </div>
              <div class="form-group">
                <label for="cust_address">주소</label>
                <input type="text" class="form-control" id="cust_address" name="custAddress" required maxlength="20">
              </div>
              <button type="submit" class="btn btn-primary btn-block">회원가입</button>
              <div class="card-footer text-center">
                <small class="footer-text">이미 계정이 있으신가요? <a href="<c:url value='/login' />">여기에서 로그인하세요</a></small>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <style>

  </style>


  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
