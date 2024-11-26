<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let trainer_get = {
        search:function(){
            let keyword = document.getElementById('searchKeyword').value;
            location.href = '<c:url value="/trainer/search"/>?keyword=' + keyword;
        }
    };
    $(function(){
        // search functionality if needed
    });
</script>

<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Search Trainer</h1>
    <p class="mb-4">Search for trainers by their ID or Name.</p>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Search</h6>
        </div>
        <div class="card-body">
            <div class="input-group mb-3">
                <input type="text" class="form-control" id="searchKeyword" placeholder="Enter ID or Name">
                <div class="input-group-append">
                    <button class="btn btn-primary" onclick="trainer_get.search()">Search</button>
                </div>
            </div>
        </div>
    </div>
</div>
