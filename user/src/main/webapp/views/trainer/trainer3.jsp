<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Trainer Profile - Trainer 3</title>
  <link rel="stylesheet" href="<c:url value='/assets/css/styles.css' />">
</head>
<body>
<!-- Trainer 3 modal popup -->
<div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="close-modal" data-bs-dismiss="modal">
        <img src="<c:url value='/assets/img/close-icon.svg' />" alt="Close modal" />
      </div>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="modal-body d-flex">
              <!-- Trainer photo -->
              <div class="me-4">
                <img class="img-fluid rounded-circle" src="<c:url value='/assets/img/logos/teacher3.jpg' />" alt="Trainer Photo" style="width: 200px; height: 200px;" />
              </div>
              <!-- Trainer details -->
              <div>
                <h2 class="text-uppercase">심으뜸</h2>
                <p class="item-intro text-muted">요가 및 필라테스 전문가</p>
                <h5>특화 분야:</h5>
                <p>요가, 필라테스, 재활 치료</p>

                <h5>수상 내역:</h5>
                <ul>
                  <li>2019년 필라테스 챔피언십 준우승</li>
                  <li>2021년 요가 마스터 대회 우승</li>
                </ul>

                <h5>경력:</h5>
                <p>8년 이상 요가 및 재활 트레이닝 경력</p>

                <h5>리뷰:</h5>
                <div>
                  <span class="stars" style="color: gold;">★★★★★</span>
                  <span>(25)</span>
                  <button class="btn btn-link" data-bs-toggle="collapse" data-bs-target="#reviews3" aria-expanded="false" aria-controls="reviews3">
                    리뷰 보기
                  </button>
                  <div class="collapse" id="reviews3">
                    <!-- 리뷰 테이블 형식으로 변경 -->
                    <table class="table table-striped mt-3">
                      <thead>
                      <tr>
                        <th>회원 아이디</th>
                        <th>리뷰 내용</th>
                        <th>사진</th>
                      </tr>
                      </thead>
                      <tbody>
                      <tr>
                        <td>user789</td>
                        <td>재활에 큰 도움이 되었습니다!</td>
                        <td><img src="<c:url value='/assets/img/logos/teacher1.jpg' />" alt="user789" style="width: 50px; height: 50px;" /></td>
                      </tr>
                      <tr>
                        <td>user101</td>
                        <td>수업이 정말 좋았어요!</td>
                        <td><img src="<c:url value='/assets/img/logos/teacher1.jpg' />" alt="user101" style="width: 50px; height: 50px;" /></td>
                      </tr>
                      </tbody>
                    </table>
                  </div>
                </div>

                <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                  <i class="fas fa-xmark me-1"></i>
                  닫기
                </button>
                <button class="btn btn-success btn-xl text-uppercase ms-2" type="button">
                  <i class="fas fa-comments me-1"></i>
                  트레이너와 1:1 톡톡 문의하기
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
