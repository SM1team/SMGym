<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let cust_get = {
        // 검색 기능
        search: function() {
            let keyword = document.getElementById('searchKeyword').value; // 입력된 검색어 가져오기
            location.href = '<c:url value="/cust/search"/>?keyword=' + keyword; // 검색어를 URL에 추가하여 리디렉션
        }
    };

    $(function(){
        // 추가적인 JavaScript 기능을 필요에 따라 작성 가능
    });
</script>

<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Search Customer</h1>
    <p class="mb-4">Search for customers by their ID or Name.</p>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Search</h6>
        </div>
        <div class="card-body">
            <!-- 검색 폼 -->
            <div class="input-group mb-3">
                <input type="text" class="form-control" id="searchKeyword" placeholder="Enter ID or Name">
                <div class="input-group-append">
                    <button class="btn btn-primary" onclick="cust_get.search()">Search</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 검색 결과 테이블 -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Search Results</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- 고객 목록 출력 -->
                    <c:forEach var="cust" items="${custs}">
                        <tr>
                            <td>${cust.custId}</td>
                            <td>${cust.name}</td>
                            <td>
                                <a href="<c:url value='/cust/detail?id=${cust.custId}' />" class="btn btn-info">View</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
