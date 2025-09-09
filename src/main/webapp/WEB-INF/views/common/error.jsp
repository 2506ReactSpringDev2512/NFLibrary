<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오류 페이지</title>
	<link href="${pageContext.request.contextPath}/resources/css/common/error.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/common/commonpage.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/common/reset.css" rel="stylesheet" />
</head>
<body>
    <!-- 헤더 -->
    <header>
    <!-- 왼쪽 로고 -->
    <div class="logo">
        <img src="../../image/KH_logo.png" width="50" alt="KH로고">도서관
    </div>

    <!-- 가운데 네브 -->
    <nav class="main-nav">
        <a href="#">대출신청</a>
        <a href="#">희망도서신청</a>
        <a href="#">도서관 이용안내</a>
        <a href="#">공지사항</a>
    </nav>

    <!-- 오른쪽 네브 -->
    <nav class="user-nav">
        <a href="#">홈</a>
        <a href="#">로그아웃</a>
        <a href="#">마이페이지</a>
    </nav>
    </header>

    <!-- 메인 -->
    <main>
        <div class="bg"></div>
        <div class="content">
            <img src="${pageContext.request.contextPath}/resources/image/Alert.png" alt="경고 이미지" />
            <h1>웹 서비스에 문제가 발생했습니다.</h1>
            <h2 class="errorcode">문제 코드 : ${errorMsg}</h2>
            <p>위 코드를 고객센터에 제보해 주시면 신속히 조치하도록 하겠습니다.</p> <br>
            <div class="callbox">
            <p>고객센터</p> <br>
            <p>전화번호 : 02-2412-1113</p>
            <p>이메일 : 000000@naver.com</p>
            </div>  
            <a href="/main">메인 화면</a>

        </div>
    </main>

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
</body>
</html>