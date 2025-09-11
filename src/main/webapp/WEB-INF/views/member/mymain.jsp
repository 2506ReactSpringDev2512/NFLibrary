<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>마이페이지 - 메인</title>
<link rel="stylesheet" href="<c:url value='/resources/css/my/mypage_main.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/common/commonpage.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/common/reset.css'/>" />
</head>
<body>
  <!-- 헤더 -->
  <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

  <!-- 메인 -->
  <div class="layout">
    <!-- 좌측 배너 -->
    <div class="left-banner">
      <h3>마이페이지</h3>
      <a href="/member/edit">내 정보 수정</a><hr />
      <a href="#">대출 조회</a><hr />
      <a href="/wishbook">희망 도서 신청 조회</a><hr />
      <a href="/member/exfire">회원 탈퇴</a><hr />
    </div>

    <!-- 본문 -->
    <main class="content">
      <h1>
        <c:out value="${sessionScope.memberName}" default="회원" />님 환영합니다!
      </h1>

      <div class="user-info">
        <h2>회원 정보</h2>
        <div>
          이름 : <c:out value="${sessionScope.memberName}" default="-" />님<br />
          전화번호 : <c:out value="${sessionScope.phone}" default="-" /><br />
          아이디 : <c:out value="${sessionScope.memberId}" default="-" />
        </div>
      </div>

      <div class="user-info">
        <h2>대출 요약</h2>
        <div>
          대출 중 도서 수 : <c:out value="${loanCount}" default="0" />권<br />
          연장 가능 도서 수 : <c:out value="${extendableCount}" default="0" />권<br />
          연체 도서 수 : <c:out value="${overdueCount}" default="0" />권
        </div>
        <button class="loan-actions" onclick="location.href='<c:url value='/loan/list'/>'">대출 현황</button>
      </div>
    </main>
  </div>

  <!-- 푸터 -->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>
