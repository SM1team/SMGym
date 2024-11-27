<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let detail = {
        init:function() {
            $('#update_btn').click(() => {
                this.check();
            });
        },
        check:function(){
            let id = $('#id').val();
            let pwd = $('#pwd').val();
            let name = $('#name').val();
            let phone = $('#phone').val();
            let age = $('#age').val();


            if(id == '' || id == null){
                alert('Id is Mandatory');
                $('#id').focus();
                return;
            }
            if(pwd == '' || pwd == null){
                alert('Pwd is Mandatory');
                $('#pwd').focus();
                return;
            }
            if(name == '' || name == null){
                alert('Name is Mandatory');
                $('#name').focus();
                return;
            }
            if(phone == '' || phone == null){
                alert('Name is Mandatory');
                $('#phone').focus();
                return;
            }

            if(age == '' || age == null){
                alert('Name is Mandatory');
                $('#age').focus();
                return;
            }
            this.send();
        },
        send:function(){
            // method, action
            $('#register_form').attr('method','post');

            $('#register_form').attr('action','/mypage/updateimpl');
            $('#register_form').submit();
        }
    };

    $(function(){
        detail.init();
    });
</script>

<div class="col-sm-12">
    <h2>나의 정보 수정</h2>
    <div class="row">
        <div class="col-sm-12">
            <form id="register_form">
                <div class="form-group">
                    <label for="id">Id:<span id="id_span"></span></label>
                    <input type="text" readonly value="${cust.custId}" class="form-control" placeholder="Enter id" id="id" name="custId">
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" value="${cust.custPwd}" class="form-control" placeholder="Enter password" id="pwd" name="custPwd">
                </div>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" value="${cust.custName}" class="form-control" placeholder="Enter name" id="name" name="custName">
                </div>

                <div class="form-group">
                    <label for="name">age:</label>
                    <input type="text" value="${cust.custAge}" class="form-control" placeholder="Enter Age" id="age" name="custAge">
                </div>
                <div class="form-group">
                    <label for="name">Phone:</label>
                    <input type="text" value="${cust.custPhone}" class="form-control" placeholder="Enter phone number" id="phone" name="custPhone">
                </div>

<%--                <div class="form-group">--%>
<%--                    <label for="name">Adress:</label>--%>
<%--                    <input type="text" value="${cust.custAdress}" class="form-control" placeholder="Enter Adress" id="adress" name="custAdress">--%>
                </div>
                <button type="button" id="update_btn" class="btn btn-primary">Update</button>
            </form>
        </div>
    </div>
</div>