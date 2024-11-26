
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let trainer_get = {
        init:function(){},
        update:function(id){
            let c = confirm('수정하시겠습니까?');
            if(c == true){
                location.href = '<c:url value="/trainer/detail"/>?id='+id;
            }
        },
        delete:function(id){
            let c = confirm('삭제하시겠습니까?');
            if(c == true){
                location.href = '<c:url value="/trainer/delete"/>?id='+id;
            }
        }
    };
    $(function(){
        trainer_get.init();
    });
</script>
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
        For more information about DataTables, please visit the <a target="_blank"
                                                                   href="https://datatables.net">official DataTables documentation</a>.</p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>PWD</th>
                        <th>NAME</th>
                        <th>UPDATE</th>
                        <th>DELETE</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>ID</th>
                        <th>PWD</th>
                        <th>NAME</th>
                        <th>UPDATE</th>
                        <th>DELETE</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="c" items="${trainers}">
                        <tr>
                            <td><a href="<c:url value="/trainer/detail"/>?id=${c.trainerId}">${c.trainerId}</a></td>
                            <td>${c.trainerPwd}</td>
                            <td>${c.trainerName}</td>
                            <td>
                                <button onclick="trainer_get.update('${c.trainerId}')" type="button" class="btn btn-primary">Update</button>
                            </td>
                            <td>
                                <button onclick="trainer_get.delete('${c.trainerId}')" type="button" class="btn btn-primary">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>


