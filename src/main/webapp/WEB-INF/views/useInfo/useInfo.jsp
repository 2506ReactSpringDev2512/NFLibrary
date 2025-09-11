<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>도서관 이용안내</title>
		<link href="${pageContext.request.contextPath}/resources/css/useInfo/useInfo.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/resources/css/common/commonpage.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/resources/css/common/reset.css" rel="stylesheet" />
  </head>
  <body>
    <!-- 헤더 -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<!-- 메인 -->
    <main class="container">
      <h1 class="mainTitle">도서관 이용안내</h1>
      <hr>
      <ol>
        <ul>
          <h4><span class="diamond">◈</span> 오시는 길</h4>
          <li>02742 서울특별시 종로구 청계천로 212</li>
        </ul>
        <ul>
          <h4><span class="diamond">◈</span> 이용시간</h4>
          <li>평일 09:00 ~ 20:00</li>
          <li>주말 08:00 ~ 22:00</li>
        </ul>
        <ul>
          <h4><span class="diamond">◈</span> 문의</h4>
          <li>02-2412-1113</li>
        </ul>
        <ul>
          <h4><span class="diamond">◈</span> 이용 규정</h4>
          <li>조용히 이용해주세요</li>
          <li>음식 및 음료 반입 금지</li>
          <li>회원 가입 후 대출가능 (학생/교직원/일반회원 등)</li>
        </ul>
        <ul>
          <li><span>대출기간 </span> : 15일</li>
          <li><span>대출 가능 권수 </span> : 최대 5권</li>
          <li><span>반납 방법 </span> : 도서관 반납함 직접 반납</li>
          <li><span>도서 대출 신청 방법</span></li>
        </ul>
      </ol>
      <div class="book-loan-guide">
        <div class="book-loan-guide-map">
          도서관 홈페이지 접속,<br />
          로그인 후
        </div>
        <div class="arrow">→</div>
        <div class="book-loan-guide-map">
          도서 조회 및<br />
          [신청하기] 버튼 클릭
        </div>
        <div class="arrow">→</div>
        <div class="book-loan-guide-map">도서 정보 확인</div>
        <div class="arrow">→</div>
        <div class="book-loan-guide-map">신청 완료</div>
      </div>
      <ul>
        <h4><span class="diamond">◈</span> 신청이 되지 않는 경우</h4>
        <li>회원가입을 하지 않은 경우</li>
        <li>이용자가 도서대출 가능 권수를 초과한 경우</li>
        <li>연체로 인해 대출 정지된 경우</li>
        <li>
          도서관 정책상 선정 기준에 맞지 않거나, 일부 내용이 부적절한 도서는
          신청이 제한될 수 있습니다.
        </li>
      </ul>
      <h1>이용시간 안내</h1>
      <table>
        <tr>
          <th></th>
          <th>평일</th>
          <th>주말</th>
        </tr>
        <tr>
          <td>도서관 이용 시간</td>
          <td>09:00 - 20:00</td>
          <td>08:00 - 22:00</td>
        </tr>
      </table>
    </main>
   	<!-- 푸터 -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
  </body>
</html>
