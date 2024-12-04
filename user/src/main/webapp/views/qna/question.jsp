
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
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>

<script>
  let websocket = {
    id:'',
    stompClient:null,
    init:function(){
      this.id = $('#adm_id').text();
      $('#connect').click(()=>{
        this.connect();
      });
      $('#disconnect').click(()=>{
        this.disconnect();
      });
      $('#sendto').click(() => {
        var msg = JSON.stringify({
          'sendid': websocket.id,
          'receiveid': $('#target').val(),
          'content1': $('#totext').val()
        });
        websocket.stompClient.send('/receiveto', {}, msg);

        // 내가 보낸 메시지 (오른쪽 정렬)
        $("#to").append(
                "<div class='message my-message'>" +
                "<span style='color: blue;'>나:</span> " + $('#totext').val() +
                "</div>"
        );
        $('#totext').val(''); // 입력란 초기화
      });

      websocket.stompClient.connect({}, function(frame) {
        websocket.setConnected(true);
        console.log('Connected: ' + frame);

        websocket.stompClient.subscribe('/send/to/' + websocket.id, function(msg) {
          let data = JSON.parse(msg.body);

          // 상대방이 보낸 메시지 (왼쪽 정렬)
          $("#to").append(
                  "<div class='message other-message'>" +
                  "<span style='color: green;'>" + data.sendid + ":</span> " +
                  data.content1 +
                  "</div>"
          );
        });
      });
    },
    connect:function(){
      let sid = this.id;
      let socket = new SockJS('${serverurl}/ws');//웹 소켓에 접속. serverurl은 mainController websocket에 의해 ..
      this.stompClient = Stomp.over(socket);

      this.stompClient.connect({}, function(frame) {//connect 함수실행되면서 connect이루어지고,
        websocket.setConnected(true);
        console.log('Connected: ' + frame);
        this.subscribe('/send/to/'+sid, function(msg) {
          $("#to").append(
                  "<h4>" + JSON.parse(msg.body).sendid +":"+
                  JSON.parse(msg.body).content1
                  + "</h4>");
        });
      });
    },
    disconnect:function(){
      if (this.stompClient !== null) {
        this.stompClient.disconnect();
      }
      websocket.setConnected(false);
      console.log("Disconnected");
    },
    setConnected:function(connected){
      if (connected) {
        $("#status").text("Connected");
      } else {
        $("#status").text("Disconnected");
      }
    }
  };
  $(function(){
    websocket.init();
  });
</script>






<div class="container-fluid">

  <div class="btn-group">
    <button type="button" class="btn"
            onclick="location.href='<c:url value="/qna"/>'"
            style="background-color: white; color: black; border: 1px solid #ccc;">문의</button>
    <button type="button" class="btn"
            onclick="location.href='<c:url value="/qna/reservation"/>'"
            style="background-color: white; color: black; border: 1px solid #ccc;">예약</button>
    <button type="button" class="btn"
            onclick="location.href='<c:url value="/qna/history"/>'"
            style="background-color: white; color: black; border: 1px solid #ccc;">나의 예약내역</button>
  </div>

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
          <h1 id="adm_id">${sessionScope.loginid.custId}</h1>
          <H1 id="status">Status</H1>
          <button id="connect">Connect</button>
          <button id="disconnect">Disconnect</button>

          <h3>To</h3>
          <input type="text" id="target" value="admin1">
          <input type="text" id="totext"><button id="sendto">Send</button>
          <div id="to"></div>

        </div>
      </div>
    </div>
  </div>

</div>



