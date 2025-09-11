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
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<main class="container">
		<h1>공지사항</h1>
		<div class="row-search">
			<c:if test="${memberId eq 'admin'}">
			<button type="button" class="writeBtn">글쓰기</button>
			</c:if>
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
			<c:forEach items="${noticeList }" var="notice" varStatus="i">
				<tr>
					<td>${i.count }</td>
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
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script type="text/javascript">
		document.querySelector(".writeBtn").addEventListener("click",
				function() {
					location.href = "/notice/regist";
				})
	</script>
</body>
</html>
