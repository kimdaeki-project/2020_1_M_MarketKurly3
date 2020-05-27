<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" type="text/css" href="./css/find.css">
	
    <c:import url="../template/boot.jsp"></c:import>
</head>
<body>

	<c:import url="../template/header.jsp"></c:import>
		
	<form action="./memberFind_Id" method="post">
		<section class="login">
			<div class="section_login">
				<h3 class="tit_login"><strong>비밀번호 찾기</strong></h3>
				<div class="write_form">
					
						<span style="font-size: small; font-weight: bold;">이름</span><input type="text" name="name" placeholder="이름을 입력하세요" value="">						
						<span style="font-size: small; font-weight: bold;">아이디</span><input type="text" name="id" placeholder="아이디를 입력하세요" value="">						
						<span style="font-size: small; font-weight: bold;">이메일</span><input type="text" name="email" placeholder="이메일을 입력하세요" value="">
						

					<button type="submit" style="margin-top: 20px;"><span>확인</span></button>
				</div>
			</div>
		</section>
	</form>
		
		<c:import url="../template/footer.jsp"></c:import>


		<script type="text/javascript">
		
		
		</script>

</body>
</html>