<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>공지사항</title>
<link rel="stylesheet" href="/resources/css/notice/noticeMain.css" />
<link rel="stylesheet" href="/resources/css/common/commonpage.css">
<link rel="stylesheet" href="/resources/css/common/reset.css">
</head>
<body>
	<!-- 헤더 -->
	<header>
		<!-- 왼쪽 로고 -->
		<div class="logo">
			<img src="/resources/image/KH_logo.png" width="50" alt="KH로고">도서관
		</div>

		<!-- 가운데 네브 -->
		<nav class="main-nav">
			<a href="#">대출신청</a> <a href="#">희망도서신청</a> <a href="#">도서관 이용안내</a>
			<a href="#">공지사항</a>
		</nav>

		<!-- 오른쪽 네브 -->
		<nav class="user-nav">
			<a href="/">홈</a> <a href="/library/logout">로그아웃</a> <a
				href="/library/mypage">마이페이지</a>
		</nav>
	</header>
	<main class="container">
		<h1>공지사항</h1>
		<div class="row-search">
			<button type="button" class="writeBtn">글쓰기</button>
        <form action="/notice/search" method="post">
          <input type="text" name="keyword" placeholder="검색" id="inputSearch" />
          <input type="submit" class="writeBtn" value="검색" />
        </form>
		</div>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성날짜</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${noticeList }" var="notice">
				<tr>
					<td>${notice.noticeNo }</td>
					<td><a href="/notice/detail?noticeNo=${notice.noticeNo }">${notice.noticeSubject }</a></td>
					<td>${notice.noticeWriter }</td>
					<td>${notice.noticeDate }</td>
					<td>${notice.viewCount }</td>
				</tr>
			</c:forEach>
		</table>
		<div class="clickPageDiv">
			<span>1</span> <span>2</span> <span>3</span>
		</div>
	</main>
	<!-- 푸터 -->
	<footer>
		<div class="footer-container">
			<!-- 왼쪽 -->
			<div class="footer-left">
				<img src="/resources/image/KH_logo.png" width="40" alt="KH도서관 로고">
				<div class="footer-text">
					<div class="top-line">
						<strong>KH도서관</strong> 02742 서울특별시 중구 장충제일로 212 | TEL 02-2412-1113
					</div>
					<div class="bottom-line">Copyright(c) KH Library. All Rights
						Reserved</div>
				</div>
			</div>

			<!-- 가운데 -->
			<div class="footer-center">
				<img src="/resources/image/KOGL.jpg" width="80" alt="공공누리">
				<!--         <img src="/resources/image/" width="40" alt="OPEN"> -->
				<!--         <img src="/resources/image/" width="40" alt="서비스마크"> -->
			</div>

			<!-- 오른쪽 -->
			<div class="footer-right">
				<a href="#"><img src="/resources/image/korea.png" width="28"
					alt="한국"></a> <a href="#"><img
					src="/resources/image/youtube.png" width="28" alt="유튜브"></a> <a
					href="#"><img src="/resources/image/instagram.png" width="28"
					alt="인스타그램"></a> <a href="#"><img
					src="/resources/image/Facebook.png" width="28" alt="페이스북"></a> <a
					href="#"><img src="/resources/image/X.png" width="28" alt="X"></a>
			</div>
		</div>
	</footer>
	<script type="text/javascript">
		document.querySelector(".writeBtn").addEventListener("click",
				function() {
					location.href = "/notice/regist";
				})
	</script>
</body>
</html>
