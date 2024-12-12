<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2>PT 수정 페이지</h2>

<form action="/pt/update" method="post">
    <!-- 숨겨진 필드 -->
    <input type="hidden" name="ptNo" value="${pt.ptNo}" />
    <input type="hidden" id="productNo" name="productNo" value="${pt.productNo}" />
    <input type="hidden" id="trainerId" name="trainerId" value="${pt.trainerId}" />
    <input type="hidden" id="ptDate" name="ptDate" value="${pt.ptDate}" />
    <input type="hidden" id="ptCount" name="ptCount" value="${pt.ptCount}" />

    <!-- 보이는 필드 -->
    <div class="form-group">
        <label for="ptContent">PT 내용</label>
        <textarea id="ptContent" name="ptContent" class="form-control">${pt.ptContent}</textarea>
    </div>

    <button type="submit" class="btn btn-primary">수정하기</button>
</form>
