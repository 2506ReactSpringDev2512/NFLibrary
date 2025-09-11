<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>KH도서관</title>
    <link rel="stylesheet" href="/resources/css/main/main.css" />
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<main>
    <div class="bg"></div>
    <div class="content">
        <h1>KH도서관에 오신 것을 환영합니다!</h1>
        <form action="/book/search" method="post">
        <input type="text" name="searchBook" class="search-bar" placeholder="검색어를 입력해주세요" />
        </form>
    </div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>
