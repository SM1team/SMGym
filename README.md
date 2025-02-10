# 2024몰입형SW팀프로젝트 1팀 SM-GYM 🏋️‍♂️

PL (Project Leader) : 곽인성 <br>

Front&Back DEV : 박주민, 황민우, 고윤재  
기간: 2024.11.10~2024.12.24  
<br>

💿[웹 시연영상](https://youtu.be/11111111111)  

🔗[노션 링크][(https://www.notion.so/246758c62a5b4e728cd50f89d021ba07?v=78f471175d4a49ea93b0195f26fa602a&pvs=4)](https://www.notion.so/2024-SW-12ea3b9e4551807eb729dfcc03fff17b)  

<br>

![image](https://github.com/user-attachments/assets/2037eff7-ee50-4f31-9c93-8f3e84f7cb17)


<br>

# 1. 프로젝트 주제 및 기획의도

 ### 주제❗

**    트레이너와 사용자가 상호작용하며 효율적으로 피트니스 활동을 지원하는 피트니스 웹 서비스 개발**


 ### 기획의도 및 주요목적❗️
 
**1.관리자 중심의 매출 데이터 시각화 지원**
판매 데이터를 기반으로 한 정교한 통계 및 매출 차트를 통해, 관리자가 데이터를 한눈에 파악하고 체계적이며 효율적인 세일즈 전략을 수립할 수 있도록 지원합니다.

**2.개인 맞춤형 건강 데이터 통합 관리**
회원의 운동 기록, 식단 계획, 목표 설정 등을 체계적으로 관리하여, 보다 정교하고 개인화된 피트니스 경험을 제공하고, 지속 가능한 건강 관리 솔루션을 구현합니다.

**3.온라인 피드백 및 실시간 상호작용 강화**
회원과 트레이너 간의 실시간 채팅 및 피드백 시스템을 도입하여, 비대면 환경에서도 전문적인 조언과 고도화된 상호작용을 제공하며 만족스러운 피트니스 경험을 지원합니다.

**4.QR 코드 센서를 활용한 출석 및 실시간 기구 상태 관리**
QR 코드 센서를 통해 회원의 출석을 자동으로 기록하며, 운동기구에 설치된 QR 센서를 통해 현재 사용 중이거나 대기 중인 기구의 상태를 실시간으로 확인할 수 있는 기능을 제공합니다.

**5.스마트한 피트니스 환경 조성**
데이터 기반의 통합 관리와 첨단 기술을 활용하여 회원과 관리자가 모두 만족할 수 있는 스마트하고 효율적인 피트니스 환경을 조성합니다.


<br><br>

# 2. 프로젝트 개요
### ✨프로젝트 계획도  

***

### ✨USER-FLOW
![image](https://github.com/user-attachments/assets/5559f542-2ae5-437c-82be-3d9450330c56)



***

### ✨ADMIN-FLOW
![image](https://github.com/user-attachments/assets/e57ea894-2978-41a5-9f28-faea2acfdc2d)



***

### ✨시스템 구성도
![image](https://github.com/user-attachments/assets/6d6af75d-96fb-45d5-9ee3-041112d8ac2f)



***  
  
### ✨로드밸런싱 구성도
<br>

![스크린샷 2023-02-15 오후 2 57 32](https://user-images.githubusercontent.com/115512265/218944883-b72bdf5f-9547-41a9-825e-41b089673117.png)


***

### ✨DB 설계
<br>

**🔗[ERD 보러가기](https://www.erdcloud.com/d/bHWFLdMGJ9n9cqBnA)**  

![ERD](https://github.com/SM1team/SMGym/blob/main/erd.png).

***

### ✨WBS  
<br>

**🔗[WBS 보러가기][(https://docs.google.com/spreadsheets/d/10XEy3CGtHanto6_02__epn6dyyra8y609xpw5IACge8/edit?usp=share_link)](https://docs.google.com/spreadsheets/d/1aBiMceFBWgk4G_PaUQ91IMN7DcHUL00PPaj56Venu3o/edit?usp=sharing)**  
  
  
![image](https://github.com/user-attachments/assets/fc2977ad-225e-482b-8818-0855af6c063a)



***

### ✨개발 환경 및 수행 도구
![image](https://github.com/user-attachments/assets/64e05e19-2880-4ecf-ae0f-4bca9b0715e0)

![image](https://github.com/user-attachments/assets/fe1098b6-8b15-4c7c-b3c4-ba608155618b)




***

<br><br>


# 3. 프로젝트 역할분담 👥

|이름|역할|
|--|--| 
|곽인성|관리자 모듈 화면 대시보드 설계 및 구축<br>사용자 로그인 회원가입 페이지 기능 구현<br>로그인 세션 기록 저장 기능<br>관리자,사용자 모듈 별 QR생성및 페이징 처리<br>관리자, 사용자 모듈별 webcam 페이징 처리 관리자, <br>사용자 모듈별 webcam을 이용한 QR스캔 출/퇴실 처리<br>카카오 map API 제작<br>관리자 모듈 ROLE에 따른 페이징 처리<br>관리자,사용자 모듈 PT CRUD및 상세 페이지 구현<br>관리자 모듈 예약 관리 페이징 처리,구현<br>문의 페이지 websocket을 활용한 1:1채팅 구현<br>예약,예약내역 CRUD 및 페이징 구현<br>관리자 회원 및 트레이너 CRUD 및 페이징 구현<br>관리자 모듈 AJAX 통계차트 페이지 구현(출석,성별,매출,기구상태등)<br>헬스장 운동기구 DB 연동 및 비동기 처리<br>운동 기록 CRUD 및 상세 페이지 구현<br>마이페이지 기능 구현 및 디자인 (회원정보 수정, 결제 목록, 운동 기록, 출석 기록)<br>관리자,사용자 모듈별 출석관리 CRUD 및 페이징 구현<br>관리자,사용자 모듈별 출석 페이지 data 시각화|  
|박주민|사용자 모듈 설계 및 구축<br>사용자 UI/UX 구성<br>사용자 페이지 앵커 링크 구현<br>사용자 로그인 회원가입 페이지 UI 구현<br>관리자 대시보드 공지사항 바로가기 기능 구현<br>공지사항 CRUD 및 페이징 처리<br>자유게시판 CRUD 및 페이징 처리<br>트레이너 & 사용자 각 페이지 로그인 세션 기록 기능<br>게시물 제목으로 검색 기능 구현<br>게시판 댓글 수정 및 삭제 기능 구현<br>헬스장 단면도 UI디자인<br>운동기구별 반응형 툴팁 기능 적용<br>헬스장 운동기구 DB 연동 및 비동기 처리|  
|황민우|사용자 모듈 각 화면 페이지 UI/UX 디자인 총괄<br>각 트레이너 프로필 화면 구성<br>상품 및 결제 화면 디자인<br>공지사항 페이지 디자인<br>자유게시판 페이지 디자인<br>카카오 map API 제작<br>MySQL DB 테이블 구축<br>아임포트 카카오페이 결제 API 구현 및 결제 완료 페이지 구현<br>관리자 상품 판매 기록 페이지 구현<br>관리자 모듈 AJAX 통계 및 매출 차트 페이지 구현<br>마이페이지 기능 구현 및 디자인 (회원정보 수정, 결제 목록, 운동 기록, 출석 기록)|  
|고윤재|운동 기록 CRUD 및 상세 페이지 구현<br>관리자 모듈 설계 및 구축<br>관리자 UI/UX 구성<br>관리자 앵커 링크 구현|

  

<br><br>

# 4. 프로젝트 핵심 기능 ✅

## 사용자 페이지 😃  
  
### 1) QR코드 (QR 코드) 
- QR코드를 이용하여  WEBCAM으로 사용자의 스마트폰 내 QR코드를 인식하고 각 회원을 식별하여 사용자의 입실 퇴실 기록을 저장
  ![qrcode](https://github.com/user-attachments/assets/c17c30e4-61ec-46bf-9e51-56362191efa6)

- 각 운동 기구 QR 센서와 사용자의 스마트폰을 연동해 운동기록을 저장해주고 헬스장 FLOWMAP 페이지에서 대기/사용중인 운동기구를 실시간으로 확인가능
![checkout](https://github.com/user-attachments/assets/448577f0-ce3b-4d6f-8ff4-f23b05d0769d)


***

<br><br>

### 2) 지도 (카카오 지도 Api)
- 각 헬스장의 위치를 카카오 지도 Api를 사용하여 각 지점마다 마커를 표시 
![map](https://github.com/user-attachments/assets/046f760a-7fbe-459f-be08-b290afc4d1c2)

- 지점 헬스장 이미지 클릭 시 해당 헬스장의 정확한 위치 정보 표시
![map2](https://github.com/user-attachments/assets/4db1b03d-ee3d-4f98-8911-2b6a0020169a)


***
<br><br>


### 3) 플로어 맵
- 마우스 커서 이동 시, 각 기구의 자세한 정보를 알 수 있음
  ![floorr](https://github.com/user-attachments/assets/b5b4fe66-9733-410d-bfc1-5733d16060a0)
- 다국어 번역 기능을 지원
![lan](https://github.com/user-attachments/assets/dfa56c42-eedf-4c00-bb0e-6498aea154de)
- 운동 기구의 실시간 사용을 알 수 있음
![imm](https://github.com/user-attachments/assets/f18fd3cc-5836-4514-a72f-ab47966eb461)
![chanimm](https://github.com/user-attachments/assets/00ec8dd4-8e6d-453e-b8f1-30dbff046113)

***
<br><br>

### 4) 출석
- 월별 출석률을 확인할 수 있음
![month](https://github.com/user-attachments/assets/296c8159-92c9-4938-8c65-8960cf55f6e9)
- 출석 체크인/체크 아웃 시간을 확인할 수 있음      
![checkinoutlog](https://github.com/user-attachments/assets/732cb428-44bb-448a-86eb-8d9b760a7daa)
- 검색을 통해 날짜를 찾아볼 수 있음
![searchcheckout](https://github.com/user-attachments/assets/bea65397-b3a6-4d18-963f-11fc7fca9d18)



***
<br><br>


### 5) 상품 결제 (카카오 결제 API)
- 카카오 Pay Api를 이용하여 QR코드 결제, 카카오 ID 결제등 다양한 결제 방안 제시
![payapi](https://github.com/user-attachments/assets/4529b0bc-f15c-4d8c-8aa2-537a78b8cc71)
![payapi2](https://github.com/user-attachments/assets/f96df512-75d5-454a-96e2-217d702e7072)


***
<br><br>


### 6) 1:1 채팅
- 1:1 채팅을 통해 관리자와 소통을 할 수 있음
![1_1chat](https://github.com/user-attachments/assets/3d61fb4e-d89d-4b1c-9f02-53796688d8bd)
![1_1chatt](https://github.com/user-attachments/assets/3ddd1e26-0a7e-4180-8510-035c07401be7)


***
<br><br>



## 관리자 페이지 🧐
### 1) 실시간 통계
- 당일 시간대별 실시간 데이터와 누적 데이터 표시
- Jquery를 활용한 AJAX 통신 구
- JAVA의 Date 객체를 활용하여 서버 기준 현재 시간으로 설정, 데이터는 JSON형태로 전달받아 처리 
- 일별 방문자 수, 이용중인 회원 수, 사용 중인 운동 기구 수 데이터 표시
![admain](https://github.com/user-attachments/assets/d9331ef1-ca40-4f27-8a4e-15df87dee39e)





***
<br><br>


### 2) 성별/월/나별 통계
- 월별 매출 통계, 성별 매출 통계, 나이대별 매출 통계 등 정보 확인 가능
- 정규식을 이용하여 금액 3자리 마다 컴마(,)를 통해 관리자가 쉽게 파악
- 1일, 31일/1월, 12월 등 월 또는 년도가 바뀌는 시기에는 그에 맞춰 날짜가 변경되게 구현
![adcal](https://github.com/user-attachments/assets/c28d28ef-9aff-4e84-9f31-8fd560270ec7)



***
<br><br>


## ✨서브 기술   


### 1) QR 코드 ( QR code) 

-트레이너에게 고유한 QR 코드를 부여하여 출퇴근 시간을 기록
-QR 코드 스캔 시 현재 시간을 기준으로 출근 또는 퇴근 기록 생성
-스캔한 QR 코드를 서버에서 인증하고, DB에 해당 기록 저장
-QR 코드 스캔 실패나 잘못된 코드 입력 시 오류 메시지를 제공하여 데이터 정확성 보장
![image](https://github.com/user-attachments/assets/00fb47f3-793b-4135-b9f6-912337afb2b2)
![adtrainerqrcheckin](https://github.com/user-attachments/assets/9986fa4d-1771-4390-98d5-cbd7b8087871)
![adqrcheckout](https://github.com/user-attachments/assets/81c9191f-4b2e-4bfe-b4bd-b34f88d5268e)



### 2) 암호화(Bcrypt)
- Bcrypt 암호화를 통해 사용자의 비밀번호를 암호화하여 DB에 저장 
![Bcrypt](https://user-images.githubusercontent.com/117332944/218469822-ab092b85-7b05-46d5-8e48-383963fbd8f3.png)  
![bcrypt_db_sql](https://user-images.githubusercontent.com/117332944/218470004-facf7933-fb91-47bd-b6ef-8849f71656c0.png)  
- 사용자가 입력한 비밀번호를 Bcrypt hash algorithm 적용 후 DB에 저장된 암호와 match하여 확인  
- Bcrypt hash algorithm 적용 시 임의의 salt를 생성하기 때문에 같은 입력값에 대해서 매번 다른 결과를 반환하여 강력한 보안 가능  


***
<br><br>


### 3) 로그인 인터셉터(Interceptor)
- 로그인한 사용자의 권한에 따른 지정된 페이지만 볼 수 있도록 일부 페이지들에 대한 접근을 막음   
- 세션을 통해 로그인 여부를 체크해서 로그인하지 않은 트레이너는 로그인 폼으로 보냄 
![image](https://user-images.githubusercontent.com/110235270/218664894-b87fa846-3b1b-432a-bb68-8bfc58a72977.png)
![adlogin](https://github.com/user-attachments/assets/51423622-a50c-476b-84be-7edb045703ab)
![adlogin2](https://github.com/user-attachments/assets/e9100701-98be-4dd8-b150-1bb57213a7a8)


***
<br><br>



# **일반 기능** ✅

## 사용자 페이지 😃

### 1)  메인(시작)페이지    
   	      
   **트레이너 소개**
![trainer](https://github.com/user-attachments/assets/5ac62947-9d09-48a8-aabf-5dc4bdcd6174)

   
        
   **헬스장 위치 소개**
 ![map](https://github.com/user-attachments/assets/e3025486-5aa2-46ac-8432-1fb17183672f)

***
<br><br>

### 2) 마이페이지

 **QR코드 생성 페이지**  
 **QR코드 출/퇴근 기록 페이지** 
 **운동 일지 페이지**  
 **구매 목록 페이지**

![image](https://github.com/user-attachments/assets/d61550bc-fa3e-4ad0-98f8-eed7560c55fb)


<br><br>


### 3) 헬스장 플로우 맵 (단면도 페이지)
  **헬스장 단면도**
![floorr](https://github.com/user-attachments/assets/9cf916b0-6e1d-4cc0-aaff-cf6079caeac4)


### 4) 상품 페이지 

  **구매 페이지**
      ![payapi](https://github.com/user-attachments/assets/9562563d-e180-49b8-966b-a45a46492a87)

**결제완료 페이지**
![payapi2](https://github.com/user-attachments/assets/e194f07a-3869-49f0-ba95-a3278508a7f7)

### 5) 게시판 페이지

**공지사항**
![board](https://github.com/user-attachments/assets/2db3a941-8c9e-4505-9f04-59d9d8dbef1a)

**자유게시판**
![searchcommu](https://github.com/user-attachments/assets/93e6054b-9b3d-48b1-99be-8447336883ba)

### 6) 문의&예약 페이지

   **1:1 채팅 페이지**

  **문의 내역 페이지**

   **예약 내역 페이지**

![image](https://github.com/user-attachments/assets/cf78cfb7-2fc7-4632-9de6-2d93a737fd8c)


***
<br><br><br>


## 관리자 페이지 🧐

### 1) 예약 관리  
- 사용자 페이지에서 예약 신청 시, 관리자 페이지에서 예약 상태를 변경 가능
- ![adreserva](https://github.com/user-attachments/assets/8928be57-cd1f-4960-89cd-7b6803525bb1)

- 변경 시 예약 중 -> 예약 완료 로 변경
![image](https://user-images.githubusercontent.com/117332944/218489047-f4afb805-8e16-4e31-9519-94ff35b0d414.png)


***
<br><br>


### 2) 트레이너 관리
- 트레이너 조회, 삭제 기능
- 트레이너 출결 또한 관리 및 조회 가능
 
![adtrainer](https://github.com/user-attachments/assets/bd2f289e-449e-4ff0-9d15-5cb72eb8f72c)
![adtraineradd](https://github.com/user-attachments/assets/866c255d-06b3-4e9c-85a1-9df20a6f670f)
![adtrainerdel](https://github.com/user-attachments/assets/e936398c-bef0-4cb1-b590-13ed09dce108)
![adtrainercheck](https://github.com/user-attachments/assets/c825ce6b-5c64-4af6-88ec-1548f40cc4ac)



***
<br><br>


### 3) 공지 관리
- 공지사항 추가/삭제 가능
- 관리자가 작성한 공지사항은 사용자 페이지에서 볼 수 있음
![adnotice](https://github.com/user-attachments/assets/e4c04c0b-50d2-4606-8b37-2ec6ec66b3b7)
![adnoticedel](https://github.com/user-attachments/assets/516ac720-4c9d-4509-867a-22bd45210378)
![userpage](https://github.com/user-attachments/assets/2aa434ec-4513-4459-bf98-2a2049248efb)
![image](https://github.com/user-attachments/assets/2883fc97-ea5e-4094-bb0c-cb8416a8d1fe)


***
<br><br>


### 4) 1:1 문의 관리
- 사용자와 관리자가 일대일로 상담을 진행 가능
- websocket을 활용하여 채팅 기능 구현

![ad1_1chat](https://github.com/user-attachments/assets/b91cfc21-12ea-45c1-80cc-1860ce2a6ab4)


***
<br><br>



### 5) PT 관리
- 트레이너는 본인이 관리하는 회원을 관리
- 일지를 통해 회원에게 공지 또는 수업 내용 전달
![adptpage](https://github.com/user-attachments/assets/c66aa117-5ad3-49d0-a2df-5fc5a1ea3312)
![adptupdate](https://github.com/user-attachments/assets/cc7844bc-7cce-4575-87fe-8460a43c388f)
![adptshare](https://github.com/user-attachments/assets/b80bde87-a9f4-47fe-9118-e99c6c68d9d0)

***
<br><br>


## 6. Troubleshooting ⁉️

|&nbsp;&nbsp;Name&nbsp;&nbsp;|Issues|Problem solving|
|:--:|--|--|
|황민우|⦁ 문제점1: 로그인 여부를 확인하는 함수에서 로그인 값을 판별하는 코드 오류가 발생함<br><br>⦁ 문제점2: 트레이너 선택 폼이 항상 표시되는 문제 : 상품명에'헬스'가 포함되어 있으면 트레이너 선택 폼이 숨겨져야 하지만 로드될 때 트레이너 선택 폼이 숨겨지지 않는 문제가 발생함<br><br>⦁ 문제점3: 금액 포멧 변환 시 productPrice를 ParseInt로 변환할 때 금액 문자열의 형식이 예상과 다르면 오류가 발생함|⦁ 솔루션1: 자바스크립트에서 서버 값이 안전하게 전달되도록 문자열로 감싸 처리함 , 서버 사이드 값을 명확히 체크하도록 수정함<br><br>⦁ 솔루션2: window.onload 대신 DomcontentLoaded 이벤트를 사용하여 HTML이 모두 파싱된 후에 스크리트를 수행하도록  수정함 <br><br>⦁ 솔루션3: replace()를 통해 모든 불필요한 문자를 제거하는 로직이 필요함 -> 정규식을 사용하여 문자열에서숫자만 추출하도록 개선함| 
|박주민|⦁ 문제점1: 운동기구 상태 업데이트 시 오류 발생 : 페이지 로드 후 운동기구 상태를 업데이트하는 과정에서 콘솔에 다음과 같은 오류가 발생 TypeError : Cannot read property 'style' of null 이로 인해 운동기구 상태가 업데이트 되지 않음<br><br>⦁ 문제점2: 운동기구 클릭 이벤트가 동작하지 않음 :ㅣ클릭했을때 알림창 상태가 정상적으로 동작하지 않음   <br><br>⦁ 문제점3: 게시물 목록 이미지가 표시되지 않는 문제 : 게시판 목록에서 이미지가 표시되지 않으면서 오류가 발생  <br><br>|⦁ 솔루션1: 요소 존재 여부를 확인하고 lightElement가 null 인지 확인한 뒤 속성 접근을 시도한다 HTML 구조를 검증하고 .equipment 내부에 .light 클래스가 올바르게 추가되었는지 확인 및 수정.<br><br>⦁솔루션2: 이벤트 리스너 중복을 방지하고 html내부 속성을 확인해봄, 폼 기본 동작을 차단하여 onsubmit 에서 이벤트 객체를 사용해 기본제출 동작을 차단하였다<br><br> ⦁ 솔루션3: 이미지 경로를 검증하여 데이터베이스에 저장된 이미지 경로 값을 점검하고 올바르게 저장되도록 수정한다 또 이미지 존재 여부를 확인하여 이밎 파일이 서버에 실제로 존재하는지 확인하고 누락된 경우 재업로드를 하고 JSP 조건문을 수정하여 이미지 경로가 존재하지 않을 경우 기본 이미지를 표시하거나 이미지 태그를 출력하지 않도록 수정하였다.| 
|곽인성|⦁ 문제점1: QR 코드가 인식되지 않음 : QR 코드가 카메라에 명확히 미춰졌음에도 불구하고 QR코드 인식 성공 메시지가 표시되지않음 <br><br>⦁ 문제점2: 출석 데이터 서버 전송 실패 : QR코드 스캔 성공 후 출석 데이터를 서버로 전송하려고 했으나 , 실패하여 다음중 하나의 문제가 발생 500 , 404 에러 <br><br> ⦁ 문제점3: 채팅 메시지가 화면에 표시 되지 않음 : 채팅 메시지를 전송했을 떄 , 상대방의 메시지가 화면에 표시되지 않음  |⦁ 솔루션1: 1)해상도 조정  : QR코드가 카메라 중앙에 명확히 보이도록 적절한 거리를 유지. 2) 캔버스 크기 초기화 canvas의 크기를 video의 크기와 동기화 3) 디버깅 로그 추가 qr코드 데이터가 정상적으로 디코딩되는지 확인,<br><br>⦁솔루션2: 1)URL확인 서버 엔드포인트 /check/checkin 이 제대로 작동하는지 확인 . 2) 데이터 검증을 통해 요청 데이터가 서버에서 요구하는 형식에 맞는지 확인 3) CORS 설정으로 서버에서 CORS 정책을 설정하거나 프록시 서버 사용<br><br> ⦁솔루션3: 1)구독 경로 확인 및 수정을 통해 서버와 클라이언트가 동일한 구독 경로를 사용하고 있는지 확인한다 . 2) JSON 데이터를 검증하여 서버에서 전송된 데이터가 JSON 형식인지 확인하고 , 필요한 필드 가 포함되어 있는지 점검한다 . 3) DOM 업데이트 코드 확인 및 개선하여 메시지를 추가하는 코드가 제대로 실행되는지 확인하고 , 화면에 제대로 추가되도록 수정하였다.| 
|고윤재|⦁문제점1: AJAX를 이용하여 JavaScript에서 변수에 값을 담으려고 하였지만, AJAX 통신 내에서만 데이터가 존재하고 AJAX 밖으로 나가면서 사라지는 현상 발생<br><br>⦁ 문제점2: RealTimeAnalyzeService(실시간 통계)에서 Java의 Date를 통해 현재 시스템의 시간을 구해서 변수로 선언하였지만 배포시 실시간으로 시간이 변하지는 않았음<br><br>⦁문제점3: 날짜별/시간별 매출 데이터를 조회하는 쿼리문을 작성했을 때 데이터가 없는 날짜/시간은 0으로 나오는 것이 아니라 레코드 자체가 존재하지 않아 데이터를 바로 사용할 수 없었음|⦁솔루션1: 'async:false'를 이용하여 변수에 담을 수 있게 통신 방식을 변경하였고, AJAX 통신 전에 전역변수로 선언해준 후 값을 전달하여 사용<br><br>⦁솔루션2: Service는 Controller에서 호출될 때마다 생성되고 사라지는 것이 아니라 @Bean으로 한 번 생성되는 것이기 때문에 Service 안에 getTime()이라는 메서드를 만들어 통계 메서드 실행 시 getTime() 메서드를 호출하여 시간 변경<br><br>⦁솔루션3: 날짜/시간에 대한 더미 테이블을 생성한 후 OUTER JOIN을 이용해 데이터가 없어도 레코드가 존재하게 설정| 
