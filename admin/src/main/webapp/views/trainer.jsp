
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function(){
        // '예약 완료 처리' 버튼 클릭 시 이벤트 처리
        $("button#delete_btn").click(function() {
            // 해당 버튼의 부모 tr에서 예약 번호를 찾아오기
            var trainerId = $(this).closest('tr').find('td:first').text(); // 첫 번째 열(예약번호)을 가져옴

            // 확인 창 띄우기
            var confirmDelete = confirm("트레이너를 탈퇴 시키겠습니까?");  // confirm 창을 띄운다

            if (confirmDelete) {
                // 사용자가 '확인'을 누른 경우에만 삭제 요청
                $.ajax({
                    url: "/trainerdeleteimpl",  // 서버 URL
                    type: "POST",  // POST 요청
                    data: {
                        trainerId: trainerId  // 예약 번호를 서버에 전달
                    },
                    success: function(response) {
                        // 삭제가 성공하면 처리할 로직
                        alert("트레이너가 탈퇴되었습니다.");
                        // 필요시 페이지 새로 고침
                        location.reload(); // 예: 페이지 새로 고침
                    },
                    error: function() {
                        alert("서버와의 통신에 실패했습니다.");
                    }
                });
            } else {
                // 사용자가 '취소'를 누른 경우
                alert("탈퇴가 취소되었습니다.");
            }
        });
    });
</script>

<style>
    #dataTable img{
        width:100px !important;
    }
</style>



<div class="container-fluid">



    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">트레이너 정보</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <form action = "/trainerfindimpl" method = "get">
                    <div class="form-group">
                        <div class="row">
                            <div class = "col-sm-2">
                                <h3>Select list:</h3>

                            </div>
                            <div class = "col-sm-3">
                                <select class="form-control" name = "keyword">
                                    <%--                      //name으로 id나 name이 날라가게 된다.--%>

                                    <option value = "id"
                                            <c:if test="${search.keyword =='id'}"> selected </c:if>
                                    <%--            검색을 위해 검색창에 값을 넣었는데 search 버튼을 누르는 순간 입력한 값이 사라지는걸 방지--%>
                                    > 트레이너ID </option>
                                    <option value="name"
                                            <c:if test="${search.keyword == 'name'}"> selected </c:if>
                                    <%--                                  검색을 위해 값을 넣었는데 search 버튼을 누르는 순간 입력한 값이 사라지는걸 방지 --%>
                                    > 트레이너이름</option>

                                    <option value="place"
                                            <c:if test="${search.keyword == 'place'}"> selected </c:if>
                                    <%--                                  검색을 위해 값을 넣었는데 search 버튼을 누르는 순간 입력한 값이 사라지는걸 방지 --%>
                                    > 트레이너 지역(번호)</option>

                                    <option value="phone"
                                            <c:if test="${search.keyword == 'phone'}"> selected </c:if>
                                    <%--                                  검색을 위해 값을 넣었는데 search 버튼을 누르는 순간 입력한 값이 사라지는걸 방지 --%>
                                    > 트레이너 전화번호</option>


                                </select>
                            </div>
                            <div class = "col-sm-4">

                                <input type="text" class="form-control" name = "search"
                                <c:if test = "${search.search != null}"> value = "${search.search}"
                                    <%--                                                      search객체 안에서 search 끄집어냄--%>
                                    <%--                          검색을 위해 값을 넣었는데 search 버튼을 누르는 순간 입력한 값이 사라지는걸 방지--%>
                                    <%--                          검색창에 입력한게 그대로 남아있게됨--%>
                                </c:if>

                                >


                            </div>
                            <div class = "col-sm-3">
                                <button type="submit"  class="btn btn-primary">Search</button>
                            </div>

                        </div>
                    </div>
                </form>
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>트레이너 ID</th>
                            <th>트레이너 이름</th>
                            <th>트레이너 나이</th>
                            <th>트레이너 성별</th>
                            <th>트레이너 전화번호</th>
                            <th>트레이너 주소</th>
                            <th>트레이너 PWD</th>
                            <th>트레이너 지역(번호)</th>

                        </tr>
                        </thead>


                        <tbody>
                            <c:forEach var="c" items="${trainerpage.getList()}">
                                <tr>
                                    <td>${c.trainerId}</td>
                                    <td>${c.trainerName}</td>
                                    <td>${c.trainerAge}</td>
                                    <td>${c.trainerGender}</td>

    <%--                                <td>--%>
    <%--                                    <fmt:formatNumber type="number" pattern="###,###원" value="${reservation.itemPrice}" />--%>
    <%--                                </td>--%>

                                    <td>${c.trainerPhone}</td>
    <%--                                <td>--%>
    <%--                                    <fmt:parseDate value="${ reservation.updateDate }"--%>
    <%--                                                   pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />--%>
    <%--                                    <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${ parsedDateTime }" />--%>
    <%--                                </td>--%>
                                    <td>${c.trainerAddress}</td>
                                    <td>${c.trainerPwd}</td>
                                    <td>${c.placeNo}</td>
                                    <td>
                                        <button type="button" class="btn btn-success" id = "delete_btn">트레이너 삭제</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <c:if test = "${trainerpage.getSize() != null}">
                        <jsp:include page="/views/trainersearchnav.jsp"/>
                        <%--    cust/page.jsp아래 nav.jsp가 추가되는거--%>
                    </c:if>
            </div>
        </div>
    </div>

</div>

