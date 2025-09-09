<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="${pageContext.request.contextPath}/resources/css/loan/addwishbook.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/common/commonpage.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/common/reset.css" rel="stylesheet" />
    <title>Document</title>
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
        <main class="content">
            <h1>희망 도서 신청</h1>
            <hr>
            <form action="${pageContext.request.contextPath}/addwishbook" method="post" class="list-container">
                <div class="input-container">
                    <label for="">제목</label>
                    <input type="text" name="wishbook_name" required>
                    <label for="">저자</label>
                    <input type="text" name="wishbook_author" required>
                    <label for="">출판사</label>
                    <input type="text" name="wishbook_publisher" required>
					<div class="write-container">
					<button type="submit" class="write">글쓰기</button>            		
            		</div>
                    <label for="">유의사항</label>
                    <div class="infomation">
                        <p>
                        아래 도서는 신청이 제한될 수 있습니다. <br>
                         - 이미 도서관에 소장 중인 도서 <br>
                         - 품절, 절판 등으로 인해 입고가 어려운 도서 <br>
                         - 고가(예: 5만 원 이상) 도서 또는 수험서, 문제집, 워크북 <br> 
                         - 특정 종교, 정치, 이념 등 편향적인 성격의 도서 <br>
                         - 개인적인 취향이나 오락 목적의 도서 (예: 만화, 게임 가이드북 등) <br> <br>
                        신청 후 검토 및 입고 여부 결정까지는 최대 1~2주 소요될 수 있습니다. <br>
                        입고 여부는 ‘마이페이지 > 희망 도서 신청 조회’ 메뉴에서 확인하실 수 있습니다. 
                        </p>
                    </div>
                
            </form>
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