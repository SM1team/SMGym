<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="your-styles.css"> <!-- 스타일 시트 추가 -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"> <!-- Font Awesome -->
</head>
<body>

<!-- Portfolio Grid-->
<section class="page-section bg-light" id="portfolio">
  <div class="container">
    <div class="text-center">
      <h2 class="section-heading text-uppercase">Portfolio</h2>
      <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
    </div>
    <div class="row">
      <div class="col-lg-4 col-sm-6 mb-4">
        <!-- Portfolio item 1-->
        <div class="portfolio-item">
          <a class="portfolio-link" data-bs-toggle="modal" href="/portfolioModal1">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
            </div>
            <img class="img-fluid" src="<c:url value='/assets/img/portfolio/1.jpg'/>" alt="..." />
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
          <a class="portfolio-link" data-bs-toggle="modal" href="/portfolioModal2">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
            </div>
            <img class="img-fluid" src="<c:url value='/assets/img/portfolio/2.jpg'/>" alt="..." />
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
          <a class="portfolio-link" data-bs-toggle="modal" href="/portfolioModal3">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
            </div>
            <img class="img-fluid" src="<c:url value='/assets/img/portfolio/3.jpg'/>" alt="..." />
          </a>
          <div class="portfolio-caption">
            <div class="portfolio-caption-heading">Finish</div>
            <div class="portfolio-caption-subheading text-muted">Identity</div>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
        <!-- Portfolio item 4-->
        <div class="portfolio-item">
          <a class="portfolio-link" data-bs-toggle="modal" href="/portfolioModal4">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
            </div>
            <img class="img-fluid" src="<c:url value='/assets/img/portfolio/4.jpg'/>" alt="..." />
          </a>
          <div class="portfolio-caption">
            <div class="portfolio-caption-heading">Lines</div>
            <div class="portfolio-caption-subheading text-muted">Branding</div>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
        <!-- Portfolio item 5-->
        <div class="portfolio-item">
          <a class="portfolio-link" data-bs-toggle="modal" href="/portfolioModal5">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
            </div>
            <img class="img-fluid" src="<c:url value='/assets/img/portfolio/5.jpg'/>" alt="..." />
          </a>
          <div class="portfolio-caption">
            <div class="portfolio-caption-heading">Southwest</div>
            <div class="portfolio-caption-subheading text-muted">Website Design</div>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6">
        <!-- Portfolio item 6-->
        <div class="portfolio-item">
          <a class="portfolio-link" data-bs-toggle="modal" href="/portfolioModal6">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
            </div>
            <img class="img-fluid" src="<c:url value='/assets/img/portfolio/6.jpg'/>" alt="..." />
          </a>
          <div class="portfolio-caption">
            <div class="portfolio-caption-heading">Window</div>
            <div class="portfolio-caption-subheading text-muted">Photography</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- jQuery 및 Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<script>
  $(document).ready(function() {
    // Smooth scrolling for internal links
    $('a.nav-link').on('click', function(event) {
      event.preventDefault(); // Prevent the default action

      // Get the target section ID from the link's href
      var target = $(this).attr('href');

      // Animate scrolling to the target section
      $('html, body').animate({
        scrollTop: $(target).offset().top
      }, 1000); // 1000 milliseconds for the animation duration
    });
  });
</script>
</body>
</html>
