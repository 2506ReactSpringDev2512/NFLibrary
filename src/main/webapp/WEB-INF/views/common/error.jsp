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
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

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
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>