<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/check.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">



			<div class="userMenu">
				<ul class="listMenu">
				
				<c:if test="${empty member}">
					<li><a href="${pageContext.request.contextPath}/member/memberJoin">회원가입</a></li>
					<li><a href="${pageContext.request.contextPath}/member/memberLogin">로그인</a></li>
				</c:if>	
				
				<c:if test="${not empty member}">
					<li><a href="./join.jsp">MyPage</a></li>
					<li><a href="${pageContext.request.contextPath}/member/memberLogOut">로그아웃</a></li>
				</c:if>	
				
					<li><a href="./board.jsp">고객센터</a></li>
					<li><a href="#">배송지역 검색</a></li>
				</ul>
			</div>
			<div class="headerLogo">
				<a href="${pageContext.request.contextPath}"><img alt="" src="${pageContext.request.contextPath}/resources/images/logo.png"></a>
			</div>
			<div class="gnb">
				<ul>
					<li class="menu1"><a href="#">전체 카테고리</a></li>
					<li><a href="#">신상품</a></li>
					<li><a href="#">베스트</a></li>
					<li><a href="#">알뜰쇼핑</a></li>
					<li><a href="#">이벤트</a></li>
				</ul>
				<div class="side_search">
					<form class="">
						<input type="text" id="search" class="sc" value="데일리장보기">
						<input type="image" id="searchIcon" class="sicon" src="${pageContext.request.contextPath}/resources/images/ico_search.png">
					</form>
				</div>
				<div class="cart_count">
					<a href="#"><img alt="" src="${pageContext.request.contextPath}/resources/images/ico_cart.png"></a>
				</div>
			</div>
