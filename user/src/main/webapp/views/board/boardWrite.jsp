<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- styles.css 파일을 링크로 추가 -->
<link rel="stylesheet" href="<c:url value='/css/styles.css' />">

<h2>게시글 작성</h2>

<!-- 게시글 작성 폼 -->
<form action="<c:url value='/boardwriteimpl' />" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="title">제목</label>
        <input type="text" id="title" name="title" class="form-control" required placeholder="게시글 제목을 입력하세요">
    </div>

    <div class="form-group">
        <label for="content">내용</label>
        <textarea id="content" name="content" class="form-control" rows="5" required placeholder="게시글 내용을 입력하세요"></textarea>
    </div>

    <div class="form-group">
        <label for="boardImg">이미지 업로드 (선택)</label>
        <input type="file" id="boardImg" name="boardImg" class="form-control-file">
    </div>

    <button type="submit" class="btn btn-primary">작성 완료</button>
    <a href="<c:url value='/board' />" class="btn btn-secondary" style="margin-left: 10px;">취소</a>
</form>

<!-- 이전 페이지로 돌아가는 버튼 -->
<div style="margin-top: 20px;">
    <a href="<c:url value='/board' />" class="btn btn-secondary">게시판으로 돌아가기</a>
</div>
