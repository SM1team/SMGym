<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
  // 페이지 로드 후 화면을 중간으로 이동
  window.onload = function() {
    // 페이지 높이의 50% 위치로 스크롤
    const middlePosition = document.body.scrollHeight / 3;
    window.scrollTo({
      top: middlePosition,
      behavior: "smooth" // 부드러운 스크롤 효과
    });
  };
</script>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    /* 전체 페이지 배경을 검정색으로 설정 */
    body {
      background-color: #000000; /* 검정색 배경 */
      color: #ffffff; /* 텍스트 색을 흰색으로 설정 */
      font-family: Arial, sans-serif; /* 글꼴 설정 */
      margin: 0;
      padding: 0;
    }

    .container {
      padding: 20px;
    }

    /* 카드 전체 스타일 */
    .custom-card {
      text-decoration: none; /* 링크의 기본 밑줄 제거 */
      color: inherit; /* 부모 요소의 색상을 상속받도록 설정 */
      display: block; /* 링크를 블록 요소로 설정해 전체 카드 클릭 가능하도록 */
      border-radius: 10px; /* 모서리 둥글게 */
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
      background-color: #1a1a1a; /* 카드 배경을 페이지보다 밝은 검정색으로 설정 */
      transition: all 0.3s ease-in-out; /* 카드 hover 시 부드러운 전환 효과 */
      border: 2px solid transparent; /* 초기 테두리는 투명 */

      /* 카드 크기 설정 */
      width: 100%;/* 카드 너비 */
      height: 500px; /* 카드 높이를 늘려서 더 길게 설정 */
      position: relative; /* 내용 위치 설정 */
      margin-top: 50px; /* 카드 상단 여백 */
    }

    /* 카드 hover 효과 */
    .custom-card:hover {
      box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2); /* 그림자 강화 */
      border-color: #ae00c7; /* 카드 hover 시 테두리 색을 #ae00c7로 변경 */
    }
    .footer-text a {
      color: #f1f1f1; /* 링크 기본 색상 하얀색 */
      text-decoration: none; /* 링크 밑줄 제거 */
      transition: color 0.3s ease; /* 색상 변화 부드럽게 */
    }

    .footer-text a:hover {
      color: #ae00c7; /* hover 시 보라색으로 변경 */
    }


    /* 카드 내부 텍스트 */
    .custom-card .card-body {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      width: 100%;
      text-align: center;
    }

    /* 제품명 스타일 */
    .custom-card h5 {
      font-weight: bold;
      font-size: 1.5rem; /* 약간 큰 텍스트 */
      color: #ffffff; /* 텍스트 색상 흰색 */
      margin-bottom: 10px;
      transition: color 0.3s ease; /* 텍스트 색상 전환 효과 */
    }

    /* 가격 스타일 */
    .custom-card .text-center {
      font-size: 1.5rem; /* 약간 큰 텍스트 */
      color: #ffffff; /* 텍스트 색상 흰색 */
    }


    /* 카드 푸터 스타일 (필요시 추가) */
    .custom-card .card-footer {
      background-color: #1a1a1a; /* 카드 푸터 배경색 */
      border-top: 1px solid #333; /* 얇은 분리선 */
      padding: 15px; /* 충분한 여백 */
    }

    /* 링크의 밑줄 제거 */
    .custom-card a {
      text-decoration: none; /* 링크에 밑줄이 생기지 않도록 설정 */
    }

    /* 입력 필드 스타일 (길쭉한 크기 설정) */
    .form-control {
      width: 100%; /* 입력 필드 너비 100%로 설정 */
      padding: 10px 15px; /* 여백을 추가하여 필드가 더 길어보이게 함 */
      font-size: 1rem; /* 글자 크기 설정 */
      background-color: #000000; /* 입력 필드 배경색 검정 */
      color: #ffffff; /* 텍스트 흰색 */
      border-radius: 5px; /* 둥근 모서리 설정 */
      border: 2px solid #333; /* 테두리 색상 설정 */
      transition: border-color 0.3s ease, box-shadow 0.3s ease; /* 테두리 색상 변화와 그림자 효과 */
    }

    /* 입력 필드에 마우스 hover 시 테두리 색상 변화 */
    .form-control:focus {
      border-color: #ae00c7; /* 보라색 테두리 */
      box-shadow: 0 0 5px rgba(174, 0, 199, 0.5); /* 테두리 그림자 추가 */
      color: #ffffff; /* 텍스트 흰색 */
      background-color: #000000; /* 입력 필드 배경색 검정 */
    }

    /* 버튼 스타일 */
    .btn-block {
      width: 100%;
      padding: 10px;
      font-size: 1rem;
      background-color: #ae00c7; /* 보라색 버튼 */
      border: none;
      border-radius: 5px;
      color: #fff;
      transition: background-color 0.3s ease;
    }

    .btn-block:hover {
      background-color: #8a00a2; /* 버튼 hover 시 색상 변경 */
    }



  </style>
</head>
<body>

<div class="container login-container">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card custom-card">
        <div class="card-header text-center">
           <h3 style="font-weight: bold">Login</h3>
        </div>
        <div class="card-body">
          <form action="<c:url value='/loginimpl'/>" method="post">
            <div class="form-group">
              <label for="id">사용자 id</label>
              <input type="text" class="form-control" id="id" name="id" required>
            </div>
            <div class="form-group">
              <label for="pwd">비밀번호</label>
              <input type="password" class="form-control" id="pwd" name="pwd" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">로그인</button>
            <div class="card-footer text-center">
              <small class="footer-text">계정이 없으신가요? <a href="<c:url value='/register' />">여기에서 등록하세요</a></small>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
