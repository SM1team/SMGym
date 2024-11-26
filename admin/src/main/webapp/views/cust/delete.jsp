<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>

<script>
    let cust_delete = {
        init:function(){
            // 삭제 버튼 클릭 시
            $('.btn_delete').click((event) => {
                // 삭제할 항목의 ID를 가져옵니다.
                let custId = $(event.target).data('id');

                // 확인 창 표시
                let c = confirm('정말로 삭제하시겠습니까?');
                if(c == true){
                    this.delete(custId);
                }
            });
        },

        // 삭제 요청을 서버로 보냅니다.
        delete:function(id){
            // Ajax 요청을 통해 삭제
            $.ajax({
                url: '/cust/delete',  // 삭제 처리할 URL
                type: 'POST',
                data: { id: id },
                success: function(response){
                    if(response.success) {
                        alert('삭제가 완료되었습니다.');
                        location.reload();  // 페이지를 새로고침하여 삭제된 항목을 반영
                    } else {
                        alert('삭제 실패: ' + response.message);
                    }
                },
                error: function(xhr, status, error){
                    alert('삭제 중 오류가 발생했습니다.');
                }
            });
        }
    };

    $(function(){
        cust_delete.init();
    });
</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Tables</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <!-- Table displaying customer data -->
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- 예시 데이터, 실제 데이터는 서버에서 동적으로 생성 -->
                    <tr>
                        <td>12345</td>
                        <td>John Doe</td>
                        <td>
                            <button class="btn btn-danger btn_delete" data-id="12345">Delete</button>
                        </td>
                    </tr>
                    <tr>
                        <td>67890</td>
                        <td>Jane Smith</td>
                        <td>
                            <button class="btn btn-danger btn_delete" data-id="67890">Delete</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
