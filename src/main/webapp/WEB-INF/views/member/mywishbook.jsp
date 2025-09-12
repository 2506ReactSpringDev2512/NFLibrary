	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	    
	<%@ page import = "java.util.List"%>
	<%@ page import = "com.nf.library.lend.model.vo.Wishbook" %>
	
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
	
	<% 
		List<Wishbook> wList = (List<Wishbook>)request.getAttribute("wList");
	%>
	
	<%
    String memberId = (String) session.getAttribute("memberId");
	%>
	
	<!DOCTYPE html>
	<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="${pageContext.request.contextPath}/resources/css/loan/wishbook.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/resources/css/common/commonpage.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/resources/css/common/reset.css" rel="stylesheet" />
	    <title>KH도서관</title>
	</head>
	<script>
    const memberId = '<%= memberId != null ? memberId : "" %>';
    
    function goToAddWishbook() {
        if (!memberId) {
            alert("로그인이 필요합니다.");
            window.location.href = '/member/login';
        } else {
            window.location.href = '/addwishbook';
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
<a href="/member/edit">내 정보 수정</a><hr />
      <a href="/member/loan">대출 조회</a><hr />
      <a href="/member/wishbook">희망 도서 신청 조회</a><hr />
      <a href="/member/exfire">회원 탈퇴</a><hr />
	        </div>
	        <main class="content">
	            <h1>내 도서 신청 관리</h1>
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
	            	<c:forEach items="${wList}" var="book" varStatus="status">
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
	        </main>
	    </div>
	        
    <!-- 푸터 -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</body>
	</html>