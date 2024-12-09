=<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login Page</title>
</head>
<body style="background-color: #000; color: #fff ; font-family: Arial, sans-serif; margin: 0; padding: 0;">

<div class="container" style="background-color: #000; display: flex; justify-content: center; align-items: center; height: 100vh; padding: 20px;">
    <div class="login-form" style="background-color: #222; padding: 30px 40px; border-radius: 10px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5); width: 100%; max-width: 400px;">
        <div class="brand-logo" style="text-align: center; margin-bottom: 20px;">
            <img src="<c:url value='/assets/images/logo.svg' />" alt="logo" style="max-width: 150px;">
        </div>
        <h4 style="text-align: center; color: #fff;">Welcome Back!</h4>
        <p style="text-align: center; color: #bbb;">Please log in to continue.</p>

        <!-- 로그인 오류 메시지 -->
        <c:if test="${param.error == 'true'}">
            <div class="alert" style="background-color: #d9534f; color: white; padding: 10px; border-radius: 5px; margin-bottom: 20px;">
                Invalid ID or password. Please try again.
            </div>
        </c:if>

        <form method="post" action="/loginimpl">
            <div class="form-group" style="margin-bottom: 15px;">
                <input type="text" class="form-control" id="id" name="id" placeholder="Enter your ID" style="background-color: #333; color: #fff; border: 1px solid #444; padding: 12px; border-radius: 5px; width: 100%;">
            </div>
            <div class="form-group" style="margin-bottom: 25px;">
                <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter your password" style="background-color: #333; color: #fff; border: 1px solid #444; padding: 12px; border-radius: 5px; width: 100%;">
            </div>
            <div class="form-group" style="margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center;">
                <div>
                    <input type="checkbox" id="remember" name="remember" style="cursor: pointer;">
                    <label for="remember" style="color: #bbb; margin-left: 5px; cursor: pointer;">Keep me signed in</label>
                </div>
                <a href="#" style="color: #bbb; text-decoration: none; font-size: 14px;">Forgot password?</a>
            </div>
            <div class="form-group" style="margin-bottom: 20px;">
                <button type="submit" class="btn" style="background-color: #007bff; color: #fff; border: none; padding: 14px 0; width: 100%; border-radius: 5px; font-size: 16px; cursor: pointer;">
                    Sign In
                </button>
            </div>
        </form>

        <div style="text-align: center; margin-top: 20px;">
            <p style="color: #bbb; font-size: 14px;">Don't have an account? <a href="register.html" style="color: #007bff; text-decoration: none;">Create one</a></p>
        </div>
    </div>
</div>

</body>
</html>
