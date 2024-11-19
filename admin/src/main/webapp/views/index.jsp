<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <%--    위에 페이지 이름 변경 공간   --%>
  <title>Health Center Admin Page </title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="assets/vendors/feather/feather.css">
  <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="assets/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="assets/vendors/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="assets/vendors/typicons/typicons.css">
  <link rel="stylesheet" href="assets/vendors/simple-line-icons/css/simple-line-icons.css">
  <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="assets/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" type="text/css" href="assets/js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="assets/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="assets/images/favicon.png"/>
</head>
<body class="with-welcome-text">
<div class="container-scroller">
  <div class="row p-0 m-0 proBanner" id="proBanner">
    <div class="col-md-12 p-0 m-0">
      <div class="card-body card-body-padding px-3 d-flex align-items-center justify-content-between">
        <div class="ps-lg-3">
          <div class="d-flex align-items-center justify-content-between">
          </div>
        </div>
        <div class="d-flex align-items-center justify-content-between">
          <a href="#"><i class="ti-home me-3 text-white"></i></a>
          <button id="bannerClose" class="btn border-0 p-0">
            <i class="ti-close text-white"></i>
          </button>
        </div>
      </div>
    </div>
  </div>
  <!-- partial:partials/_navbar.html -->
  <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
      <div class="me-3">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-bs-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
      </div>
      <div>
        <a class="navbar-brand brand-logo" href="/">
          <img src="assets/images/logo.svg" alt="logo"/>
        </a>
        <a class="navbar-brand brand-logo-mini" href="/">
          <img src="assets/images/logo-mini.svg" alt="logo"/>
        </a>
      </div>
    </div>
      <%-- 오른쪽 상단 바--%><c:choose>
      <c:when test="${rightop == null}">
        <jsp:include page="rightop.jsp"/>
      </c:when>
      <c:otherwise>
        <jsp:include page="${rightop}.jsp"/>
      </c:otherwise>
      </c:choose>
      <%-- 오른쪽 상단 바 페이지 종료--%>
  </nav>
  <!-- partial -->

  <div class="container-fluid page-body-wrapper">
    <!-- partial:partials/_sidebar.html -->
    <%--        여기서부터 사이드바 : 354까지--%>
    <c:choose>
      <c:when test="${left == null}">
        <jsp:include page="left.jsp"/>
      </c:when>
      <c:otherwise>
        <jsp:include page="${left}.jsp"/>
      </c:otherwise>
    </c:choose>
    <%--        여기까지--%>
    <!-- partial 오른쪽 상단 바-->
    <c:choose>
      <c:when test="${center == null}">
        <jsp:include page="center.jsp"></jsp:include>
      </c:when>
      <c:otherwise>
        <jsp:include page="${center}.jsp"></jsp:include>
      </c:otherwise>
    </c:choose>
    <!-- main-panel ends -->
  </div>
  <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="assets/vendors/js/vendor.bundle.base.js"></script>
<script src="assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="assets/vendors/chart.js/chart.umd.js"></script>
<script src="assets/vendors/progressbar.js/progressbar.min.js"></script>
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="assets/js/off-canvas.js"></script>
<script src="assets/js/template.js"></script>
<script src="assets/js/settings.js"></script>
<script src="assets/js/hoverable-collapse.js"></script>
<script src="assets/js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="assets/js/jquery.cookie.js" type="text/javascript"></script>
<script src="assets/js/dashboard.js"></script>
<!-- <script src="assets/js/Chart.roundedBarCharts.js"></script> -->
<!-- End custom js for this page-->
</body>
</html>