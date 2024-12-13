
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function(){
        // '예약 완료 처리' 버튼 클릭 시 이벤트 처리
        $("button#update_btn").click(function() {
            // 해당 버튼의 부모 tr에서 예약 번호를 찾아오기
            var reservationNo = $(this).closest('tr').find('td:first').text(); // 첫 번째 열(예약번호)을 가져옴


            $.ajax({
                url: "/reservationupdateimpl",  // 서버 URL
                type: "POST",  // POST 요청
                data: {
                    reservationNo: reservationNo  // 예약 번호를 서버에 전달
                },

                error: function() {
                    alert("서버와의 통신에 실패했습니다.");
                }
            });
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
            <h6 class="m-0 font-weight-bold text-primary">예약 관리</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <form action = "/findimpl" method = "get">
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
                                    > ID </option>
                                    <option value="name"
                                            <c:if test="${search.keyword == 'name'}"> selected </c:if>
                                    <%--                                  검색을 위해 값을 넣었는데 search 버튼을 누르는 순간 입력한 값이 사라지는걸 방지 --%>
                                    > NAME</option>

                                    <option value="year"
                                            <c:if test="${search.keyword == 'year'}"> selected </c:if>
                                    <%--                                  검색을 위해 값을 넣었는데 search 버튼을 누르는 순간 입력한 값이 사라지는걸 방지 --%>
                                    > YEAR</option>

                                    <option value="month"
                                            <c:if test="${search.keyword == 'month'}"> selected </c:if>
                                    <%--                                  검색을 위해 값을 넣었는데 search 버튼을 누르는 순간 입력한 값이 사라지는걸 방지 --%>
                                    > Month</option>
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
                            <th>예약번호</th>
                            <th>회원 이름</th>
                            <th>회원 전화번호</th>
                            <th>문의 내용</th>
                            <th>방문 날짜</th>
                            <th>예약 상태</th>
                            <th>회원 ID</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>예약번호</th>
                            <th>회원 이름</th>
                            <th>회원 전화번호</th>
                            <th>문의 내용</th>
                            <th>방문 날짜</th>
                            <th>예약 상태</th>
                            <th>회원 ID</th>
                        </tr>
                        </tfoot>
                        <tbody>
                        <c:forEach var="reservation" items="${cpage.getList()}">
                            <tr>
                                <td>${reservation.reservationNo}</td>
                                <td>${reservation.custName}</td>
                                <td>${reservation.custPhone}</td>
                                <td>${reservation.reservationContent}</td>

<%--                                <td>--%>
<%--                                    <fmt:formatNumber type="number" pattern="###,###원" value="${reservation.itemPrice}" />--%>
<%--                                </td>--%>
                                <td>
                                    <fmt:parseDate value="${ reservation.reservationDate }"
                                                   pattern="yyyy-MM-dd" var="parsedDateTime" type="both" />
                                    <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${ parsedDateTime }" />
                                </td>
                                <td>${reservation.reservationState}</td>
<%--                                <td>--%>
<%--                                    <fmt:parseDate value="${ reservation.updateDate }"--%>
<%--                                                   pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />--%>
<%--                                    <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${ parsedDateTime }" />--%>
<%--                                </td>--%>
                                <td>${reservation.custId}</td>
                                <td>
                                    <button type="button" class="btn btn-success" id = "update_btn">예약 완료 처리</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <c:if test = "${cpage.getSize() != null}">
                        <jsp:include page="/views/searchnav.jsp"/>
                        <%--    cust/page.jsp아래 nav.jsp가 추가되는거--%>
                    </c:if>
            </div>
        </div>
    </div>

</div>

