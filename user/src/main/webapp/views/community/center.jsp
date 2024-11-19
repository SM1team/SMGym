<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-10">

  <h2>게시판 Page</h2>
  <h5>Title description, Sep 2, 2017</h5>
  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th>Id</th>
        <th>PWD</th>
        <th>NAME</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var ="c" items="${custs}">
<%--        끄집어낼곳은 custs 끄집어낼때 사용할 변수는 c--%>
        <tr>
            <td><a href = "/cust/detail?id=${c.custId}">${c.custId}</a></td>
          <td>${c.custPwd}</td>
          <td>${c.custName}</td>
        </tr>

      </c:forEach>


    </tbody>
  </table>

</div>