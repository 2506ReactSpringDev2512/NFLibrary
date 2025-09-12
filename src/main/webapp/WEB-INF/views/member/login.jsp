<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<link href="${pageContext.request.contextPath}/resources/css/my/mypage_loan.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/account/login.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/resources/css/common/commonpage.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/resources/css/common/reset.css" rel="stylesheet" />
<body>
<!-- 헤더 -->
  <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<c:if test="${param.msg == 'loginNeeded'}">
    <script>
        alert('로그인이 필요합니다.');
    </script>
	</c:if>
  	<div class="logincontainer">
	<h1>로그인</h1>
	<c:if test="${memberId eq null }">
		<form action="/member/login" method="post">
			ID : <input type = "text" name="memberId"> <br>
			PW : <input type="password" name="memberPw"> <br>
			<input type="submit" value="로그인" class="btn btn-login">
		</form>
		<a href="/member/signup" class="btn btn-signup">1. 회원가입</a>
	</c:if>
	<c:if test="${sessionScope.memberId ne null }">
		<h3>${memberName }님 환영합니다<a href="/member/logout">로그아웃</a></h3>
		<ul>
			<li><a href="/member/signup">1. 회원가입</a></li>
			<c:if test="${memberId eq 'admin' }">
			<li><a href="/member/list">2. 회원 전체조회</a></li>			
			<li><a href="/member/search">3. 회원 검색(아이디)</a></li>
			<li><a href="/member/update">4. 회원 정보 수정</a></li>
			<li><a href="/member/delete">5. 회원 정보 삭제</a></li>
			</c:if>
		</ul>	
	</c:if>
	</div>
	<!-- 푸터 -->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html> 