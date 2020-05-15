<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../resources/css/mypage.css">
<c:import url="../template/boot.jsp"></c:import>

</head>

<body>
<c:import url="../template/header.jsp"></c:import>

<section class="mypage">

<!-- top -->
	<div class="mypage_top">
		<div class="user"><span class=glad>일반</span> &ensp; <span class=name>김소연</span> 님~ 방문을 환영합니다!</div>
	</div> 

<!-- contents -->	
	<div class="mypage_contents">
 		<div class="contents_inner">
		<span style="color:grey; float : right;">※ 버튼을 클릭해 주세요.&emsp;</span><br>
			
			<div class="button_place">
				
<%-- 				<!-- 회원정보 버튼 -->
				<a href="${pageContext.request.contextPath}">
				<button class="button"><div>rrr</div>ddd</button>
				</a>
				
				<!-- 구매내역 버튼 -->
				<a href="${pageContext.request.contextPath}">
				<button class="button" style="float : right;"><div>rrr</div>aaa</button>
				 --%>
			</div>
		</div> 
	</div>
</section>



<c:import url="../template/footer.jsp"></c:import>
</body>
</html>