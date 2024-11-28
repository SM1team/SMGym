<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Webcam Stream and QR Scan</title>
    <script src="https://cdn.jsdelivr.net/npm/jsqr/dist/jsQR.js"></script> <!-- jsQR 라이브러리 추가 -->
    <script>
        const webcam = {
            myVideoStream: null,
            myCanvas: null,

            // 초기화
            init: function () {
                this.myVideoStream = document.querySelector('#myVideo'); // 비디오 요소 선택
                this.myCanvas = document.createElement('canvas'); // QR 코드 스캔을 위한 캔버스 요소 생성
            },

            // 카메라 스트림 가져오기
            getVideo: function () {
                navigator.getMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;

                navigator.getMedia(
                    { video: true, audio: false },
                    (stream) => {
                        this.myVideoStream.srcObject = stream; // 비디오 스트림 연결
                        this.myVideoStream.play(); // 비디오 재생
                        this.scanQRCode(); // 비디오 시작 후 QR 코드 스캔 시작
                    },
                    (error) => {
                        alert('webcam not working'); // 오류 발생 시 알림
                    }
                );
            },

            // QR 코드 스캔 처리
            scanQRCode: function () {
                const context = this.myCanvas.getContext('2d');
                const videoElement = this.myVideoStream;

                const scan = () => {
                    // 캔버스에 비디오 프레임을 그리기
                    context.drawImage(videoElement, 0, 0, this.myCanvas.width, this.myCanvas.height);

                    // 캔버스에서 QR 코드 분석
                    const imageData = context.getImageData(0, 0, this.myCanvas.width, this.myCanvas.height);
                    const code = jsQR(imageData.data, this.myCanvas.width, this.myCanvas.height);

                    if (code) {
                        // QR 코드가 발견되면
                        const data = code.data; // QR 코드에서 추출된 데이터
                        

                        // QR 코드 스캔이 완료되었음을 사용자에게 알려주는 메시지
                        alert("QR SUCCESS" + data);

                        // custId와 scanTime을 서버로 전송
                        this.sendAttendanceData(data);
                    }
                };

                // 3초마다 한 번씩 QR 코드를 스캔
                setInterval(scan, 3000); // 3000ms = 3초마다 스캔
            }
            ,

            // 출석 데이터 서버로 전송
            sendAttendanceData: function (qrData) {
                const trainerId = qrData.split('=')[1]; // QR 코드에서 custId 추출
                const now = new Date();
                const scanTime = now.getFullYear() + "-" +
                    String(now.getMonth() + 1).padStart(2, '0') + "-" +
                    String(now.getDate()).padStart(2, '0') + "T" +
                    String(now.getHours()).padStart(2, '0') + ":" +
                    String(now.getMinutes()).padStart(2, '0') + ":" +
                    String(now.getSeconds()).padStart(2, '0');
                console.log(scanTime);

                const payload = {
                    trainerId: trainerId,
                    scanTime: scanTime
                };

                // 출석 데이터를 서버로 전송
                fetch('/check/checkin', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(payload) // JSON 형식으로 데이터 전송
                })
                    .then(response => response.json())
                    .then(data => {
                        alert(data.message); // 서버에서 반환된 메시지 표시
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert("error");

                    });
            }
        };

        // 문서 로드 후 초기화
        window.onload = function () {
            webcam.init();
        };
    </script>
</head>
<body>
<div class="col-sm-8 text-left">
    <h1>QR CHECKIN</h1>
    <hr>
    <!-- 카메라 화면을 표시할 비디오 요소 -->
    <video id="myVideo" width="400" height="300" style="border: 1px solid #ddd;"></video><br>

    <!-- 카메라를 시작하는 버튼 -->
    <input type="button" value="Start Webcam" onclick="webcam.getVideo();">
</div>
</body>
</html>
