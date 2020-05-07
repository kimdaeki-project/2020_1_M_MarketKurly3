<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="./css/layout.css">
	<link rel="stylesheet" type="text/css" href="./css/login.css">
	
    <c:import url="../template/boot.jsp"></c:import>
</head>
<body>

	<c:import url="../template/header.jsp"></c:import>
		
		<section class="login">
			<div class="section_login">
				<h3 class="tit_login">로그인</h3>
				<div class="write_form">
					<form action="" method="post" enctype="application/x-www-form-urlencoded">
						<input type="text" name="id" placeholder="아이디를 입력하세요">
						<input type="password" name="pw" placeholder="비밀번호를 입력하세요">
						<div class="checkbox_save">
							<label><input type="checkbox" class="check" name="remember" value="remember"> 로그인 상태 유지</label>
							<div class="login_search">
								<a href="#" class="id">아이디 찾기</a>
								<span class="bar">|</span>
								<a href="#" class="pw">비밀번호 찾기</a>
							</div>
						</div>
						<button type="submit"><span>로그인</span></button>
					</form>
					<a href="#"><span>회원가입</span></a>
				</div>
			</div>
		</section>

		<c:import url="../template/footer.jsp"></c:import>

</body>
</html>