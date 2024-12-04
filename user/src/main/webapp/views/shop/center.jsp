<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <style>
    /* 전체 페이지 배경을 검정색으로 설정 */
    body {
      background-color: #000000; /* 검정색 배경 */
      color: #ffffff; /* 텍스트 색을 흰색으로 설정 */
      font-family: Arial, sans-serif; /* 글꼴 설정 */
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
      width: 350px; /* 가로 크기를 100%로 설정 */
      padding-top: 350px; /* padding-top을 사용하여 정사각형 비율 만들기 */
      position: relative; /* 내용 위치 설정 */
    }

    /* 카드 hover 효과 */
    .custom-card:hover {
      transform: translateY(-5px); /* 살짝 위로 이동 */
      box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2); /* 그림자 강화 */
      border-color: #ae00c7; /* 카드 hover 시 테두리 색을 #ae00c7로 변경 */
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
      font-size: 1.5rem; /* 약간 큰 텍스트 */;
      color: #ffffff; /* 텍스트 색상 흰색 */
      margin-bottom: 10px;
      transition: color 0.3s ease; /* 텍스트 색상 전환 효과 */
    }

    /* 가격 스타일 */
    .custom-card .text-center {
      font-size: 1.5rem; /* 약간 큰 텍스트 */
      color: #ffffff; /* 텍스트 색상 흰색 */
    }

    /* 카드 hover 시 텍스트 색상 변경 */
    .custom-card:hover h5,
    .custom-card:hover .text-center {
      color: #ae00c7; /* 마우스 hover 시 텍스트 색상이 #ae00c7로 변경 */
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
  </style>



</head>
<body>

<div class="container">
  <!-- 상단 검정 배경의 여백 -->
  <div class="row" style="background-color: #000; height: 400px;"></div> <!-- 상단 여백 -->

  <div id="center" >
  <div class="row">
    <!-- 상품 목록 반복 -->
    <c:forEach var="product" items="${productlist}">
      <div class="col-md-3 mb-4">
        <!-- 카드 전체를 링크로 감쌈 -->
        <a href="<c:url value='/shop/detail'/>?productNo=${product.productNo}" class="card custom-card h-100">
          <!-- Product details-->
          <div class="card-body p-4">
            <div class="text-center">
              <!-- Product name-->
              <h5 class="fw-bolder">${product.productName}</h5>
              <!-- Product price-->
              ₩<fmt:formatNumber value="${product.productPrice}" type="number" groupingUsed="true" />
            </div>
          </div>
          <!-- 카드 푸터 부분 삭제 (버튼 제거) -->
        </a>
      </div>
    </c:forEach>
  </div>

  <!-- 하단 검정 배경의 여백 -->
  <div class="row" style="background-color: #000; height: 400px;"></div> <!-- 하단 여백 -->
</div>


</body>

</html>
