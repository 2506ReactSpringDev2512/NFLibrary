	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	    
	<%@ page import = "java.util.List"%>
	<%@ page import = "com.nf.library.lend.model.vo.Wishbook" %>
	
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
	
	<% 
		List<Wishbook> wList = (List<Wishbook>)request.getAttribute("wList");
	%>
	
	<!DOCTYPE html>
	<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="${pageContext.request.contextPath}/resources/css/loan/wishbook.css" rel="stylesheet" />
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
	            <div class="list-container"> 
	                <c:if test="${empty wList}">
	    			<p>등록된 희망도서가 없습니다.</p>
					</c:if>
	            <table class="book-table">
	            <thead>
	                <tr>
	                    <th class="list-number">번호</th>
	                    <th class="list-bookname">도서명</th>
	                    <th class="list-bookauthor">저자</th>
	                    <th class="list-bookpublisher">출판사</th>
	                    <th class="list-status">상태</th>
	                </tr>
	            </thead>
	            <tbody>
	            	<c:forEach items="${WList}" var="book" varStatus="status">
    				<tr>
        				<td>${(currentPage - 1) * 10 + status.index + 1}</td> <!-- 전체 번호 계산 -->
        				<td>${book.wishbook_name}</td>
        				<td>${book.wishbook_author}</td>
        				<td>${book.wishbook_publisher}</td>
        				<c:choose>
            			<c:when test="${book.wishbook_status eq '입고 완료'}">
                			<td class="permit">${book.wishbook_status}</td>
            			</c:when>
            			<c:when test="${book.wishbook_status eq '입고 불가'}">
                			<td class="denied">${book.wishbook_status}</td>
            			</c:when>
            			<c:when test="${book.wishbook_status eq '확인 중'}">
                			<td class="check">${book.wishbook_status}</td>
            			</c:when>
        				</c:choose>
    				</tr>
					</c:forEach>
	            </tbody>
	            </table>
	        </div>
	        <div class="button-write-container">
	        <div class="button-container">
	    	<c:if test="${empty currentPage}">
	        	<c:set var="currentPage" value="1"/>
	    	</c:if>
	
	    	<c:if test="${totalPages < 1}">
	        	<c:set var="totalPage" value="1"/>
	    	</c:if>
	
	    	<c:forEach begin="1" end="${totalPages}" var="i">
	        <button		class="${i == currentPage ? 'checked' : 'unchecked'}"
	            		onclick="location.href='${pageContext.request.contextPath}/wishbook?page=${i}'">
	            ${i}
	        </button>
	    	</c:forEach>
			</div>
	
	        <div class="write-container">
	            <button class="write" onClick="location.href='/addwishbook'">글쓰기</button>
	        </div>
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