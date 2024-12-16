<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2>상세 조회</h2>

<form action="/pt/update" method="post">
    <input type="hidden" name="ptNo" value="${pt.ptNo}" />
    <div class="form-group">
        <label for="trainerId">트레이너 ID</label>
        <input type="text" id="trainerId" name="trainerId" value="${pt.trainerId}" class="form-control" readonly/>
    </div>
    <div class="form-group" >
        <label for="ptContent">PT 내용</label>
        <textarea id="ptContent" name="ptContent" class="form-control" readonly>${pt.ptContent}</textarea>
    </div>
    <div class="form-group">
        <label for="ptDate">PT 날짜</label>
        <input type="text" id="ptDate" name="ptDate" value="${pt.ptDate} " class="form-control" readonly />
    </div>
    <div class="form-group">
        <label for="ptCount">PT 회차</label>
        <input type="text" id="ptCount" name="ptCount" value="${pt.ptCount}" class="form-control" readonly/>
    </div>
</form>

