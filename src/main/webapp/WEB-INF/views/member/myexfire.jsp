<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>마이페이지 - 회원탈퇴</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/my/mypage_leave.css'/>" />
  <link rel="stylesheet" href="<c:url value='/resources/css/common/commonpage.css'/>" />
  <link rel="stylesheet" href="<c:url value='/resources/css/common/reset.css'/>" />
</head>
<body>
  <!-- 헤더 -->
  <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

  <div class="layout">
    <!-- 좌측 배너 -->
    <div class="left-banner">
        <h3>마이페이지</h3>
		<a href="/member/edit">내 정보 수정</a><hr />
      	<a href="/member/loan">대출 조회</a><hr />
      	<a href="/member/wishbook">희망 도서 신청 조회</a><hr />
      	<a href="/member/exfire">회원 탈퇴</a><hr />
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

      <!-- 탈퇴 확인 폼 -->
      <form action="/member/exfire" method="post">
		삭제할 아이디 입력 : <input type="text" name="memberId">
		<input type="submit" value="삭제">
	</form>
    </main>
  </div>

  <!-- 푸터 -->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>
