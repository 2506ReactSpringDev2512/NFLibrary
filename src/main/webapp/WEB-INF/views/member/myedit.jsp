<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>내 정보 수정</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/my/mypage_edit_profile.css'/>">
  <link rel="stylesheet" href="<c:url value='/resources/css/common/commonpage.css'/>">
  <link rel="stylesheet" href="<c:url value='/resources/css/common/reset.css'/>">
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
      <h1>내 정보 수정</h1>

      <form action="/mypage/update" method="post">
        <!-- 식별용 hidden -->
        <input type="hidden" name="memberId" value="${sessionScope.memberId}"/>

        <table>
          <tr>
            <th>이름</th>
            <td>${sessionScope.memberName}</td>
          </tr>
          <tr>
            <th>아이디</th>
            <td>${sessionScope.memberId}</td>
          </tr>
          <tr>
            <th>비밀번호</th>
            <td><input type="password" class="edit_profile" name="memberPw" /></td>
          </tr>
          <tr>
            <th>비밀번호 확인</th>
            <td><input type="password" class="edit_profile" name="memberPwConfirm" /></td>
          </tr>
          <tr>
            <th>이메일</th>
            <td><input type="text" class="edit_profile" name="email" value="${sessionScope.memberEmail}"/></td>
          </tr>
          <tr id="edit_address">
            <th>주소</th>
            <td>
              <textarea class="edit_profile" id="input_edit_address" name="address">${sessionScope.memberAddress}</textarea>
            </td>
          </tr>
          <tr>
            <th>연락처</th>
            <td><input type="text" class="edit_profile" name="phone" value="${sessionScope.memberPhone}"/></td>
          </tr>
        </table>

        <div class="btn_wrap">
          <button type="button" class="btn" id="cancelBtn" onclick="location.href='<c:url value='/mypage'/>'">취소</button>
          <button type="submit" class="btn" id="editBtn">회원 정보 수정</button>
        </div>
      </form>
    </main>
  </div>

  <!-- 푸터 -->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>
