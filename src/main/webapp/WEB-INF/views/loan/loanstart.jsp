<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대출 신청 및 도서조회</title>
	<link href="${pageContext.request.contextPath}/resources/css/loan/loanstart.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/common/commonpage.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/common/reset.css" rel="stylesheet" />
</head>
<script>
function alreadyloan() {
        alert("대여가 불가능합니다. 이미 누군가 대여중인 책입니다.");
}
function loancomplete() {
    	alert("대여가 완료되었습니다.");
}
</script>
<body>
    <!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <div class="layout">
        <!-- 좌측 배너 -->
        <div class="left-banner">
        <h3>마이페이지</h3>
        <a href="#">내 정보 수정</a>
        <hr />
        <a href="#">대출 조회</a>
        <hr />
        <a href="#">희망 도서 신청 조회</a>
        <hr />
        <a href="#">회원 탈퇴</a>
        <hr />
        </div>

    <!-- 본문 -->
    <main class="content">
    <div class="loan-wrap">
    <h1 class="loan-title">도서 대출</h1>
	
	<form action="${pageContext.request.contextPath}/loan/list" method="get">
    	<div class="search-wrap">
        	<input type="search" class="loan-search"  name="keyword" placeholder="도서명 혹은 저자명 입력" />
    	</div>
    </form>

    <div class="loan-divider"></div>

    <p class="loan-note">○○에 대한 검색 결과입니다</p>

    <section class="loan-grid">
    <c:forEach items="${bookList}" var = "book">
    	<article class="loan-item">
        	<img src="${pageContext.request.contextPath}/resources/image/bookimage/book_${book.book_no}.jpg" alt="도서표지" class="book-img" />
        	<div class="info">
            	<div class="book-name">${book.book_name}</div>
            	<c:if test = "${not empty sessionScope.memberId}">
            		<c:choose>
    				<c:when test="${book.lend_YN eq 'Y'}">대여 가능</c:when>
    				<c:when test="${book.lend_YN eq 'N'}">대여 불가</c:when>
    				<c:otherwise>알 수 없음</c:otherwise>
 					</c:choose>
 					<c:choose>
 					<c:when test="${book.lend_YN eq 'Y'}">
            		<button class	= "apply-btn"
            				onclick	= "loancomplete(); location.href = '${pageContext.request.contextPath}/loan/list?book_no=${book.book_no}'">
            		신청하기
            		</button>
            		</c:when>
            		<c:when test="${book.lend_YN eq 'N'}">
            		<button class	= "apply-btn2"
            				onclick	= "alreadyloan()">
            		신청하기
            		</button>
            		</c:when>
            		</c:choose>
            	</c:if>
        	</div>
    	</article>
    </c:forEach>
    </section>
    </div>
</main>
    </div>
    <!-- 푸터 -->
    <footer>
    <div class="footer-container">
    <!-- 왼쪽 -->
    <div class="footer-left">
        <img src="../../image/KH_logo.png" width="40" alt="KH도서관 로고">
        <div class="footer-text">
        <div class="top-line">
            <strong>KH도서관</strong>
            02742 서울특별시 중구 장충제일로 212 | TEL 02-2412-1113
        </div>
        <div class="bottom-line">
            Copyright(c) KH Library. All Rights Reserved
        </div>
        </div>
    </div>

    <!-- 가운데 -->
    <div class="footer-center">
        <img src="../../image/KOGL.jpg" width="80" alt="공공누리">
        <img src="../../image/" width="40" alt="OPEN">
        <img src="../../image/" width="40" alt="서비스마크">
    </div>

    <!-- 오른쪽 -->
    <div class="footer-right">
        <a href="#"><img src="../../image/korea.png" width="28" alt="한국"></a>
        <a href="#"><img src="../../image/youtube.png" width="28" alt="유튜브"></a>
        <a href="#"><img src="../../image/instagram.png" width="28" alt="인스타그램"></a>
        <a href="#"><img src="../../image/facebook.png" width="28" alt="페이스북"></a>
        <a href="#"><img src="../../image/X.png" width="28" alt="X"></a>
    </div>
    </div>
</footer>
</body>
</html>