<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>대출 조회</title>
    <link href="${pageContext.request.contextPath}/resources/css/loan/loansearch.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/common/commonpage.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/common/reset.css" rel="stylesheet" />
  </head>
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
        <h1>현재 대출 중인 도서 목록</h1>
        <hr />
        <table>
          <tr>
            <th>도서명</th>
            <th>저자</th>
            <th>출판사</th>
            <th>대출일</th>
            <th>반납 예정일</th>
            <th>상태</th>
            <th>비고</th>
          </tr>
          <tr>
            <td>수학의 정석I</td>
            <td>홍성대</td>
            <td>성지출판(주)</td>
            <td>2017.03.02</td>
            <td>2019.12.25</td>
            <td id="book_delinquency">연체중</td>
            <td><button>연장하기</button></td>
          </tr>
          <tr>
            <td>수학의 정석II</td>
            <td>홍성대</td>
            <td>성지출판(주)</td>
            <td>2017.03.02</td>
            <td>2019.12.25</td>
            <td>대출중</td>
            <td><button>연장하기</button></td>
          </tr>
          <tr>
            <td>수학의 정석 미적분I</td>
            <td>홍성대</td>
            <td>성지출판(주)</td>
            <td>2017.03.02</td>
            <td>2019.12.25</td>
            <td>대출중</td>
            <td><button>연장하기</button></td>
          </tr>
          <tr>
            <td>수학의 미적분II</td>
            <td>홍성대</td>
            <td>성지출판(주)</td>
            <td>2017.03.02</td>
            <td>2019.12.25</td>
            <td>대출중</td>
            <td><button>연장하기</button></td>
          </tr>
          <tr>
            <td>수학의 확률과 통계</td>
            <td>홍성대</td>
            <td>성지출판(주)</td>
            <td>2017.03.02</td>
            <td>2019.12.25</td>
            <td>대출중</td>
            <td><button>연장하기</button></td>
          </tr>
        </table>
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
