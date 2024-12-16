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
<style>
    /* 전체 페이지 스타일 */
    body {
        background-color: #000000;
        color: #ffffff;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        min-height: 100vh; /* 화면 높이를 채우도록 설정 */

    }


    /* 헤더 스타일 */
    header {
        background-color: #1a1a1a;
        text-align: center;
        padding: 20px 0;
    }

    /* 메인 컨텐츠 영역 */
    main {
        flex: 1; /* 메인 영역이 푸터 위의 남는 공간을 채움 */
        padding: 20px;
        margin-bottom: 50px; /* 푸터와 간격 확보 */
    }


    /* 카드 기본 스타일 */
    .card {
        background-color: #1a1a1a;
        border: 1px solid transparent; /* 기본 테두리를 투명하게 설정 */
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        padding: 20px;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;

        /* 크기와 정렬 관련 수정 */
        width: 60%; /* 카드의 가로 길이: 화면의 50% */
        margin: 100px auto; /* 세로 여백 100px, 좌우 자동 정렬 */
    }

    .card:hover {
        box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2); /* 그림자 강화 */
        border-color: #ae00c7; /* 카드 hover 시 테두리 색을 #ae00c7로 변경 */
    }

    /* 입력 필드 스타일 */
    .form-control {
        background-color: #000000;
        color: #ffffff;
        border: 1px solid #ffffff;
        border-radius: 5px;
        margin-bottom: 15px;
        padding: 10px;
    }

    .form-control:focus {
        border-color: #ae00c7;
        box-shadow: 0 0 8px #ae00c7;
        color: #ffffff; /* 텍스트 흰색 */
        background-color: #000000; /* 입력 필드 배경색 검정 */
    }


    /* 버튼 스타일 */
    .btn-primary {
        background-color: #ae00c7;
        border: none;
        padding: 12px 20px;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .btn-primary:hover {
        background-color: #85009e;
    }

    .card-footer{
        background-color: #1a1a1a;

    }
    .footer-text a {
        color: #f1f1f1; /* 기본 색상: 흰색 */
        text-decoration: none; /* 밑줄 제거 */
        transition: color 0.3s ease; /* 색상 변화 애니메이션 */
        display: inline-block; /* 여백이 적용되도록 inline-block으로 변경 */
    }

    /* 링크 hover 효과 */
    .footer-text a:hover {
        color: #ae00c7; /* 커서 올릴 때 보라색 */
    }

</style>
<div style="background-color: #000000;height: 70px;"></div>
<div class="col-sm-12">
    <h2 style="margin-left:700px;color: #ae00c7">회원 정보 수정</h2>
    <div class="row">
        <div class="col-sm-6" style="margin: auto  ">
            <form id="register_form">
                <div class="form-group">
                    <label for="id">Id:<span id="id_span"></span></label>
                    <input type="text" readonly value="${cust.custId}" class="form-control" placeholder="Enter id" id="id" name="custId" style="background-color: #e0e0e0;color: #1a1a1a">
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
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" value="${cust.custAddress}" class="form-control" placeholder="Enter Address" id="address" name="custAddress">
                </div>
                <button type="button" id="update_btn" class="btn btn-primary">Update</button>
            </form>
        </div>
    </div>
</div>