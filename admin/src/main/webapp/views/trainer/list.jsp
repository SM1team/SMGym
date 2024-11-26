<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let trainer_get = {
        init:function(){},
        update:function(id){
            let c = confirm('수정하시겠습니까?');
            if(c == true){
                location.href = '<c:url value="/trainer/detail"/>?id=' + id;
            }
        },
        delete:function(id){
            let c = confirm('삭제하시겠습니까?');
            if(c == true){
                location.href = '<c:url value="/trainer/delete"/>?id=' + id;
            }
        }
    };
    $(function(){
        trainer_get.init();
    });
</script>

<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Trainer List</h1>
    <p class="mb-4">List of trainers available in the system.</p>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Trainer List</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Password</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="trainer" items="${trainers}">
                        <tr>
                            <td><a href="<c:url value='/trainer/detail' />?id=${trainer.id}">${trainer.id}</a></td>
                            <td>${trainer.name}</td>
                            <td>${trainer.password}</td>
                            <td>
                                <button onclick="trainer_get.update('${trainer.id}')" class="btn btn-primary">Update</button>
                            </td>
                            <td>
                                <button onclick="trainer_get.delete('${trainer.id}')" class="btn btn-danger">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
