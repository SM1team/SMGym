
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style>
    #dataTable img{
        width:100px !important;
    }
</style>



<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">트레이너 출결확인</h1>
<%--    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.--%>
<%--        For more information about DataTables, please visit the <a target="_blank"--%>
<%--                                                                   href="https://datatables.net">official DataTables documentation</a>.</p>--%>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <form action="/trainercheckimpl" method="get">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-2">
                                <h3>Select list:</h3>
                            </div>
                            <div class="col-sm-3">
                                <select class="form-control" name="keyword">
                                    <option value = "id"
                                            <c:if test="${search.keyword =='id'}"> selected </c:if>
                                    <%--            검색을 위해 검색창에 값을 넣었는데 search 버튼을 누르는 순간 입력한 값이 사라지는걸 방지--%>
                                    > 트레이너ID </option>

                                    <option value="month"
                                            <c:if test="${search.keyword == 'month'}"> selected </c:if>
                                    <%--                                  검색을 위해 값을 넣었는데 search 버튼을 누르는 순간 입력한 값이 사라지는걸 방지 --%>
                                    > 월</option>
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
                            <div class="col-sm-3">
                                <button type="submit" class="btn btn-primary">Search</button>
                            </div>

                        </div>
                    </div>
                </form>

                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>트레이너 ID</th>
                            <th>트레이너 출입</th>
                            <th>트레이너 퇴근</th>


                        </tr>
                        </thead>


                        <tbody>
                            <c:forEach var="c" items="${trainercheckpage.getList()}">
                                <tr>
                                    <td>${c.tcheckNo}</td>
                                    <td>${c.trainerId}</td>
                                    <td>${c.tcheckStart}</td>
                                    <td>${c.tcheckEnd}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <c:if test = "${trainercheckpage.getSize() != null}">
                        <jsp:include page="/views/trainerchecknav.jsp"/>
                        <%--    cust/page.jsp아래 nav.jsp가 추가되는거--%>
                    </c:if>
            </div>
        </div>
    </div>

</div>

