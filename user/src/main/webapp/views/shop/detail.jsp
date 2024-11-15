<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2>상품 상세 정보 수정</h2>

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <!-- 상품 이미지 -->
            <img class="img-fluid" src="${product.productImg}" alt="Product Image" />
        </div>
        <div class="col-md-6">
            <!-- 상품 정보 수정 폼 -->
            <form action="/product/update" method="post">
                <div class="form-group">
                    <label for="productName">상품 이름</label>
                    <input type="text" id="productName" class="form-control" value="${product.productName}" readonly />
                </div>

                <div class="form-group">
                    <label for="productPrice">가격</label>
                    <input type="text" id="productPrice" class="form-control" value="₩${product.productPrice}" readonly />
                </div>

                <div class="form-group">
                    <label for="productNo">상품 번호</label>
                    <input type="text" id="productNo" class="form-control" value="${product.productNo}" readonly />
                </div>

                <div class="form-group">
                    <label for="trainerId">트레이너</label>
                    <input type="text" id="trainerId" name="trainerId" class="form-control" value="${product.trainerId}" />
                </div>

                <div class="form-group">
                    <label for="trainerGender">트레이너 성별</label>
                    <select id="trainerGender" name="trainerGender" class="form-control">
                        <option value="1" ${product.trainerGender == 1 ? 'selected' : ''}>남성</option>
                        <option value="2" ${product.trainerGender == 2 ? 'selected' : ''}>여성</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="placeNo">장소 번호</label>
                    <input type="text" id="placeNo" name="placeNo" class="form-control" value="${product.placeNo}" />
                </div>

                <!-- 수정 버튼 -->
                <button type="submit" class="btn btn-primary">수정하기</button>
            </form>
        </div>
    </div>
</div>

<!-- JavaScript (Bootstrap) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
