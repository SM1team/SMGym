<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-11-06
  Time: 오전 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<section class="page-section" id="services">
  <div class="container">
    <div class="text-center">
      <h2 class="section-heading text-uppercase">우리의 서비스</h2>
      <h3 class="section-subheading text-muted">건강한 라이프스타일을 위한 최선의 선택입니다.</h3>
    </div>
    <div class="row text-center">
      <div class="col-md-4">
                <span class="fa-stack fa-4x">
                    <i class="fas fa-circle fa-stack-2x text-primary"></i>
                    <i class="fas fa-dumbbell fa-stack-1x fa-inverse"></i>
                </span>
        <h4 class="my-3">피트니스 프로그램</h4>
        <p class="text-muted">개개인의 목표에 맞춘 맞춤형 피트니스 프로그램을 제공합니다. 다양한 운동과 트레이닝을 경험해보세요.</p>
      </div>
      <div class="col-md-4">
                <span class="fa-stack fa-4x">
                    <i class="fas fa-circle fa-stack-2x text-primary"></i>
                    <i class="fas fa-apple-alt fa-stack-1x fa-inverse"></i>
                </span>
        <h4 class="my-3">영양 상담</h4>
        <p class="text-muted">전문 영양사가 제공하는 건강한 식단과 영양 상담으로 더욱 건강한 라이프스타일을 누리세요.</p>
      </div>
      <div class="col-md-4">
                <span class="fa-stack fa-4x">
                    <i class="fas fa-circle fa-stack-2x text-primary"></i>
                    <i class="fas fa-heartbeat fa-stack-1x fa-inverse"></i>
                </span>
        <h4 class="my-3">체력 평가</h4>
        <p class="text-muted">체력 평가를 통해 현재의 건강 상태를 파악하고, 향후 목표를 설정하는 데 도움을 드립니다.</p>
      </div>
    </div>
  </div>
</section>
<!-- Portfolio Grid-->
<section class="page-section bg-light" id="trainer">
  <div class="container">
    <div class="text-center">
      <h2 class="section-heading text-uppercase">Trainer Profile</h2>
      <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
    </div>
    <div class="row">
      <div class="col-lg-4 col-sm-6 mb-4">
        <!-- Portfolio item 1-->
        <div class="portfolio-item">
          <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
            </div>
            <img class="img-fluid" src="<c:url value="/assets/img/portfolio/1.jpg"/>" alt="..." />
          </a>
          <div class="portfolio-caption">
            <div class="portfolio-caption-heading">Threads</div>
            <div class="portfolio-caption-subheading text-muted">Illustration</div>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 mb-4">
        <!-- Portfolio item 2-->
        <div class="portfolio-item">
          <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal2">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
            </div>
            <img class="img-fluid" src="<c:url value="/assets/img/portfolio/2.jpg"/>" alt="..." />
          </a>
          <div class="portfolio-caption">
            <div class="portfolio-caption-heading">Explore</div>
            <div class="portfolio-caption-subheading text-muted">Graphic Design</div>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 mb-4">
        <!-- Portfolio item 3-->
        <div class="portfolio-item">
          <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal3">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
            </div>
            <img class="img-fluid" src="<c:url value="/assets/img/portfolio/3.jpg"/>" alt="..." />
          </a>
          <div class="portfolio-caption">
            <div class="portfolio-caption-heading">Finish</div>
            <div class="portfolio-caption-subheading text-muted">Identity</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- About-->
<!-- About-->
<section class="page-section" id="about">
  <div class="container">
    <div class="text-center">
      <h2 class="section-heading text-uppercase">About</h2>
      <h3 class="section-subheading text-muted">우리의 여정은 이렇게 시작되었습니다.</h3>
    </div>
    <ul class="timeline">
      <li>
        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value='/assets/img/about/1.jpg'/>" alt="..." /></div>
        <div class="timeline-panel">
          <div class="timeline-heading">
            <h4>2021-2024</h4>
            <h4 class="subheading">우리의 소박한 시작</h4>
          </div>
          <div class="timeline-body"><p class="text-muted">우리는 운동과 건강한 삶을 위한 공간을 만들기 위해 열정을 가지고 시작했습니다. 여러분이 꿈꾸는 몸매를 위해 함께하는 첫 걸음을 내딛었던 시기입니다.</p></div>
        </div>
      </li>
      <li class="timeline-inverted">
        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value='/assets/img/about/2.jpg'/>" alt="..." /></div>
        <div class="timeline-panel">
          <div class="timeline-heading">
            <h4>March 2021</h4>
            <h4 class="subheading">헬스장의 탄생</h4>
          </div>
          <div class="timeline-body"><p class="text-muted">여러분의 피트니스 목표를 실현할 수 있도록 헬스장을 개설했습니다. 다양한 운동 프로그램과 전문 트레이너가 여러분을 기다립니다!</p></div>
        </div>
      </li>
      <li>
        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value='/assets/img/about/3.jpg'/>" alt="..." /></div>
        <div class="timeline-panel">
          <div class="timeline-heading">
            <h4>December 2022</h4>
            <h4 class="subheading">종합 헬스 서비스로의 전환</h4>
          </div>
          <div class="timeline-body"><p class="text-muted">우리는 단순한 헬스장을 넘어 다양한 운동 프로그램과 맞춤형 트레이닝을 제공하는 종합 헬스 서비스로 발전했습니다. 여러분의 건강을 위한 더 나은 선택이 되겠습니다!</p></div>
        </div>
      </li>
      <li class="timeline-inverted">
        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value='/assets/img/about/4.jpg'/>" alt="..." /></div>
        <div class="timeline-panel">
          <div class="timeline-heading">
            <h4>July 2023</h4>
            <h4 class="subheading">Phase Two Expansion</h4>
          </div>
          <div class="timeline-body"><p class="text-muted">우리의 여정을 한 단계 더 나아가게 한 확장입니다. 더 많은 시설과 서비스를 통해 여러분의 운동 경험을 극대화하겠습니다.</p></div>
        </div>
      </li>
      <li class="timeline-inverted">
        <div class="timeline-image">
          <h4>
            새로운 지점 오픈!
            <br />
            저희는 충남 지역에
            <br />
            탕정점(1호점),
            <br />
            아산점(2호점),
            <br />
            천안점(3호점)을 새롭게 오픈했습니다!
            <br />
            이제 여러분의 편리한 위치에서 헬스를 즐기실 수 있습니다.
          </h4>
        </div>
      </li>
      <li class="timeline-inverted">
        <div class="timeline-image">
          <h4>
            여러분도
            <br />
            우리의 이야기에 함께 해주세요!
          </h4>
        </div>
      </li>
    </ul>
  </div>
</section>

<!-- Team-->
<section class="page-section bg-light" id="location">
  <div class="container">
    <div class="text-center">
      <h2 class="section-heading text-uppercase">최고의 트레이너팀</h2>
      <h3 class="section-subheading text-muted">당신의 건강과 목표 달성을 돕기 위해 함께합니다.</h3>
    </div>
    <div class="row">
      <div class="col-lg-4">
        <div class="team-member d-flex flex-column align-items-center text-center">
          <img class="mx-auto rounded-circle" src="<c:url value="/assets/img/team/1.jpg"/>" alt="..." />
          <h4>김철수</h4>
          <p class="text-muted">퍼스널 트레이너</p>
          <p class="text-muted">10년 이상의 경력을 가진 김철수 트레이너는 체력 강화와 기능성 피트니스에 특화된 전문가입니다. 개인 맞춤형 운동 프로그램을 통해 회원들이 자신감을 가지고 체력을 쌓을 수 있도록 돕습니다.</p>
          <div class="social-icons mt-auto"> <!-- 아이콘 고정 -->
            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="김철수 Twitter Profile"><i class="fab fa-twitter"></i></a>
            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="김철수 Facebook Profile"><i class="fab fa-facebook-f"></i></a>
            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="김철수 LinkedIn Profile"><i class="fab fa-linkedin-in"></i></a>
          </div>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="team-member d-flex flex-column align-items-center text-center">
          <img class="mx-auto rounded-circle" src="<c:url value="/assets/img/team/2.jpg"/>" alt="..." />
          <h4>이민정</h4>
          <p class="text-muted">영양 및 웰니스 코치</p>
          <p class="text-muted">이민정 코치는 영양과 웰니스에 대한 깊은 이해를 바탕으로 건강한 식습관 형성을 돕고, 회원들이 운동과 균형 잡힌 생활을 할 수 있도록 지도합니다.</p>
          <div class="social-icons mt-auto"> <!-- 아이콘 고정 -->
            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="이민정 Twitter Profile"><i class="fab fa-twitter"></i></a>
            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="이민정 Facebook Profile"><i class="fab fa-facebook-f"></i></a>
            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="이민정 LinkedIn Profile"><i class="fab fa-linkedin-in"></i></a>
          </div>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="team-member d-flex flex-column align-items-center text-center">
          <img class="mx-auto rounded-circle" src="<c:url value="/assets/img/team/3.jpg"/>" alt="..." />
          <h4>박지훈</h4>
          <p class="text-muted">그룹 피트니스 강사</p>
          <p class="text-muted">에너지가 넘치는 그룹 수업을 이끄는 박지훈 강사는 모든 회원들이 즐겁게 운동할 수 있도록 다양한 프로그램을 제공합니다. HIIT부터 요가까지 모든 수준에 맞는 수업을 통해 함께 운동하는 즐거움을 선사합니다.</p>
          <div class="social-icons mt-auto"> <!-- 아이콘 고정 -->
            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="박지훈 Twitter Profile"><i class="fab fa-twitter"></i></a>
            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="박지훈 Facebook Profile"><i class="fab fa-facebook-f"></i></a>
            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="박지훈 LinkedIn Profile"><i class="fab fa-linkedin-in"></i></a>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-8 mx-auto text-center">
        <p class="large text-muted">저희 트레이너들은 여러분의 건강 목표를 달성할 수 있도록 항상 최선을 다해 돕겠습니다. 체력 강화부터 웰니스까지 다양한 전문 지식을 갖춘 트레이너들이 여러분과 함께하겠습니다.</p>
      </div>
    </div>
  </div>
</section>

<!-- Clients-->
<div class="py-5">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-md-3 col-sm-6 my-3">
        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="<c:url value="/assets/img/logos/under.jpg"/>" alt="..." aria-label="under Logo" /></a>
      </div>
      <div class="col-md-3 col-sm-6 my-3">
        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="<c:url value="/assets/img/logos/nike.jpg"/>" alt="..." aria-label="nike Logo" /></a>
      </div>
      <div class="col-md-3 col-sm-6 my-3">
        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="<c:url value="/assets/img/logos/puma.jpg"/>" alt="..." aria-label="puma Logo" /></a>
      </div>
      <div class="col-md-3 col-sm-6 my-3">
        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="<c:url value="/assets/img/logos/dynafit.jpg"/>" alt="..." aria-label="dynafit Logo" /></a>
      </div>
    </div>
  </div>
</div>

<!-- Footer-->
<footer class="footer py-4">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-lg-4 text-lg-start">Copyright &copy; Your Website 2023</div>
      <div class="col-lg-4 my-3 my-lg-0">
        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
      </div>
      <div class="col-lg-4 text-lg-end">
        <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
        <a class="link-dark text-decoration-none" href="#!">Terms of Use</a>
      </div>
    </div>
  </div>
</footer>
<!-- Portfolio Modals-->
<!-- Portfolio item 1 modal popup-->
<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="close-modal" data-bs-dismiss="modal"><img src="<c:url value="/assets/img/close-icon.svg"/>" alt="Close modal" /></div>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="modal-body">
              <!-- Project details-->
              <h2 class="text-uppercase">Project Name</h2>
              <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
              <img class="img-fluid d-block mx-auto" src="<c:url value="/assets/img/portfolio/1.jpg"/>" alt="..." />
              <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
              <ul class="list-inline">
                <li>
                  <strong>Client:</strong>
                  Threads
                </li>
                <li>
                  <strong>Category:</strong>
                  Illustration
                </li>
              </ul>
              <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                <i class="fas fa-xmark me-1"></i>
                Close Project
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Portfolio item 2 modal popup-->
<div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="close-modal" data-bs-dismiss="modal"><img src="<c:url value="/assets/img/close-icon.svg"/>" alt="Close modal" /></div>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="modal-body">
              <!-- Project details-->
              <h2 class="text-uppercase">Project Name</h2>
              <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
              <img class="img-fluid d-block mx-auto" src="<c:url value="/assets/img/portfolio/2.jpg"/>" alt="..." />
              <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
              <ul class="list-inline">
                <li>
                  <strong>Client:</strong>
                  Explore
                </li>
                <li>
                  <strong>Category:</strong>
                  Graphic Design
                </li>
              </ul>
              <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                <i class="fas fa-xmark me-1"></i>
                Close Project
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Portfolio item 3 modal popup-->
<div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="close-modal" data-bs-dismiss="modal"><img src="<c:url value="/assets/img/close-icon.svg"/>" alt="Close modal" /></div>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="modal-body">
              <!-- Project details-->
              <h2 class="text-uppercase">Project Name</h2>
              <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
              <img class="img-fluid d-block mx-auto" src="<c:url value="/assets/img/portfolio/3.jpg"/>" alt="..." />
              <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
              <ul class="list-inline">
                <li>
                  <strong>Client:</strong>
                  Finish
                </li>
                <li>
                  <strong>Category:</strong>
                  Identity
                </li>
              </ul>
              <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                <i class="fas fa-xmark me-1"></i>
                Close Project
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Portfolio item 4 modal popup-->
<div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="close-modal" data-bs-dismiss="modal"><img src="<c:url value="/assets/img/close-icon.svg"/>" alt="Close modal" /></div>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="modal-body">
              <!-- Project details-->
              <h2 class="text-uppercase">Project Name</h2>
              <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
              <img class="img-fluid d-block mx-auto" src="<c:url value="/assets/img/portfolio/4.jpg"/>" alt="..." />
              <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
              <ul class="list-inline">
                <li>
                  <strong>Client:</strong>
                  Lines
                </li>
                <li>
                  <strong>Category:</strong>
                  Branding
                </li>
              </ul>
              <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                <i class="fas fa-xmark me-1"></i>
                Close Project
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Portfolio item 5 modal popup-->
<div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="close-modal" data-bs-dismiss="modal"><img src="<c:url value="/assets/img/close-icon.svg"/>" alt="Close modal" /></div>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="modal-body">
              <!-- Project details-->
              <h2 class="text-uppercase">Project Name</h2>
              <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
              <img class="img-fluid d-block mx-auto" src="<c:url value="/assets/img/portfolio/5.jpg"/>" alt="..." />
              <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
              <ul class="list-inline">
                <li>
                  <strong>Client:</strong>
                  Southwest
                </li>
                <li>
                  <strong>Category:</strong>
                  Website Design
                </li>
              </ul>
              <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                <i class="fas fa-xmark me-1"></i>
                Close Project
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Portfolio item 6 modal popup-->
<div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="close-modal" data-bs-dismiss="modal"><img src="<c:url value="/assets/img/close-icon.svg"/>" alt="Close modal" /></div>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="modal-body">
              <!-- Project details-->
              <h2 class="text-uppercase">Project Name</h2>
              <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
              <img class="img-fluid d-block mx-auto" src="<c:url value="/assets/img/portfolio/6.jpg"/>" alt="..." />
              <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
              <ul class="list-inline">
                <li>
                  <strong>Client:</strong>
                  Window
                </li>
                <li>
                  <strong>Category:</strong>
                  Photography
                </li>
              </ul>
              <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                <i class="fas fa-xmark me-1"></i>
                Close Project
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="<c:url value="/js/scripts.js"/>"></script>

<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
