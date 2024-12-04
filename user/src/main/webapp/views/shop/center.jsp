<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2>shop</h2>

<div class="container">
  <div class="row">
    <!-- 상품 목록 반복 -->
    <c:forEach var="product" items="${productlist}">
      <div class="col-md-3 mb-4">
        <div class="card h-100">
          <!-- Product image-->
          <a href="<c:url value='/shop/detail'/>?productNo=${product.productNo}">
            <img class="card-img-top" src="<c:url value='/assets/img/${product.productImg}' />" alt="Product Image" />
          </a>
          <!-- Product details-->
          <div class="card-body p-4">
            <div class="text-center">
              <!-- Product name-->
              <h5 class="fw-bolder">${product.productName}</h5>
              <!-- Product price-->
              ₩${product.productPrice}
            </div>
          </div>
          <!-- Product actions-->
          <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
            <div class="text-center">
              <a href="<c:url value='/shop/detail'/>?productNo=${product.productNo}" class="btn btn-outline-dark mt-auto">View options</a>
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
