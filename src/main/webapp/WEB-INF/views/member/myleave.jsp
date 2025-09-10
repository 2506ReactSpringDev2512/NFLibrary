<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>마이페이지 - 회원탈퇴</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/mypage/mypage_leave.css'/>" />
  <link rel="stylesheet" href="<c:url value='/resources/css/common/commonpage.css'/>" />
  <link rel="stylesheet" href="<c:url value='/resources/css/common/reset.css'/>" />
</head>
<body>
  <!-- 헤더 -->
  <header>
    <div class="logo">
      <img src="<c:url value='/resources/image/KH_logo.png'/>" width="50" alt="KH로고">도서관
    </div>

    <nav class="main-nav">
      <a href="<c:url value='/loan/apply'/>">대출신청</a>
      <a href="<c:url value='/book/wish'/>">희망도서신청</a>
      <a href="<c:url value='/guide'/>">도서관 이용안내</a>
      <a href="<c:url value='/notice/list'/>">공지사항</a>
    </nav>

    <nav class="user-nav">
      <a href="<c:url value='/'/>">홈</a>
      <a href="<c:url value='/logout'/>">로그아웃</a>
      <a href="<c:url value='/mypage'/>">마이페이지</a>
    </nav>
  </header>

  <div class="layout">
    <!-- 좌측 배너 -->
    <div class="left-banner">
      <h3>마이페이지</h3>
      <a href="<c:url value='/mypage/edit'/>">내 정보 수정</a><hr />
      <a href="<c:url value='/loan/list'/>">대출 조회</a><hr />
      <a href="<c:url value='/book/wish/list'/>">희망 도서 신청 조회</a><hr />
      <a href="<c:url value='/member/withdraw'/>">회원 탈퇴</a><hr />
    </div>

    <!-- 본문 -->
    <main class="content">
      <h1>회원 탈퇴</h1>
      <br />
      <b>회원 비밀번호 확인</b>
      <p>
        * 회원 탈퇴 시 모든 대출 기록, 예약 내역 및 개인 정보가 삭제됩니다.<br />
        신중히 결정해 주세요.
      </p>

      <!-- 탈퇴 비밀번호 확인 폼 -->
      <form action="<c:url value='/member/withdraw'/>" method="post">
        <input type="hidden" name="memberId" value="${sessionScope.memberId}" />
        <input type="password" id="inputPw" name="memberPw" class="edit_profile" placeholder="비밀번호를 입력하세요" required />
        <div class="btn_wrap" style="margin-top:16px;">
          <button type="button" class="btn" onclick="location.href='<c:url value='/mypage'/>'">취소</button>
          <button type="submit" class="btn">탈퇴하기</button>
        </div>
      </form>
    </main>
  </div>

  <!-- 푸터 -->
  <footer>
    <div class="footer-container">
      <div class="footer-left">
        <img src="<c:url value='/resources/image/KH_logo.png'/>" width="40" alt="KH도서관 로고">
        <div class="footer-text">
          <div class="top-line">
            <strong>KH도서관</strong>
            02742 서울특별시 중구 장충제일로 212 | TEL 02-2412-1113
          </div>
          <div class="bottom-line">Copyright(c) KH Library. All Rights Reserved</div>
        </div>
      </div>

      <div class="footer-center">
        <img src="<c:url value='/resources/image/KOGL.jpg'/>" width="80" alt="공공누리">
      </div>

      <div class="footer-right">
        <a href="#"><img src="<c:url value='/resources/image/korea.png'/>" width="28" alt="한국"></a>
        <a href="#"><img src="<c:url value='/resources/image/youtube.png'/>" width="28" alt="유튜브"></a>
        <a href="#"><img src="<c:url value='/resources/image/instagram.png'/>" width="28" alt="인스타그램"></a>
        <a href="#"><img src="<c:url value='/resources/image/facebook.png'/>" width="28" alt="페이스북"></a>
        <a href="#"><img src="<c:url value='/resources/image/X.png'/>" width="28" alt="X"></a>
      </div>
    </div>
  </footer>
</body>
</html>
