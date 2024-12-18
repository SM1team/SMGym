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
![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/20576f3b-10ce-4452-a8b1-aadd69f62d7f/f1d363ee-af95-4cb4-8992-c3ac78643de1/image.png)
***

### ✨USER-FLOW
![image](https://github.com/user-attachments/assets/1f101cb2-0f56-4dfd-b52f-32f698105d6c)


***

### ✨ADMIN-FLOW
![image](https://github.com/user-attachments/assets/49011863-8407-4e48-9842-ffc8b038d11f)


***

### ✨시스템 구성도
![스크린샷 2024-12-18 134508](https://github.com/user-attachments/assets/824a50e9-6305-40a3-ae00-e67823a2cc66)

  
***  
  
### ✨로드밸런싱 구성도
<br>

![스크린샷 2023-02-15 오후 2 57 32](https://user-images.githubusercontent.com/115512265/218944883-b72bdf5f-9547-41a9-825e-41b089673117.png)


***

### ✨DB 설계
![밀키트 쇼핑몰](https://user-images.githubusercontent.com/117332944/218619937-f4350539-3c01-48bc-966e-7930759e1389.png)

***

### ✨WBS  
<br>

**🔗[WBS 보러가기](https://docs.google.com/spreadsheets/d/10XEy3CGtHanto6_02__epn6dyyra8y609xpw5IACge8/edit?usp=share_link)**  
  
  
![WBS](https://user-images.githubusercontent.com/114971312/219013252-c8087339-d870-40ba-beaf-fe3589e11542.JPG)


***

### ✨개발 환경 및 수행 도구
<img width="100%" alt="스크린샷 2023-02-16 오후 9 47 19" src="https://user-images.githubusercontent.com/115512265/219368819-304509f4-7cdb-40a0-ada3-29305b153e73.png">

![개발도구](https://user-images.githubusercontent.com/117332944/219248953-8078a028-2ca4-4336-b361-169071fd5538.png)


***

<br><br>


# 3. 프로젝트 역할분담 👥

|이름|역할|
|--|--| 
|곽인성|관리자 모듈 화면 대시보드 설계 및 구축<br>사용자 로그인 회원가입 페이지 기능 구현<br>로그인 세션 기록 저장 기능<br>사용자별 QR 코드 생성<br>WEBCAM QR 출퇴근 기록 로그 기능<br>카카오 map API 제작<br>예약 및 문의 페이지 1:1 JAVA WEBSOCKET 채팅 구현<br>관리자 회원 및 트레이너 CRUD 및 페이징 구현<br>관리자 모듈 AJAX 통계 및 매출 차트 페이지 구현<br>헬스장 운동기구 DB 연동 및 비동기 처리<br>운동 기록 CRUD 및 상세 페이지 구현<br>마이페이지 기능 구현 및 디자인 (회원정보 수정, 결제 목록, 운동 기록, 출석 기록)|  
|박주민|사용자 모듈 설계 및 구축<br>사용자 UI/UX 구성<br>사용자 페이지 앵커 링크 구현<br>사용자 로그인 회원가입 페이지 UI 구현<br>관리자 대시보드 공지사항 바로가기 기능 구현<br>공지사항 CRUD 및 페이징 처리<br>자유게시판 CRUD 및 페이징 처리<br>트레이너 & 사용자 각 페이지 로그인 세션 기록 기능<br>게시물 제목으로 검색 기능 구현<br>게시판 댓글 수정 및 삭제 기능 구현<br>헬스장 단면도 UI디자인<br>운동기구별 반응형 툴팁 기능 적용<br>헬스장 운동기구 DB 연동 및 비동기 처리|  
|황민우|사용자 모듈 각 화면 페이지 UI/UX 디자인 총괄<br>각 트레이너 프로필 화면 구성<br>상품 및 결제 화면 디자인<br>공지사항 페이지 디자인<br>자유게시판 페이지 디자인<br>카카오 map API 제작<br>MySQL DB 테이블 구축<br>아임포트 카카오페이 결제 API 구현 및 결제 완료 페이지 구현<br>관리자 상품 판매 기록 페이지 구현<br>관리자 모듈 AJAX 통계 및 매출 차트 페이지 구현<br>마이페이지 기능 구현 및 디자인 (회원정보 수정, 결제 목록, 운동 기록, 출석 기록)|  
|고윤재|운동 기록 CRUD 및 상세 페이지 구현|

  

<br><br>

# 4. 프로젝트 핵심 기능 ✅

## 사용자 페이지 😃  
  
### 1) QR코드 (QR 코드) 
- QR코드를 이용하여  WEBCAM으로 사용자의 스마트폰 내 QR코드를 인식하고 각 회원을 식별하여 사용자의 입실 퇴실 기록을 저장
- 각 운동 기구 QR 센서와 사용자의 스마트폰을 연동해 운동기록을 저장해주고 헬스장 FLOWMAP 페이지에서 대기/사용중인 운동기구를 실시간으로 확인가능

<img width="100%" alt="addrAddDel" src="https://user-images.githubusercontent.com/114971312/218621174-7ab664ac-6421-43d7-9c13-7f9c179c97ad.JPG"> 

  
![FINAL 시연 영상 - 4K mov_000279333-min](https://user-images.githubusercontent.com/114971312/218620626-d9855862-8de3-4535-af29-3ccf397d5224.gif)
![FINAL 시연 영상 - 4K mov_000294966](https://user-images.githubusercontent.com/114971312/218620635-8f4133c4-4c6f-4282-8c4b-0545f7a138ff.gif)

***

<br><br>

### 2) 주문/결제(I'm port)
- 기본배송지가 있을 시 해당 배송지 정보를 바로 사용할 수 있게 표시
![KakaoTalk_20230214_171948660](https://user-images.githubusercontent.com/110235270/218678776-b8563429-e718-4448-b771-d0a430e3c887.png)

- 장바구니의 데이터를 가져와서 주문할 정보 생성
- I'mport(아임포트) API를 이용하여 카드결제, 카카오결제 등 실제 결제 가능   
![import_api-min](https://user-images.githubusercontent.com/117332944/218477489-658a1227-6b80-4580-8e55-d6dba3911172.gif)

***
<br><br>

### 3) 1:1 채팅 문의(1:1 chating) 
- 카카오 로그인 API를 이용하여 소셜 로그인 구현
  →  SNS계정으로 처음 로그인을 하는 경우, 카카오 서버는 redirect url로 인증코드를 전달   
  → 클라이언트(Web)쪽에서 인증코드를 이용하여  access_token발급받은 후 서버로 전송   
  → 서버에서는 access_token을 이용하여 카카오 서버로부터 사용자 정보(이름, 이메일)를 받음   
  → 사용자정보를 db에 저장하며 로그인   
  <br>  
  ![카카오](https://user-images.githubusercontent.com/110235270/218476026-ffb0e851-fa6d-467e-98b3-cb0d7eab194b.gif)

  
***
<br><br>


### 4) 상품 상세
- 상품에 해당하는 전체 후기의 평균 평점 출력  
- 장바구니와 찜 기능 연동  
- AJAX를 활용한 후기와 문의 게시판 각각 구현(후기는 구매자만 작성 가능, CRUD, 관리자 댓글 조회)     
  
![상품상세](https://user-images.githubusercontent.com/110235270/218684829-d83985fc-407a-4901-b596-d6c05bb57df1.png)
![상품 상세 재 업로드](https://user-images.githubusercontent.com/114971312/218688929-efc6dde6-4508-448a-a0b0-8ea3957566cb.JPG)
![3](https://user-images.githubusercontent.com/114971312/218420177-53d978dd-73ec-44e6-9e9b-c39edbc7b613.JPG)


***
<br><br>


### 5) 배송 조회 (스마트택배 API)
- 스마트택배 API를 활용한 배송조회 기능
- 사용자의 주문리스트에 운송장번호를 hidden으로 넣어놔서 조회버튼을 누름과 동시에 운송장번호를 가지고 자동으로 조회가능.  

![FINAL 시연 영상 - 4K mov_000269666](https://user-images.githubusercontent.com/114971312/218614121-be281a12-920e-4300-a1c0-787884ab4116.gif)


***
<br><br>


### 6) 우편번호 검색 (카카오 우편번호 API)
- 카카오 우편번호 API를 이용하여 실제 주소를 사용할 수 있도록 구현  
  → API에서 가져온 결과를 필요한 양식으로 form 안에 들어가게 하여 DB에 저장
![daum_zipcode_api](https://user-images.githubusercontent.com/117332944/218469125-531cbb81-c9dc-40c2-b6b0-2de81232866a.gif)


***
<br><br>


## 관리자 페이지 🧐
### 1) 실시간 통계
- 당일 시간대별 실시간 데이터와 누적 데이터 표시
- Jquery를 활용한 AJAX 통신과, JS의 SET INTERVAL 함수를 활용하여 실시간 통계 구현
- JAVA의 Date 객체를 활용하여 서버 기준 현재 시간으로 설정, 데이터는 JSON형태로 전달받아 처리 
- 실시간 배송량, 판매량, 판매액, 구매확정률, 평균 판매 개수, 평균 판매 금액 데이터 표시
- 실시간 시간별 매출 차트, 전일 대비 매출차트, 인기 상품 TOP 10, 나이대 별 - 남녀 성별 판매 비율 데이터 표시

![FINAL 시연 영상 - 4K mov_000422100](https://user-images.githubusercontent.com/114971312/218614171-e06267c3-d579-4c7c-a4ba-3aab5a6bce21.gif)
![FINAL 시연 영상 - 4K mov_000541233](https://user-images.githubusercontent.com/114971312/218614241-9ca92892-de03-4421-b1c6-e3f89b65f000.gif)
  
![FINAL 시연 영상 - 4K mov_000483466](https://user-images.githubusercontent.com/114971312/218614207-61b9949d-1d25-4a4d-9faf-4affef00f508.gif)
![FINAL 시연 영상 - 4K mov_000500633](https://user-images.githubusercontent.com/114971312/218614211-80f8002d-b070-4445-9f45-7d10cb748b14.gif)
  
![FINAL 시연 영상 - 4K mov_000516266](https://user-images.githubusercontent.com/114971312/218614364-9a7946b1-1fb3-4b19-a05d-41758728c578.gif)
![FINAL 시연 영상 - 4K mov_000525566](https://user-images.githubusercontent.com/114971312/218614386-5025d45c-2e61-4ab3-b125-4c9647923c8f.gif)


***
<br><br>


### 2) 년도/월/일별 통계
- 시간별 배송량, 판매액, 판매수, 구매확정률, 인기 상품, 매출 차트 등 정보 확인 가능
- 정규식을 이용하여 금액 3자리 마다 컴마(,)를 통해 관리자가 쉽게 파악
- 날짜를 선택하여 조회버튼 클릭시 태그 value값에 선택 날짜가 문자열로 들어가게 되며 해당 태그 class에 ‘selected’가 추가됨으로써 'selected' 클래스를 가진 태그의 value값을 서버로 전송 
- 1일, 31일/1월, 12월 등 월 또는 년도가 바뀌는 시기에는 그에 맞춰 날짜가 변경되게 구현
<img width="100%" alt="addrAddDel" src="https://user-images.githubusercontent.com/110235270/218685092-d6b29b19-3ca3-4927-a9ae-a6cc2c1f9d44.gif">  



***
<br><br>


### 3) 통계 상세 검색  
- 음식카테고리별/나이대별/성별/날짜등의 조건을 중복으로 선택하여 데이터 상세 검색 가능
- 선택한 조건에 CSS 가 추가되게 하여 관리자가 쉽게 파악할 수 있도록 구현  
<img width="100%" alt="addrAddDel" src="https://user-images.githubusercontent.com/110235270/218916333-366ba6c8-aa8f-4677-be97-fa5bb16706cd.gif">  


***
<br><br>




## 🎸기타   

### 1) 로드밸런싱

- NCP 로드밸런서를 활용한 트래픽 분산 시스템 구축
- 로드밸런싱(Round Robin Algorithm)을 통해 총 3대의 서버에 트래픽 부하 분산 처리

![스크린샷 2023-02-15 오후 2 56 21](https://user-images.githubusercontent.com/115512265/218944745-56ef97c0-c34f-41da-9cb3-26eb5eed6db9.png)


***
<br><br>


### 2) 암호화(Bcrypt)
- Bcrypt 암호화를 통해 사용자의 비밀번호를 암호화하여 DB에 저장 
![Bcrypt](https://user-images.githubusercontent.com/117332944/218469822-ab092b85-7b05-46d5-8e48-383963fbd8f3.png)  
![bcrypt_db_sql](https://user-images.githubusercontent.com/117332944/218470004-facf7933-fb91-47bd-b6ef-8849f71656c0.png)  
- 사용자가 입력한 비밀번호를 Bcrypt hash algorithm 적용 후 DB에 저장된 암호와 match하여 확인  
- Bcrypt hash algorithm 적용 시 임의의 salt를 생성하기 때문에 같은 입력값에 대해서 매번 다른 결과를 반환하여 강력한 보안 가능  


***
<br><br>


### 3) 로그인 인터셉터(Interceptor)
- 로그인한 사용자만 볼 수 있도록 일부 페이지들에 대한 접근을 막음   
- 세션을 통해 로그인 여부를 체크해서 로그인하지 않은 회원은 로그인 폼으로 보냄 
![image](https://user-images.githubusercontent.com/110235270/218664894-b87fa846-3b1b-432a-bb68-8bfc58a72977.png)
 

***
<br><br>



***
<br><br>





***
<br><br>



# **일반 기능** ✅

## 사용자 페이지 😃

### 1) 메인페이지
- 상단 메뉴바와 하단 푸터를 통한 접근성 향상
- 인기상품, 신상품 노출
- 메인화면에 실시간으로 현재 팔린 제품 수와 회원수를 AJAX를 통해 노출

<img width="100%" alt="itemmanage" src="https://user-images.githubusercontent.com/115512265/218914203-62db5e24-1326-4489-9493-8c8b7651a61e.gif">
<img width="100%" alt="itemmanage" src="https://user-images.githubusercontent.com/115512265/218914231-eb5ae9ee-0dd1-4b91-b809-08aeb5f27547.gif">
<img width="100%" alt="itemmanage" src="https://user-images.githubusercontent.com/115512265/218914241-197fe814-723c-4d76-bc42-3daeee6af3eb.gif">

***
<br><br>


### 2) 로그인/회원가입
- 회원 가입 시 AJAX를 활용해 ID 중복 여부 체크 
- 회원 가입 form의 모든 항목에 대해 유효성 검사 실시
- 비밀번호 찾기 & 아이디 찾기 구현
 → 아이디 찾기 시 아이디(email)의 일부만 보여주도록 함   



![중복체크](https://user-images.githubusercontent.com/110235270/218476271-c228cde0-0fcd-4256-908b-41b731c498e1.gif)
<img width="100%" alt="itemmanage" src="https://user-images.githubusercontent.com/110235270/218756372-4b773b35-a4ff-4136-9469-fbb55ecb8352.gif"> 
<img width="100%" alt="itemmanage" src="https://user-images.githubusercontent.com/110235270/218728083-8801d773-c50a-4b25-bf3c-de33999515a6.gif"> 
***
<br><br>


### 3)  마이페이지 
- 비밀번호 변경, 찜 내역, 나의 주문/후기/문의 내역, 회원 탈퇴 기능
- 후기 및 문의 조회/수정/삭제 가능 
- 회원 탈퇴 시 회원 테이블의 signout 컬럼을 'N' -> ' Y'로 변경
 → 해당 아이디로 로그인 및 가입 불가
<img width="100%" alt="itemmanage" src="https://user-images.githubusercontent.com/110235270/218730073-6f85346b-5702-442e-ae1c-bc268d0c7f07.gif"> 
<img width="100%" alt="itemmanage" src="https://user-images.githubusercontent.com/110235270/218730078-40374225-dff5-4607-8a1a-98ae84c0869f.gif"> 


***
<br><br>


### 4)  상품리스트
- 음식 카테고리별 / 최신 등록순 / 판매량순 / 이름순 / 낮은 가격순 등 필터 및 정렬을 중복하여 적용 가능하게 구현
- 정가와 할인가가 다른 경우, 할인율 및 가격 표시  
- 페이지네이션 및 검색 기능 구현  
![1](https://user-images.githubusercontent.com/114971312/218422029-547948fc-be82-43bc-8dbd-6faf8aacc77b.JPG)
![2](https://user-images.githubusercontent.com/114971312/218421397-feb5f483-1866-41ea-8c4b-1c01dd2d4dfc.JPG)

***
<br><br>

### 5) 장바구니
- AJAX를 활용한 비동기식 요청으로 장바구니에 제품 추가 및 수정, 삭제 기능 구현
- 기존에 추가되있는 제품이면, 수량 증가
- 수량 추가 및 감소 버튼을 통해서 조절이 가능하며 직접 입력하여서 가능함.

<img width="100%" alt="cart1" src="https://user-images.githubusercontent.com/115512265/218653614-2b6e0b50-fe45-4974-a3b8-f51fcbbf142a.gif"> 

<img width="100%" alt="itemmanage" src="https://user-images.githubusercontent.com/115512265/218653642-f96cbbd5-44ca-4289-96d4-32e1a0981e91.gif"> 

<img width="100%" alt="itemmanage" src="https://user-images.githubusercontent.com/115512265/218653657-10ad8486-a6ff-4da5-ba6a-3c01b5aff79d.gif"> 

<img width="100%" alt="itemmanage" src="https://user-images.githubusercontent.com/115512265/218653664-1283d62a-8a64-40cf-89c5-c3df6e91ab5c.gif"> 



***
<br><br>


### 6) 배송지 관리  
- 팝업창을 띄워 배송지를 관리할 수 있게 구현 (배송지 선택, 기본 배송지 설정, 생성, 삭제)  
- 배송지 선택 클릭 시 부모창으로 배송지 주소를 submit하고 자식창은 닫히게 구현  
- controller에서 전달받은 배송지 리스트를 이용해 해당 사용자가 등록한 배송지가 3개 이상일 시 배송지 추가 불가능
<img width="100%" alt="addrAddDel" src="https://user-images.githubusercontent.com/117332944/218751565-6492c3fd-c0f1-4b34-aafd-d690312a517f.gif">  

***
<br><br>


### 7) 공지/이벤트/회사소개
<img width="100%" alt="itemmanage" src="https://user-images.githubusercontent.com/115512265/218750797-11f3d0e2-0962-4e3b-b345-f6ff33112b1b.gif">
- 회사소개 페이지에서 총 회원수와 팔린 제품 수를 AJAX통신을 통해 실시간으로 보여줌.

<img width="100%" alt="itemmanage" src="https://user-images.githubusercontent.com/115512265/218751070-09fa802c-4885-4f4a-a416-ee65fdde0541.gif">
- 공지/이벤트 페이지를 통해 관리자가 편하게 내용을 전달할 수 있음.


***
<br><br><br>


## 관리자 페이지 🧐

### 1) 상품 관리  
- 필터와 정렬을 중복으로 적용하여 상품 조회 가능
- 상품의 이미지 파일을 포함한 모든 요소를 등록/수정이 가능
- 중복된 파일명이 있을 경우 뒤에 숫자를 계속하여 추가하는 식으로 재귀함수로 구현 (ex: (1), (2), (3))
<img width="100%" alt="itemmanage" src="https://user-images.githubusercontent.com/117332944/218488653-8f012552-f61e-4231-b46a-d446ad49923b.gif"> 

![image](https://user-images.githubusercontent.com/117332944/218489047-f4afb805-8e16-4e31-9519-94ff35b0d414.png)

- 상품 삭제 시 실제로 데이터를 삭제하면 여러 문제가 발생할 수 있기 때문에 테이블의 'deleted' 필드를 'Y'으로 변경하게 구현


***
<br><br>


### 2) 회원 관리
- 차단된 회원 / 생년월일 순 정렬 기능  
- 이메일 / 이름 / 전화번호 검색 기능
- 차단 / 탈퇴 여부 조회와 차단 설정 기능 
![회원관리-min](https://user-images.githubusercontent.com/114971312/218416472-07d821de-5bb6-467d-b2e7-2129f09fb9c2.gif)
![차단된 회원](https://user-images.githubusercontent.com/114971312/218690751-bf6a5f65-456a-4fec-9c49-88dfad5f8f80.JPG)


***
<br><br>


### 3) 공지/이벤트 관리
- 필터와 정렬을 중복으로 적용하여 공지/이벤트 조회 가능
- 중복된 파일명이 있을 경우 뒤에 숫자를 계속하여 추가하는 식으로 재귀함수로 구현 (ex: (1), (2), (3))
<img width="100%" alt="boardmanage" src="https://user-images.githubusercontent.com/117332944/218490427-2e2e4f9a-0800-4c98-942f-335ac4cdaf40.gif"> 


***
<br><br>


### 4) 후기/문의 관리
- 검색 기능을 통해 해당 키워드에 맞는 글을 가져오도록 구현 
- 일부 선택 or 전체 선택하여 삭제 
- 문의글의 경우, 관리자가 답변을 쓸 수 있도록 댓글 입력/수정/삭제 기능 구현
<img width="100%" alt="addrAddDel" src="https://user-images.githubusercontent.com/110235270/218756207-acc460dc-eb3e-4f9e-a539-b98299fe6459.gif">  


***
<br><br>



### 5) 주문 관리


- 체크박스를 통해 상품을 원하는 만큼 선택해서 상태를 변경할 수 있음.
- 검색기능을 통해 원하는 주문내역을 볼 수 있음.
- 상세보기를 들어가면 운송장번호를 업데이트 할 수 있음 또한 관리자측에서도 배송조회는 가능.
- 사용자의 환불요청 내용을 보고 처리할 수 있음.

<img width="100%" alt="orderManage" src="https://user-images.githubusercontent.com/115512265/218656591-688fa477-1085-41c5-b595-779b48230eda.gif">


***
<br><br>


## 6. Troubleshooting ⁉️

|&nbsp;&nbsp;Name&nbsp;&nbsp;|Issues|Problem solving|
|:--:|--|--|
|곽인성|⦁ 문제점1: 상품 상세페이지 내에 문의-후기 게시판 각각 구현 시, 동기방식으로는 각 게시판이 따로 통신이 가능하도록 구현이 불가능했음<br><br>⦁ 문제점2: 로드밸런서 생성 후 클라이언트에서 요청 시에 트래픽이 안잡히는 현상, 로드밸런서 포트로 접근 시 페이지 로딩 에러 발생<br><br>⦁ 문제점3: 팝업창 실행시 JQuery에서 Uncaught ReferenceError : functionName is not defined 에러 발생|⦁ 솔루션1: 비동기 통신을 하여 해결하는 방법에 착안 -> AJAX를 이용하여 각 게시판의 데이터를 JSON객체에 담고, 각 게시판을 서버와 비동기 통신하여 해결<br><br>⦁ 솔루션2: private IP로 로드밸런서를 설정했던게 원인으로 로드밸런서 포트로 접속이 안됐고 클라이언트의 요청도 트래픽으로 잡지 못함 -> 로드밸런서의 IP를 public IP로 변경한 후 로드밸런서 포트 접속이 해결됐고 트래픽도 정상적으로 잡힘<br><br>⦁ 솔루션3: DOM 구조가 동적으로 변경될 때, JQuery는 처음 DOM 구조가 완료되고 난 뒤에 동작함 -> onclick시 실행되는 팝업창을 여는 함수를 $(document).ready 밖으로 빼내어 해결| 
|박주민|⦁ 문제점1: <br><br>⦁ 문제점2: 윈도우에서 커밋한 프로젝트를 가지고 깃허브에서 풀을 받으면 절대경로를 static이 아닌 프로젝트 파일명으로 가져오는 에러 발생 (윈도우 → 맥)   <br><br>⦁ 문제점3: MySQL Replication 구현중  Slave_IO_Running: NO 상태로 동기화가 안되는 문제가 발생함 ⇒ 원인은 여러가지로 보였음. <br><br>|⦁ 솔루션1: 인터셉터가 작동은 하는거였지만 비동기 방식인 AJAX는 무조건 호출에 의한 응답을 받아야하기에 인터셉터가 막고 다시 sendRedirect로 보내도 요청을 처리하기전 본인 갈길은 간것!        그래서 비동기 방식을 버리고 동기방식으로 서버에 요청을 보내니 인터셉터가 먹혀서 로그인 페이지로 갔다.   알고보니 비동기 방식은 요청 발생시 Object를 반환하기에 redirect가 먹지 않고 바로 success로 가버리는 과정이였음. ⇒  async를 false로 설정하여 해결..<br><br>⦁솔루션2: 해결한 방법은 프로젝트에 찌거기 데이터들이 남아있는거 같아서 경로를 불러오는데 충돌이 났다고 가정을하고 프로젝트 클린을 한번 하니까 해결이 됬음. 자세한 원인을 찾고 싶었지만 구글링 결과도 없고, 이게 스프링에서 에러가 난건지 자바 JVM에서 에러가 난건지 원인이 너무 불문명함.<br><br> ⦁ 솔루션3: 1. ncp서버에 방화벽이 접근을 제한시킬수도 있다는 생각이 들어서 방화벽의 접근제한을 해제시켜봄 ⇒ 결과는 실패 여전히 동일 2. my.cnf파일을 변경하고 난 다음에 mysql을 재시작해야 적용이 될 수 도 있을거 같다는 생각이 들었음 ⇒ 결과적으로 실패 3. NCP에서 ACG에 대한 설정이 안되있어서 발생할수도 있겠다는 생각이 들었음 ⇒ 정답…MASTER DB에 대한 IP와 PORT가 설정이 안되있어서 Slave쪽에서 접근이 안되는거 였음.| 
|황민우|⦁ 문제점1: 회원가입을 진행할 때 전화번호 입력칸에 숫자만 입력받아야 하는데 숫자 10자리+ "-" 가 입력되어도 회원가입이 정상적으로 이루어지는 문제 발생<br><br>⦁ 문제점2: 문의 및 답변을 구현하려고 할 때 org.apache.ibatis.binding.BindingException: Invalid bound statement (not found): com.shop.mapper.CommentsMapper.qnaReply 오류 발생 <br><br> ⦁ 문제점3: 해당 태그에서 이벤트 발생시 해당 태그의 데이터와 다른 태그의 데이터를 불러오고 싶었는데, ID를 부여하기엔 for문으로 만들어진 태그들이라 임의로 id를 부여 할 수가 없었음. |⦁ 솔루션1: 처음에 만들었던 유효성검사는 reg = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}/;로, 당시에는 숫자만 입력하도록 유효성검사를 했다고 생각했는데, 다시 생각해보니 앞에 2자리, 가운데 3자리, 뒤에 4자리까지만 숫자가 입력되면 10번째 자리부터는 어떤 문자든 입력될 수 있었다. 유효성검사를 reg = /^[0-9]{2,3}[0-9]{3,4}[0-9]{6}/; 로 바꾸고, 전화번호 입력칸의 maxlength 값을 11로 하여 숫자 11자리까지만 입력할 수 있도록 수정하여 해결.<br><br>⦁솔루션2: mapper.xml에서 오타로 인한 not found 예외 발생이였음. mapper namespace="com.shop.mapper.CommentMapper"의 CommentMapper를 CommentsMapper로 수정하여 해결<br><br> ⦁솔루션3: id값에 board + ${board.boardKey} 를 부여하여 반복시 해당 태그의 id가 자동으로 boardKey에 맞게 생성되어 겹치지가 않게 만들 수 있게 됐음.  | 
|고윤재|⦁문제점1: AJAX를 이용하여 JavaScript에서 변수에 값을 담으려고 하였지만, AJAX 통신 내에서만 데이터가 존재하고 AJAX 밖으로 나가면서 사라지는 현상 발생<br><br>⦁ 문제점2: RealTimeAnalyzeService(실시간 통계)에서 Java의 Date를 통해 현재 시스템의 시간을 구해서 변수로 선언하였지만 배포시 실시간으로 시간이 변하지는 않았음<br><br>⦁문제점3: 날짜별/시간별 매출 데이터를 조회하는 쿼리문을 작성했을 때 데이터가 없는 날짜/시간은 0으로 나오는 것이 아니라 레코드 자체가 존재하지 않아 데이터를 바로 사용할 수 없었음|⦁솔루션1: 'async:false'를 이용하여 변수에 담을 수 있게 통신 방식을 변경하였고, AJAX 통신 전에 전역변수로 선언해준 후 값을 전달하여 사용<br><br>⦁솔루션2: Service는 Controller에서 호출될 때마다 생성되고 사라지는 것이 아니라 @Bean으로 한 번 생성되는 것이기 때문에 Service 안에 getTime()이라는 메서드를 만들어 통계 메서드 실행 시 getTime() 메서드를 호출하여 시간 변경<br><br>⦁솔루션3: 날짜/시간에 대한 더미 테이블을 생성한 후 OUTER JOIN을 이용해 데이터가 없어도 레코드가 존재하게 설정| 
