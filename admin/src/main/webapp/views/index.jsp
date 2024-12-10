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
  <link rel="stylesheet" href="<c:url value="${pageContext.request.contextPath}/assets/vendors/feather/feather.css"/>">
  <link rel="stylesheet"  href="<c:url value="${pageContext.request.contextPath}/assets/vendors/mdi/css/materialdesignicons.min.css"/>">
  <link rel="stylesheet" href="<c:url value="${pageContext.request.contextPath}/assets/vendors/ti-icons/css/themify-icons.css"/>">
  <link rel="stylesheet" href="<c:url value="${pageContext.request.contextPath}/assets/vendors/font-awesome/css/font-awesome.min.css"/>">
  <link rel="stylesheet" href="<c:url value="${pageContext.request.contextPath}/assets/vendors/typicons/typicons.css"/>">
  <link rel="stylesheet" href="<c:url value="${pageContext.request.contextPath}/assets/vendors/simple-line-icons/css/simple-line-icons.css"/>">
  <link rel="stylesheet" href="<c:url value="${pageContext.request.contextPath}/assets/vendors/css/vendor.bundle.base.css"/>">
  <link rel="stylesheet" href="<c:url value="${pageContext.request.contextPath}/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css"/>">

  <%--     Web Socket Lib    --%>
  <script src="/webjars/sockjs-client/sockjs.min.js"></script>
  <script src="/webjars/stomp-websocket/stomp.min.js"></script>

  <!-- endinject -->
  <!-- Plugin css for this page -->
  href="<c:url value="${pageContext.request.contextPath}/assets/css/style.css"/>"
  <link rel="stylesheet" href="<c:url value="${pageContext.request.contextPath}/assets/vendors/datatables.net-bs4/dataTables.bootstrap4.css"/>">
  <link rel="stylesheet" type="text/css" href="<c:url value="${pageContext.request.contextPath}/assets/js/select.dataTables.min.css"/>">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="<c:url value="${pageContext.request.contextPath}/assets/css/style.css"/>">

  <!-- endinject -->
  <link rel="shortcut icon"  href="<c:url value="${pageContext.request.contextPath}/assets/images/favicon.png"/>"/>
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

  <c:choose>
    <c:when test="${top == null}">
      <jsp:include page="top.jsp"/>
    </c:when>
    <c:otherwise>
      <jsp:include page="${top}.jsp"/>
    </c:otherwise>
  </c:choose>
  <c:choose>
    <c:when test="${left == null}">
      <jsp:include page="left.jsp"/>
    </c:when>
    <c:otherwise>
      <jsp:include page="${left}.jsp"/>
    </c:otherwise>
  </c:choose>
  <c:choose>
    <c:when test="${center == null}">
      <jsp:include page="center.jsp"/>
    </c:when>
    <c:otherwise>
      <jsp:include page="${center}.jsp"/>
    </c:otherwise>
  </c:choose>



  <!-- partial -->
</div>
<!-- main-panel ends -->
</div>
<!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- plugins:js -->


<script src="<c:url value="${pageContext.request.contextPath}/assets/vendors/js/vendor.bundle.base.js"/>"></script>
<script src="<c:url value="${pageContext.request.contextPath}/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"/>"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="<c:url value="${pageContext.request.contextPath}/assets/vendors/chart.js/chart.umd.js"/>"></script>
<script src="<c:url value="${pageContext.request.contextPath}/assets/vendors/progressbar.js/progressbar.min.js"/>"></script>
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="<c:url value="${pageContext.request.contextPath}/assets/js/off-canvas.js"/>"></script>
<script src="<c:url value="${pageContext.request.contextPath}/assets/js/template.js"/>"></script>
<script src="<c:url value="${pageContext.request.contextPath}/assets/js/settings.js"/>"></script>
<script src="<c:url value="${pageContext.request.contextPath}/assets/js/hoverable-collapse.js"/>"></script>
<script src="<c:url value="${pageContext.request.contextPath}/assets/js/todolist.js"/>"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="<c:url value="${pageContext.request.contextPath}/assets/js/jquery.cookie.js"/>" type="text/javascript"></script>
<script src="<c:url value="${pageContext.request.contextPath}/assets/js/dashboard.js"/>"></script>
<!-- <script src="assets/js/Chart.roundedBarCharts.js"></script> -->
<!-- End custom js for this page-->
</body>
</html>