<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<header>
    <!-- 왼쪽 로고 -->
    <div class="logo">
        <img src="/resources/image/KH_logo.png" width="50" alt="KH로고">도서관
    </div>

    <!-- 가운데 네브 -->
    <nav class="main-nav">
    <c:if test="${not empty sessionScope.memberId }">
        <a href="/loan/list">대출신청</a>
        <a href="/wishbook">희망도서신청</a>
    </c:if>
        <a href="/library/guide">도서관 이용안내</a>
        <a href="#">공지사항</a>
    </nav>

    <!-- 오른쪽 네브 -->
    <nav class="user-nav">
    <c:if test="${not empty sessionScope.memberId }">
        <a href="/">홈</a>
        <a href="/member/logout">로그아웃</a>
        <a href="/member/mypage">마이페이지</a>
        <a href="/loan/list">서적검색</a>
    </c:if>
    <c:if test="${empty sessionScope.memberId }">
    	<a href="/">홈</a>
        <a href="/member/login">로그인</a>
        <a href="/member/signup">회원가입</a>
        <a href="/loan/list">서적검색</a>
    </c:if>
    </nav>
    </header>