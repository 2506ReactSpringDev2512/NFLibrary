<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대출 신청 및 도서조회</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/loan/loan.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/common/commonpage.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/common/reset.css'/>">
</head>
<body>
<!-- 헤더 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<div class="layout">
    <!-- 좌측 배너 -->
    <div class="left-banner">
    <c:if test="${not empty sessionScope.memberId }">
        <h3>마이페이지</h3>
        <a href="/mypage/edit">내 정보 수정</a>
        <hr />
        <a href="/loan/list">대출 조회</a>
        <hr />
        <a href="/book/wish/list">희망 도서 신청 조회</a>
        <hr />
        <a href="/member/withdraw">회원 탈퇴</a>
        <hr />
    </c:if>
    </div>

    <!-- 본문 -->
    <main class="content">
        <div class="loan-wrap">
        <c:if test="${memberId eq 'admin'} }">
            <h1 class="loan-title">도서 대출</h1>
		</c:if>
			<h1 class="loan-title">서적 검색</h1>
            <div class="search-wrap">
                <input type="text" class="loan-search" placeholder="검색어를 입력하세요" />
            </div>

            <div class="loan-divider"></div>

            <p class="loan-note">○○에 대한 검색 결과입니다</p>

            <section class="loan-grid">
                <!-- 1 -->
                <article class="loan-item">
                    <img src="/resources/image/fox.jpg" alt="도서표지" class="book-img" />
                    <div class="info">
                        <div class="book-name">책을먹는여우</div>
                        <button class="apply-btn">신청하기</button>
                    </div>
                </article>

                <!-- 2 -->
                <article class="loan-item">
                    <img src="/resources/image/math.jpg" alt="도서표지" class="book-img" />
                    <div class="info">
                        <div class="book-name">수학의정석미적분I</div>
                        <button class="apply-btn">신청하기</button>
                    </div>
                </article>

                <!-- 3 -->
                <article class="loan-item">
                    <img src="/resources/image/Bang.jpg" alt="도서표지" class="book-img" />
                    <div class="info">
                        <div class="book-name">뺑덕</div>
                        <button class="apply-btn">신청하기</button>
                    </div>
                </article>

                <!-- 4 -->
                <article class="loan-item">
                    <img src="/resources/image/tree.jpg" alt="도서표지" class="book-img" />
                    <div class="info">
                        <div class="book-name">아낌없이주는나무</div>
                        <button class="apply-btn">신청하기</button>
                    </div>
                </article>
            </section>
        </div>
    </main>
</div>

<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>
