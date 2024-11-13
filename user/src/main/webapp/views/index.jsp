<!-- views/index.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="nav.jsp" %>
<%@ include file="trainer/trainer1.jsp" %>
<%@ include file="trainer/trainer2.jsp" %>
<%@ include file="trainer/trainer3.jsp" %>
<%@ include file="location/location1.jsp" %>
<%@ include file="location/location2.jsp" %>
<%@ include file="location/location3.jsp" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container" style="max-width: 100%">
    <div class="row">
        <c:choose>
            <c:when test="${top == null}">
                <jsp:include page="top.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${top}.jsp"/>
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

         <c:choose>
            <c:when test="${footer == null}">
                <jsp:include page="footer.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${footer}.jsp"/>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- Footer-->
<footer class="footer py-4" style="background-color: #f8f9fa;">  <!-- 지점들 section 색상과 동일한 배경색 -->
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

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="<c:url value='/js/scripts.js'/>"></script>

<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
