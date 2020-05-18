<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../resources/css/mypage.css">
<link rel="stylesheet" type="text/css" href="../resources/css/mypage_info.css">
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
	<div class="mypage_contents2">
			<span style="font-size:30px; font-weight:500;" >회원 정보</span>
			<br><br>
			
				<span style="font-size:20px; font-weight:500;" >&ensp;기본 정보</span>
				<br><br>
				<div class="line">
				<span>
					<div class="subject">
					</div>
				</span>
				<span>	
					<div class="content">
					</div>
				</span>
				</div>
				
				<br><br>
				
				<span style="font-size:20px; font-weight:500;" >&ensp;추가 정보</span>
				<br><br>
				<div class="line">
				dddd
				</div>
				
		<!-- 수정, 삭제 버튼 -->
	</div>
</section>

<c:import url="../template/footer.jsp"></c:import>
</body>
</html>