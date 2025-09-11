<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>공지사항 등록</title>
<link rel="stylesheet" href="/resources/css/notice/noticeRegist.css" />
</head>
<body>
	<div id="container">
		<h1>공지사항 등록</h1>
		<h4>제목</h4>
		<form action="/notice/regist" method="post">
			<input type="text" name="title" id="noticeTitle"
				placeholder="제목을 입력해주세요" />
			<h4>내용</h4>
			<textarea name="content" id="noticeContent" placeholder="내용을 입력해주세요"></textarea>
			<h4>첨부 파일 등록</h4>
			<div id="imageFileDiv">
				<input type="file" name="file" id="imageFileUpload" />
			</div>
			<input type="submit" value="등록" id="noticeSubmit" />
		</form>
	</div>
</body>
</html>
