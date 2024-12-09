<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
  // 페이지 로드 후 화면을 중간으로 이동
  window.onload = function() {
    // 페이지 높이의 50% 위치로 스크롤
    const middlePosition = document.body.scrollHeight / 2.7;
    window.scrollTo({
      top: middlePosition,
      behavior: "smooth" // 부드러운 스크롤 효과
    });
  };
</script>
<style>
  body{
    background-color: #000000;
  }
  /* 채팅창 전체 스타일 */
  #to {
    width: 100%;
    height: 350px;
    overflow-y: scroll;
    padding: 20px;
    background-color: #1a1a1a;
    border-radius: 10px;
    border: 2px solid #ae00c7;
    margin-bottom: 15px;
    box-sizing: border-box;
  }

  /* 메시지 박스 스타일 */
  .message {
    display: flex;
    margin: 10px 0;
    padding: 12px;
    border-radius: 15px;
    max-width: 80%;
    word-wrap: break-word;
    clear: both;
  }

  /* 내가 보낸 메시지 스타일 */
  .my-message {
    background-color: #4D4C4C;
    color: white;
    margin-left: auto;
    align-self: flex-end;
    border-radius: 20px 20px 0 20px; /* 둥근 말풍선 */
    max-width: 70%;
    padding: 12px 18px;
  }

  /* 상대방이 보낸 메시지 스타일 */
  .other-message {
    background-color: #e9ecef;
    color: black;
    align-self: flex-start;
    border-radius: 20px 20px 20px 0; /* 둥근 말풍선 */
    max-width: 70%;
    padding: 12px 18px;
  }

  /* 사용자 정보 (사진과 이름) */
  .message .user-info {
    margin-right: 10px;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }

  .message img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    object-fit: cover;
  }

  .message .username {
    font-size: 0.85em;
    color: #333;
  }

  /* 입력창과 전송 버튼 스타일 */
  .input-area {
    display: flex;
    align-items: center;
    border-top: 1px solid #e0e0e0;
    padding-top: 15px;
  }

  #totext {
    width: 85%;
    padding: 10px;
    border-radius: 20px;
    border: 1px solid #e0e0e0;
    margin-right: 10px;
    font-size: 1em;
    outline: none;
  }

  #sendto {
    padding: 12px 20px;
    background-color: #ae00c7;
    color: white;
    border: none;
    border-radius: 20px;
    cursor: pointer;
    font-size: 1em;
  }

  #sendto:hover {
    background-color: #85009e;
  }

  /* 사용자 이름 및 메시지의 타이밍 */
  .message-time {
    font-size: 0.75em;
    color: #999;
    margin-top: 5px;
  }

  /* 부모 컨테이너: 화면 가운데 정렬 */
  .container-fluid {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%; /* 화면의 높이를 100%로 설정 */
  }

  /* 채팅창 영역 스타일 */
  .col-sm-5 {
    width: 100%;
    max-width: 500px; /* 채팅창의 최대 너비 설정 */
    box-sizing: border-box;
    padding: 20px;
    background-color: #1a1a1a;
    border-radius: 10px;
    border: 2px solid #ae00c7;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }

  /* 채팅 헤더 스타일 */
  .chat-header {
    background-color: #1a1a1a; /* 전송 버튼과 동일한 색상 */
    color: white; /* 텍스트 색상을 흰색으로 */
    padding: 12px 20px; /* 상하 좌우 패딩 */
    border-radius: 20px; /* 둥근 모서리 */
    text-align: center; /* 가운데 정렬 */
    font-size: 1.2em; /* 글자 크기 */
    margin-bottom: 15px; /* 아래쪽 여백 */
    border: 2px solid #ae00c7;
  }

  /* 버튼 그룹 스타일 */
  .btn-group {
    width: 30%;
    display: flex;
    justify-content: space-between;
    margin: 0 auto; /* 가로로 중앙 정렬 */
    margin-bottom: 15px;
    box-sizing: border-box;
  }

  .btn1 {

    width: 30%;  /* 버튼 너비 설정 */
    margin: 0 5px; /* 버튼 간격 설정 */

    padding: 12px 20px;
    background-color: #1a1a1a;
    color: white;
    border-color : #ae00c7;
    border-radius: 20px;
    cursor: pointer;
    font-size: 1em;
    font-weight: bolder;
  }

  /* 버튼 그룹 스타일 */
  .btn-group {
    width: 30%;
    display: flex;
    justify-content: space-between;
    margin: 0 auto; /* 가로로 중앙 정렬 */
    margin-bottom: 15px;
    box-sizing: border-box;
  }

  .btn1 {

    width: 30%;  /* 버튼 너비 설정 */
    margin: 0 5px; /* 버튼 간격 설정 */

    padding: 12px 20px;
    background-color: #ae00c7;
    color: white;
    border: none;
    border-radius: 20px;
    cursor: pointer;
    font-size: 1em;
    font-weight: bolder;
  }
  .btn1:hover {
    background-color: #85009e;
  }
  .btn2 {

    width: 30%;  /* 버튼 너비 설정 */
    margin: 0 5px; /* 버튼 간격 설정 */

    padding: 12px 20px;
    background-color: #ae00c7;
    color: white;
    border: none;
    border-radius: 20px;
    cursor: pointer;
    font-size: 1em;
    font-weight: bolder;
  }
  .btn2:hover {
    background-color: #85009e;
  }
  .btn3 {

    width: 30%;  /* 버튼 너비 설정 */
    margin: 0 5px; /* 버튼 간격 설정 */

    padding: 12px 20px;
    background-color: #ae00c7;
    color: white;
    border: none;
    border-radius: 20px;
    cursor: pointer;
    font-size: 1em;
    font-weight: bolder;
  }
  .btn3:hover {
    background-color: #85009e;
  }

</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>

<script>
  let websocket = {
    id: '',
    stompClient: null,
    init: function () {
      this.id = $('#adm_id').text();

      // 바로 WebSocket 연결
      this.connect();

      $('#connect').click(() => {
        this.connect();
      });

      $('#disconnect').click(() => {
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
                "<span style='color: blue;'></span> " + $('#totext').val() +
                "</div>"
        );
        $('#totext').val(''); // 입력란 초기화
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
          let data = JSON.parse(msg.body);

          // 상대방이 보낸 메시지 (왼쪽 정렬)
          $("#to").append(
                  "<div class='message other-message'>" +
                  "<span style='color: green;'></span> " +
                  data.content1 +
                  "</div>"
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
    websocket.init(); // 페이지 로드 시 자동 연결
  });
</script>

<div class="row" style="background-color: #000; height: 50px;"></div>
<div class="btn-group">
  <button type="button" class="btn1"
          onclick="location.href='<c:url value="/qna"/>'">문의</button>
  <button type="button" class="btn2"
          onclick="location.href='<c:url value="/qna/reservation"/>'">예약</button>
  <button type="button" class="btn3"
          onclick="location.href='<c:url value="/qna/history"/>'">나의 예약내역</button>
</div>
  <!-- 버튼 그룹을 세로로 배치 -->
  <!-- 버튼 그룹을 채팅창 위에 가로로 배치 -->



<div class="container-fluid">
  <div class="col-sm-5">
    <h6 id="adm_id" class="chat-header">${sessionScope.loginid.custId}</h6>

    <input type="text" id="target" value="admin1" style="display:none;">
    <div id="to"></div>

    <div class="input-area">
      <input type="text" id="totext" placeholder="Type your message...">
      <button id="sendto">Send</button>
    </div>
  </div>
</div>

