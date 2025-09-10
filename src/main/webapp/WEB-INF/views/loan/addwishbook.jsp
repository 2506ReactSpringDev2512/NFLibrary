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
<script>
function confirmSubmit() {
    if (confirm('작성하시겠습니까?')) {
        alert('작성되었습니다.');
        return true; 
    } else {
        return false;
    }
}
</script>
<body>
    <!-- 헤더 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

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
					<button type="submit" class="write" onclick="return confirmSubmit();">글쓰기</button>            		
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
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>