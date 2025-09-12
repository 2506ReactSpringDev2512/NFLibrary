<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>대출 조회</title>
<link href="${pageContext.request.contextPath}/resources/css/my/mypage_loan.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/resources/css/common/commonpage.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/resources/css/common/reset.css" rel="stylesheet" />
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    
    
    <div class="layout">
      <!-- 좌측 배너 -->
      <div class="left-banner">
        <h3>마이페이지</h3>
		<a href="/member/edit">내 정보 수정</a><hr />
      <a href="/member/loan">대출 조회</a><hr />
      <a href="/member/wishbook">희망 도서 신청 조회</a><hr />
      <a href="/member/exfire">회원 탈퇴</a><hr />
      </div>

      <!-- 본문 -->
      <main class="content">
        <h1>현재 대출 중인 도서 목록</h1>
        <p>대출 건수: ${fn:length(lendList)}</p>
        <hr />
        <table class="loanbooklist">
        	<tr>
            <th>도서명</th>
            <th>저자</th>
            <th>출판사</th>
            <th>대출일</th>
            <th>반납 예정일</th>
            <th>상태</th>
            <th>비고</th>
          	</tr>
          <c:forEach var="lend" items="${lendList}">
			<tr>
  			<td>${lend.book.bookName}</td>
  			<td>${lend.book.bookAuthor}</td>
  			<td>${lend.book.bookPublisher}</td>
  			<td><fmt:formatDate value="${lend.lendDate}" pattern="yyyy-MM-dd"/></td>
			<td><fmt:formatDate value="${lend.returnDate}" pattern="yyyy-MM-dd"/></td>

  			<td>
    		<c:choose>
      			<c:when test="${lend.overdue}">
        		<span id="book_delinquency">연체중</span>
      			</c:when>
      			<c:otherwise>대출중</c:otherwise>
    		</c:choose>
 			 </td>
 			 <td>
    		<form method="post" action="${pageContext.request.contextPath}/member/loan/extend">
      		<input type="hidden" name="bookNo" value="${lend.book.bookNo}" />
      		<button type="submit">연장하기</button>
    		</form>
    		<form method="post" action="${pageContext.request.contextPath}/member/loan/return" onsubmit="return confirm('반납하시겠습니까?');">
     		<input type="hidden" name="bookNo" value="${lend.book.bookNo}" />
      		<button type="submit">반납하기</button>
    		</form>
  			</td>
			</tr>
		</c:forEach>
        </table>
      </main>
    </div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
  </body>
</html>
