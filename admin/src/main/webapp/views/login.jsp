<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container login-container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header text-center">
                    <!-- <h3>로그인</h3> 삭제 -->
                </div>
                <div class="card-body">
                    <form action="<c:url value='/loginimpl' />" method="post">
                        <div class="form-group">
                            <label for="id">사용자 id</label>
                            <input type="text" class="form-control" id="id" name="id" required>
                        </div>
                        <div class="form-group">
                            <label for="pwd">비밀번호</label>
                            <input type="password" class="form-control" id="pwd" name="pwd" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">로그인</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
