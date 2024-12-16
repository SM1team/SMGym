<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Webcam Stream and QR Scan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #000000;
            font-family: Arial, sans-serif;
        }

        .scanner-container {
            background: #1a1a1a;
            border: 1px solid #1a1a1a;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
        }

        .scanner-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #343a40;
        }

        #myVideo {
            border: 4px solid #ae00c7;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
        }

        .scanner-button {
            background-color: #ae00c7;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin: 5px;
        }

        .scanner-button:hover {
            background-color: #800080;
        }

        .scanner-border {
            position: relative;
            width: 400px;
            height: 300px;
            margin: 0 auto 20px;
            border: 6px solid transparent;
            border-image: linear-gradient(45deg, #ae00c7, #ae00c7);
            border-image-slice: 1;
            border-radius: 12px;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .scanner-border::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: 2px solid rgba(255, 255, 255, 0.6);
            pointer-events: none;
        }

        .scanner-border .scanner-overlay {
            position: absolute;
            width: 80%;
            height: 80%;
            border: 2px dashed rgba(0, 0, 0, 0.5);
            pointer-events: none;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/jsqr/dist/jsQR.js"></script>
    <script>
        const webcam = {
            myVideoStream: null,
            myCanvas: null,
            stream: null,

            // 초기화
            init: function () {
                this.myVideoStream = document.querySelector('#myVideo');
                this.myCanvas = document.createElement('canvas');
            },

            // 카메라 스트림 가져오기
            getVideo: function () {
                navigator.mediaDevices.getUserMedia({ video: true, audio: false })
                    .then((stream) => {
                        this.stream = stream;
                        this.myVideoStream.srcObject = stream;
                        this.myVideoStream.play();
                        this.scanQRCode();
                    })
                    .catch((error) => {
                        alert('Webcam not working');
                    });
            },

            // 카메라 스트림 중지
            stopVideo: function () {
                if (this.stream) {
                    const tracks = this.stream.getTracks();
                    tracks.forEach(track => track.stop());
                    this.myVideoStream.pause();
                    this.myVideoStream.srcObject = null;
                    this.stream = null;
                }
            },

            // QR 코드 스캔 처리
            scanQRCode: function () {
                const context = this.myCanvas.getContext('2d');
                const videoElement = this.myVideoStream;

                const scan = () => {
                    if (!this.stream) return; // Stop scanning if video is stopped

                    context.drawImage(videoElement, 0, 0, this.myCanvas.width, this.myCanvas.height);
                    const imageData = context.getImageData(0, 0, this.myCanvas.width, this.myCanvas.height);
                    const code = jsQR(imageData.data, this.myCanvas.width, this.myCanvas.height);

                    if (code) {
                        const data = code.data;
                        alert("QR SUCCESS: " + data);
                        this.sendAttendanceData(data);
                    }
                };

                setInterval(scan, 3000);
            },

            // 출석 데이터 서버로 전송
            sendAttendanceData: function (qrData) {
                const custId = qrData.split('=')[1];
                const now = new Date();
                const scanTime = now.toISOString();

                const payload = {
                    custId: custId,
                    scanTime: scanTime
                };

                fetch('/check/checkin', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(payload)
                })
                    .then(response => response.json())
                    .then(data => {
                        alert(data.message);
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert("Error occurred");
                    });
            }
        };

        window.onload = function () {
            webcam.init();
        };
    </script>
</head>
<body>
<div class="scanner-container">
    <div class="scanner-title" style="color: #ae00c7">QR CHECKIN</div>
    <div class="scanner-border">
        <video id="myVideo" width="400" height="300"></video>
        <div class="scanner-overlay"></div>
    </div>
    <button class="scanner-button" onclick="webcam.getVideo();">Start Webcam</button>
    <button class="scanner-button" onclick="webcam.stopVideo();">Stop Webcam</button>
</div>
</body>
</html>
