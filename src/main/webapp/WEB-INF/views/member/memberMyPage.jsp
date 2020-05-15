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
	<span style="font-size:30px; font-weight:500; ">마이 컬리</span>
 		<div class="contents_inner"><br>
		<span style="color:grey; float : right;">※ 버튼을 클릭해 주세요.&emsp;</span><br>
			
			<div class="button_place">
				
				<!-- 회원정보 버튼 -->
				<a href="${pageContext.request.contextPath}/member/memberMyPage_Info">
					<button class="button">
						<div class="button_image"><img src="${pageContext.request.contextPath}/resources/images/Member_Information.png" alt="" style="width: 100%; height: 100%;"></div>
						<br>
						<div class="button_text1">회원정보</div>
						<div class="button_text2">Member Information</div>
					</button>
				</a>
				
				<!-- 구매내역 버튼 -->
				<a href="${pageContext.request.contextPath}/member/memberMyPage_Purchase">
					<button class="button" style="float : right;">
						<div class="button_image"><img src="${pageContext.request.contextPath}/resources/images/Purchase_Details.png" alt="" style="width: 100%; height: 100%;"></div>
						<br>
						<div class="button_text1"">구매내역</div>
						<div class="button_text2">Purchase Details</div>
					</button>
				 </a>
				 
			</div>
		</div> 
	</div>
</section>



<c:import url="../template/footer.jsp"></c:import>
</body>
</html>