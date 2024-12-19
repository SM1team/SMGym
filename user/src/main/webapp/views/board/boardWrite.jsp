<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- styles.css 파일을 링크로 추가 -->
<link rel="stylesheet" href="<c:url value='/css/styles.css' />">

<style>
    /* 게시글 작성 페이지 스타일 */
    body {
        font-family: Arial, sans-serif;
        line-height: 1.5;
        color: #e0e0e0;
        background-color: #000000;
        margin: 0;
        padding: 0;
    }

    h2 {
        text-align: center;
        color: #ae00c7;
        font-size: 2rem;;
    }

    .form-group {
        margin: auto;
        width: 50%;

    }

    label {
        color: #e0e0e0;
        font-weight: bold;
        font-size: 1.1rem;
        display: block;
        margin-bottom: 10px;
    }

    .form-control,
    .form-control-file {
        width: 100%;
        padding: 10px;
        border-radius: 4px;
        border: 1px solid #ae00c7;
        background-color: #333;
        color: #e0e0e0;
        font-size: 1rem;
    }

    .form-control::placeholder {
        color: #ae00c7;
    }

    .form-control:hover,
    .form-control:focus {
        border-color: #ae00c7;
        background-color: #000;
        box-shadow: 0 0 8px #ae00c7;
        color: #ffffff;
    }

    button[type="submit"],
    .btn-secondary {
        padding: 10px 15px;
        font-size: 1rem;
        color: #e0e0e0;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s ease, color 0.3s ease;
        display: inline-block;
        text-align: center;
    }

    /* 작성 완료 버튼 */
    button[type="submit"] {
        background-color: #000;
        color: #ffffff;
        border: 1px solid #ae00c7;
        margin-top: 20px;
    }

    /* 작성 완료 버튼 호버 */
    button[type="submit"]:hover {
        background-color: #ae00c7;
        color: #ffffff;
        border-color: #ffffff;
    }

    /* 취소 버튼 */
    .btn-secondary {
        background-color: #000;
        color: #ffffff;
        border: 1px solid #ae00c7;
    }

    /* 취소 버튼 호버 */
    .btn-secondary:hover {
        background-color: #ae00c7;
        color: #ffffff;
        border-color: #ffffff;
    }

    /* 이전 페이지 버튼 */
    .btn-secondary {
        background-color: #000;
        color: #ffffff;
        border: 1px solid #ae00c7;
        display: inline-block;
        text-align: center;
        padding: 10px 15px;
        font-size: 1rem;
        margin-top: 20px;
        text-decoration: none;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    .btn-secondary:hover {
        background-color: #ae00c7;
        color: #ffffff;
        border-color: #ffffff;
    }
</style>

<h2 style="margin-top: 30px;">게시글 작성</h2>

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

    <div style="text-align: center;"> <!-- 버튼들을 가운데로 정렬 -->
        <button type="submit" class="btn btn-primary">작성 완료</button>
        <a href="<c:url value='/board' />" class="btn btn-secondary" style="margin-left: 20px;">취소</a>
    </div>
</form>
</div>

<!-- 이전 페이지로 돌아가는 버튼 -->
<div style="text-align: center;">
    <a href="<c:url value='/board' />" class="btn btn-secondary">게시판으로 돌아가기</a>
</div>