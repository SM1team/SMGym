
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    #to {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid green;
        padding: 10px;
    }
    .message {
        margin: 5px 0;
        padding: 10px;
        border-radius: 10px;
        max-width: 70%;
        clear: both;
    }
    .my-message {
        background-color: #d1e7ff;
        margin-left: auto;
        text-align: right;
    }
    .other-message {
        background-color: #e9ecef;
        margin-right: auto;
        text-align: left;
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

            this.subscribe('/send/to/' + sid, function (msg) {
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
                this.subscribe('/send/to/' + sid, function (msg) {
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

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Web Socket</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Web Socket</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <div class="col-sm-5">
                    <h1 id="trainer_id">${sessionScope.loginid.trainerId}</h1>
                    <H1 id="status">Status</H1>
                    <button id="connect">Connect</button>
                    <button id="disconnect">Disconnect</button>

                    <h3>To</h3>
                    <input type="text" id="target">
                    <input type="text" id="totext"><button id="sendto">Send</button>
                    <div id="to"></div>

                </div>
            </div>
        </div>
    </div>

</div>


