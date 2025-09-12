<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>공지사항</title>
<link rel="stylesheet" href="/resources/css/notice/noticeDetail.css" />
<link rel="stylesheet" href="/resources/css/common/commonpage.css">
<link rel="stylesheet" href="/resources/css/common/reset.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<!-- 본문 -->
	<div class="container">
		<h1>공지사항</h1>
		<p>여러분의 소중한 공간 KH도서관 정보광장입니다.</p>
		<table class="notice_table">
			<tr>
				<th id="notice_id">제목</th>
				<td>${notice.noticeSubject }</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>첨부파일이 없습니다.</td>
				<th>등록일</th>
				<td id="today-date"></td>
			</tr>
		</table>
		<img src="${notice.noticeImg }" alt="detailImage" class="detailImage"
			style="display: block; margin: 0 auto; margin-top: 15px" /> <br />
		<p>${notice.noticeContent }</p>
		<br />
		<hr />
		<br />
		<c:if test="${memberId eq 'admin'}">
			<button id="deleteBtn">삭제하기</button>
		</c:if>
		<button id="backToList">목록으로</button>
	</div>
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script>
		document.getElementById("today-date").innerText = new Date()
				.toLocaleDateString();
		document.querySelector("#backToList").addEventListener("click",
			function() {
				location.href = "/notice/list";
			});
		document.querySelector("#deleteBtn").addEventListener("click",
			function() {
					location.href = "/notice/delete?noticeNo=${notice.noticeNo }";
			});
	</script>
</body>
</html>
