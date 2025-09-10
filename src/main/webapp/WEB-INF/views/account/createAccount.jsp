<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>회원가입</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/account/createAccount.css'/>" />
  <link rel="stylesheet" href="<c:url value='/resources/css/common/commonpage.css'/>" />
  <link rel="stylesheet" href="<c:url value='/resources/css/common/reset.css'/>" />
</head>
<body>
<header>
  <!-- 왼쪽 로고 -->
  <div class="logo">
    <img src="<c:url value='/resources/image/KH_logo.png'/>" width="50" alt="KH로고" />도서관
  </div>

  <!-- 가운데 네브 -->
  <nav class="main-nav">
    <a href="<c:url value='/loan/apply'/>">대출신청</a>
    <a href="<c:url value='/book/wish'/>">희망도서신청</a>
    <a href="<c:url value='/guide'/>">도서관 이용안내</a>
    <a href="<c:url value='/notice/list'/>">공지사항</a>
  </nav>

  <!-- 오른쪽 네브 -->
  <nav class="user-nav">
    <a href="<c:url value='/'/>">홈</a>
    <a href="<c:url value='/logout'/>">로그아웃</a>
    <a href="<c:url value='/mypage'/>">마이페이지</a>
  </nav>
</header>

<main class="container">
  <h1>기본정보 입력</h1>
  <p><span class="star">*</span>표시가 있는 항목은 필수 입력 항목 입니다.</p>
  <hr />

  <!-- 컨트롤러 예시: POST /member/join -->
  <form action="<c:url value='/member/signup'/>" method="post">
  <div class="form-row">
    <label for="memberName"><span class="star">*</span> 성명</label>
    <input type="text" id="memberName" name="memberName" required />
  </div>
  <hr />

  <div class="form-row">
    <label for="age"><span class="star">*</span> 나이</label>
    <input type="number" id="age" name="age" min="0" required />
  </div>
  <hr />

  <div class="form-row">
    <label><span class="star">*</span> 성별</label>
    <div class="row-gender">
      <label class="label-radio"><input type="radio" name="gender" value="M" checked /> 남</label>
      <label class="label-radio"><input type="radio" name="gender" value="F" /> 여</label>
    </div>
  </div>
  <hr />

  <div class="form-row">
    <label for="memberId"><span class="star">*</span> 아이디</label>
    <input type="text" id="memberId" name="memberId" required />
  </div>
  <hr />

  <div class="form-row">
    <label for="memberPw"><span class="star">*</span> 비밀번호</label>
    <input type="password" id="memberPw" name="memberPw" required />
  </div>
  <hr />

  <div class="form-row">
    <label for="phone"><span class="star">*</span> 휴대폰번호</label>
    <input type="text" id="phone" name="phone" required />
  </div>
  <hr />

  <div class="form-action">
    <button class="btn" type="button" onclick="location.href='<c:url value='/'/>'">취소</button>
    <button class="btn" type="submit">회원가입 확인</button>
  </div>
</form>
</main>

<footer>
  <div class="footer-container">
    <!-- 왼쪽 -->
    <div class="footer-left">
      <img src="<c:url value='/resources/image/KH_logo.png'/>" width="40" alt="KH도서관 로고" />
      <div class="footer-text">
        <div class="top-line">
          <strong>KH도서관</strong>
          02742 서울특별시 중구 장충제일로 212 | TEL 02-2412-1113
        </div>
        <div class="bottom-line">Copyright(c) KH Library. All Rights Reserved</div>
      </div>
    </div>

    <!-- 가운데 -->
    <div class="footer-center">
      <img src="<c:url value='/resources/image/KOGL.jpg'/>" width="80" alt="공공누리" />
      <%-- 필요 시 파일 채워 사용
      <img src="<c:url value='/resources/image/open.png'/>" width="40" alt="OPEN" />
      <img src="<c:url value='/resources/image/service-mark.png'/>" width="40" alt="서비스마크" />
      --%>
    </div>

    <!-- 오른쪽 -->
    <div class="footer-right">
      <a href="#"><img src="<c:url value='/resources/image/korea.png'/>" width="28" alt="한국" /></a>
      <a href="#"><img src="<c:url value='/resources/image/youtube.png'/>" width="28" alt="유튜브" /></a>
      <a href="#"><img src="<c:url value='/resources/image/instagram.png'/>" width="28" alt="인스타그램" /></a>
      <a href="#"><img src="<c:url value='/resources/image/Facebook.png'/>" width="28" alt="페이스북" /></a>
      <a href="#"><img src="<c:url value='/resources/image/X.png'/>" width="28" alt="X" /></a>
    </div>
  </div>
</footer>
</body>
</html>
