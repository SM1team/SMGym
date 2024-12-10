<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    /* 채팅 전체 레이아웃 */
    .chat-container {
        display: flex;
        flex-direction: column;
        height: 500px;
        width: 100%;
        max-width: 600px;
        border: 1px solid #e1e1e1;
        border-radius: 10px;
        background-color: #f9f9f9;
        padding: 10px;
        margin: 0 auto;
    }

    /* 채팅 메시지 영역 */
    #to {
        flex-grow: 1; /* 메시지 영역을 최대 크기로 확장 */
        overflow-y: auto; /* 스크롤을 자동으로 표시 */
        padding: 10px;
        border-radius: 10px;
        background-color: #fff;
        margin-bottom: 10px;
        border: 1px solid #ddd;
    }

    /* 메시지 박스 */
    .message {
        margin: 8px 0;
        padding: 12px;
        border-radius: 18px;
        max-width: 75%;
    }

    /* 내가 보낸 메시지 (오른쪽 정렬) */
    .my-message {
        background-color: #bfe3ff;
        margin-left: auto;
        text-align: right;
        border-bottom-right-radius: 0;
    }

    /* 상대방이 보낸 메시지 (왼쪽 정렬) */
    .other-message {
        background-color: #e9ecef;
        margin-right: auto;
        text-align: left;
        border-bottom-left-radius: 0;
    }

    /* 입력창과 버튼 영역 */
    .input-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding-top: 10px;
        padding-bottom: 10px;
        border-top: 1px solid #ddd;
    }

    /* 입력창 스타일 */
    #totext, #target {
        width: 70%;
        padding: 12px;
        border-radius: 20px;
        border: 1px solid #ddd;
        margin-right: 10px;
        font-size: 14px;
    }

    /* 전송 버튼 스타일 */
    #sendto {
        padding: 12px 20px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 20px;
        cursor: pointer;
        font-size: 14px;
    }

    #sendto:hover {
        background-color: #0056b3;
    }

    /* 상태 표시 */
    #status {
        font-weight: bold;
        color: #28a745;
    }.chat-header {
         background-color: #0078D4; /* 전송 버튼과 동일한 색상 */
         color: white; /* 텍스트 색상을 흰색으로 */
         padding: 12px 20px; /* 상하 좌우 패딩 */
         border-radius: 20px; /* 둥근 모서리 */
         text-align: center; /* 가운데 정렬 */
         font-size: 1.2em; /* 글자 크기 */
         margin-bottom: 15px; /* 아래쪽 여백 */
     }
</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="<c:url value="//webjars/sockjs-client/sockjs.min.js"/>"></script>
<script src="<c:url value="//webjars/stomp-websocket/stomp.min.js"/>"></script>


<script>
    let websocket = {
        id: '',
        stompClient: null,
        init: function () {
            this.id = $('#trainer_id').text();

            // 페이지 로드 시 자동으로 connect 호출
            if (this.id) {
                this.connect();
            }

            $('#connect').click(() => {
                this.connect();
            });
            $('#disconnect').click(() => {
                this.disconnect();
            });
            $('#sendto').click(() => {
                var msg = JSON.stringify({
                    'sendid': this.id,
                    'receiveid': $('#target').val(),
                    'content1': $('#totext').val()
                });
                this.stompClient.send('/receiveto', {}, msg);

                // 내가 보낸 메시지를 화면에 표시 (오른쪽 정렬)
                $("#to").append(
                    "<div class='message my-message'>" +
                    "<span style='color: blue;'>나:</span> " + $('#totext').val() +
                    "</div>"
                );
                $('#totext').val(''); // 입력란 초기화
            });

            this.subscribe('/send/to/' + this.id, function (msg) {
                // 상대방 메시지를 화면에 표시 (왼쪽 정렬)
                $("#to").append(
                    "<div class='message other-message'>" +
                    JSON.parse(msg.body).sendid + ": " +
                    JSON.parse(msg.body).content1 +
                    "</div>"
                );
            });
        },
        connect: function () {
            let sid = this.id;
            let socket = new SockJS('${serverurl}/ws');
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function (frame) {
                websocket.setConnected(true);
                console.log('Connected: ' + frame);
                websocket.stompClient.subscribe('/send/to/' + sid, function (msg) {
                    // 상대방 메시지도 append로 변경
                    $("#to").append(
                        "<h4>" + JSON.parse(msg.body).sendid + ": " +
                        JSON.parse(msg.body).content1 +
                        "</h4>"
                    );
                });
            });
        },
        disconnect: function () {
            if (this.stompClient !== null) {
                this.stompClient.disconnect();
            }
            websocket.setConnected(false);
            console.log("Disconnected");
        },
        setConnected: function (connected) {
            if (connected) {
                $("#status").text("Connected");
            } else {
                $("#status").text("Disconnected");
            }
        }
    };
    $(function () {
        websocket.init();
    });
</script>





<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Web Socket</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Web Socket</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <div class="col-sm-5 chat-container">
                    <h1 id="trainer_id" class="chat-header">${sessionScope.loginid.trainerId}</h1>
                    <%--                    <h1 id="status">Status</h1>--%>
                    <%--                    <button id="connect">Connect</button>--%>
                    <%--                    <button id="disconnect">Disconnect</button>--%>



                    <!-- 채팅 메시지 영역 -->
                    <div id="to"></div>

                    <!-- 입력창과 전송 버튼 -->
                    <div class="input-container">

                        <input type="text" id="target" placeholder="Recipient ID">
                        <input type="text" id="totext" placeholder="Enter message">
                        <button id="sendto">Send</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>