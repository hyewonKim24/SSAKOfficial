# SSAK, 세상에 단 하나뿐인 나만의 책방
### [**시연 영상 바로 보기**](https://youtu.be/XED_q4FEjxo) ![Youtube Badge](https://img.shields.io/badge/Youtube-ff0000?style=flat-square&logo=youtube&link=https://youtu.be/XED_q4FEjxo)
##### 팀원 : 김혜원(조장), 김봉영, 오은실, 이윤진, 이혜림
## Contetns
1. [개요](#소개)
2. [설계의 주안점](#설계의-주안점)
3. [사용기술 및 개발환경](#사용기술-및-개발환경)
4. [프로젝트 기능 구현](#프로젝트-기능-구현)
5. [주요기능](#주요기능)
6. [Document](#Document)
___
## 개요
- 북커버를 직접 디자인하여 책과 함께 주문할 수 있는 온라인 서점
- 기존 온라인 서점과 차별화해 나만의 북커버를 제작하고 책과 함께 구매할 수 있는 웹 사이트 제작
___
## 설계의 주안점
1. **알라딘 OPEN API**를 사용하여 책 정보를 DB에 저장
2. **html2canvas-화면 캡쳐 라이브러리**를 이용해 Custom한 이미지를 리사이징하고 base64 문자열로 변경하여 DB에 저장
3. **MVC Model2** 기반 구축
4. 실제 웹 사이트 구현 시 안정성을 높이기 위해 **커넥션 풀을 별도로 관리**
5. 로그인 이 후 사용자가 로그아웃 액션이 없는 한 로그인 세션을 유지함으로써 **DB 연결 최소화**
6. html, css, JavaScript를 사용한 UI디자인
___
## 사용기술 및 개발환경
|Category|Detail|
|:--:|:--:|
|FrontEnd|HTML5, JS, CSS3, JQuery|
|BackEnd|Java(JDK 1.8), Servlet/JSP|
|OS|Windows 10, MacOS|
|Libray&API|알라딘 OPEN API, html2canvas|
|IDE|eclipse, VisualStudio|
|Server|Tomcat(v8.5)|
|Document|Google Drive, KakaoOven, ERDCloud, diagrams.net|
|CI|Github, Git|
|DateBase|AWS RDS, Oracle(11g)-SQL Developer|
___
## 프로젝트 기능 구현
- **김혜원**
  - 알라딘 Open API 사용
    - JSONP를 사용하여 callback함수를 통해 데이터 확보.
    - JSON파일로 유형별 도서 리스트를 저장.
    - Java에서 파싱하여 데이터 DB에 저장.
  - 회원가입 관련 페이지
    - 미확인 알림, 전체 알림 기능
    - 읽지 않은 알림 모두 읽음
    - 헤더와 사이드바에 소켓 연결하여 실시간 알림 구현
  - 마이페이지
    - 내 정보 수정
    - 비밀번호 변경
    - 내가 주문한 내역 리스트 출력
  - 최근본 상품
    - 최근 본 상품 2개 사이드바에 출력
  - 책 상세 페이지
    - ISBN정보를 들고 실시간으로 Open API에서 데이터 확보.
- **김봉영**
  - 전자결재
    - 전자결재 기안함
    - 전자결재 기안작성
    - 전자결재 결재함
  - 업무 페이지
- **오은실**
  - 장바구니
    - 상품 추가
      - 일괄 담기, 개별 담기, 북커버 상품과 중복상품 구분
    - 상품 삭제
      - 일괄 삭제, 개별 삭제
    - 상품 수량 변경
      - Ajax로 수량 변경과 함께 금액 변경
  - 결제하기
    - 해당 회원의 정보 불러옴
    - 우편번호 api 사용
  - 이벤트
    - 댓글 작성
      - 로그인 한 회원만 작성 가능
    - 댓글 수정, 삭제
      - 자신이 작성한 댓글만, 관리자는 모든 댓글 대상으로
- **이윤진**
  - 공지사항
    - rownum 최신순 정렬 페이징
    - 제목, 내용 검색 기능
    - 관리자 권한만 글 등록, 수정, 삭제 기능 부여
  - 자주하는 질문
    - 글 유형별 조회
    - 제목 드롭다운 내용 출력
  - qna
    - 계정, 권한 별 글 등록, 수정, 삭제 기능 부여
    - 관리자 답글 등록시 목록 화면에 들여쓰기로 출력
- **이혜림**
  - 관리자 페이지
    - 관리자 권한을 가진 사람만 접근 가능하도록 구현
    - 회원 관리
      - 가입한 회원의 정보 조회
      - 가입한 회원의 정보 수정
    - 주문내역 관리
      - 회원의 주문내역 조회
    - 탈퇴요청 관리 
      - 회원 탈퇴 요청 조회
      - 회원 탈퇴 요청 승인
  - 북커버 디자인 페이지
    - 기존 CustomT-shirt 오픈소스 재구성
    - 북커버를 적용할 책 정보, 해당 회원 정보 연결
    - 디자인 이미지 base64 문자열 변환 및 리사이징, DB 저장
    - 장바구니 또는 결제하기에 리사이징된 이미지 출력
___
## 주요기능
**1. 알라딘 OPEN API를 이용한 메인 페이지**
<p align="center">
    <img src = "ForREADME/1.png", width="100%">
</p>

**2. 회원가입**
<p align="center">
    <img src = "ForREADME/2.png", width="100%">
</p>
<p align="center">
    <img src = "ForREADME/3.png", width="100%">
</p>

**3. 비밀번호 찾기**
<p align="center">
    <img src = "ForREADME/4.png", width="100%">
</p>
<p align="center">
    <img src = "ForREADME/5.png", width="100%">
</p>

**4. 상품 검색**
<p align="center">
    <img src = "ForREADME/6.png", width="100%">
</p>
<p align="center">
    <img src = "ForREADME/7.png", width="100%">
</p>

**5. 고객센터**
<p align="center">
    <img src = "ForREADME/8.png", width="100%">
</p>
<p align="center">
    <img src = "ForREADME/9.png", width="100%">
</p>

**6. 관리자 페이지**
<p align="center">
    <img src = "ForREADME/10.png", width="100%">
</p>
<p align="center">
    <img src = "ForREADME/11.png", width="100%">
</p>

**7. 북커버 디자인**
<p align="center">
    <img src = "ForREADME/13.png", width="100%">
</p>

**8. 이벤트 페이지**
<p align="center">
    <img src = "ForREADME/14.png", width="100%">
</p>
<p align="center">
    <img src = "ForREADME/15.png", width="100%">
</p>

**9. 장바구니**
<p align="center">
    <img src = "ForREADME/16.png", width="100%">
</p>
<p align="center">
    <img src = "ForREADME/17.png", width="100%">
</p>

**10. 결제하기**
<p align="center">
    <img src = "ForREADME/18.png", width="100%">
</p>
<p align="center">
    <img src = "ForREADME/19.png", width="100%">
</p>

___
## Document

**1. 유스케이스**
<p align="center">
    <img src = "ForREADME/usecase.png", width="100%">
</p>
**2. ERD**
<p align="center">
    <img src = "ForREADME/erd.png", width="100%">
</p>
