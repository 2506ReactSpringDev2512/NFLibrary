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
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
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

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>
