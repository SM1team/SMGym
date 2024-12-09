<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2>PT 수정 페이지</h2>

<form action="/pt/update" method="post">
    <input type="hidden" name="ptNo" value="${pt.ptNo}" />
    <div class="form-group">
        <label for="productNo">상품 번호</label>
        <input type="text" id="productNo" name="productNo" value="${pt.productNo}" class="form-control" />
    </div>
    <div class="form-group">
        <label for="trainerId">트레이너 ID</label>
        <input type="text" id="trainerId" name="trainerId" value="${pt.trainerId}" class="form-control" />
    </div>
    <div class="form-group">
        <label for="ptContent">PT 내용</label>
        <textarea id="ptContent" name="ptContent" class="form-control">${pt.ptContent}</textarea>
    </div>
    <div class="form-group">
        <label for="ptDate">PT 날짜</label>
        <input type="text" id="ptDate" name="ptDate" value="${pt.ptDate}" class="form-control" />
    </div>
    <div class="form-group">
        <label for="ptCount">PT 회차</label>
        <input type="text" id="ptCount" name="ptCount" value="${pt.ptCount}" class="form-control" />
    </div>
    <button type="submit" class="btn btn-primary">수정하기</button>
</form>

