<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Trainer Profile - Trainer 1</title>
    <link rel="stylesheet" href="<c:url value='/assets/css/styles.css' />">
</head>
<body>
<!-- Trainer 1 modal popup -->
<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true" style="background: #ae00c7">
    <div class="modal-dialog">
        <div class="modal-content" style="background: #f1f1f1">
            <div class="close-modal" data-bs-dismiss="modal">
                <img src="<c:url value='/assets/img/close-icon.svg'/>" alt="Close modal" />
            </div>
            <div class="container" style="background: #000000">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="modal-body d-flex">
                            <!-- Trainer photo -->
                            <div class="me-4">
                                <img class="img-fluid rounded-circle" src="<c:url value='/assets/img/logos/teacher1.jpg'/>" alt="Trainer Photo" style="width: 200px; height: 200px;" />
                            </div>
                            <!-- Trainer details -->
                            <div>
                                <h2 class="text-uppercase">지피티</h2>
                                <p class="item-intro text-muted">전문 PT 트레이너</p>
                                <h5>특화 분야:</h5>
                                <p>다이어트 및 웨이트 트레이닝의 전문가로, 체중 감량과 근육 증진을 목표로 합니다.</p>

                                <h5>자격증:</h5>
                                <ul>
                                    <li>다이어트 전문가 인증</li>
                                    <li>ACE(미국 스포츠 의학 협회) 인증 퍼스널 트레이너</li>
                                </ul>

                                <h5>경력:</h5>
                                <p>5년 이상의 경험으로 고객 맞춤형 프로그램을 제공합니다.</p>

                                <h5>수상 내역:</h5>
                                <ul>
                                    <li>2023년 대한민국 피트니스 대회 1위</li>
                                    <li>2022년 체중 감량 챌린지 2위</li>
                                </ul>

                                <h5>리뷰:</h5>
                                <div>
                                    <span class="stars" style="color: gold;">★★★★★</span>
                                    <span>(40)</span>
                                    <button class="btn btn-link" data-bs-toggle="collapse" data-bs-target="#reviews1" aria-expanded="false" aria-controls="reviews1">
                                        리뷰 보기
                                    </button>
                                    <div class="collapse" id="reviews1">
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
                                                <td>user123</td>
                                                <td>매우 만족합니다!</td>
                                                <td><img src="<c:url value='/assets/img/logos/teacher1.jpg' />" alt="user123" style="width: 50px; height: 50px;" /></td>
                                            </tr>
                                            <tr>
                                                <td>user456</td>
                                                <td>훈련 방식이 좋습니다.</td>
                                                <td><img src="<c:url value='/assets/img/logos/teacher1.jpg' />" alt="user456" style="width: 50px; height: 50px;" /></td>
                                            </tr>
                                            <tr>
                                                <td>user789</td>
                                                <td>목표 달성에 큰 도움이 되었습니다.</td>
                                                <td><img src="<c:url value='/assets/img/logos/teacher1.jpg' />" alt="user789" style="width: 50px; height: 50px;" /></td>
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
