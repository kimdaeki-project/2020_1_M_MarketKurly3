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
		

		<section class="login">
			<div class="section_login">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/pw_success.JPG" width="99%">
						<div style="height: 70px; width: 337px;">
						<div style="font-size: small; text-align:center; font-weight: bold;">입력하신 ${email}으로 인증번호가 발송되며, 
						인증 후 비밀번호가 재발급됩니다. 전송량이 많은 경우 이메일 전송이 지연될 수 있습니다.</div> 
						</div>
						
					<form action="./memberFind_Pw_UsingEmail" method="post" class="find_form">
					<input type="hidden" name="email" value="${email}">
					<br>
					<button type="submit" class="find"><span>인증번호 받기</span></button>
					</form>
					
				</div>
			</div>
		</section>
		
		
		<c:import url="../template/footer.jsp"></c:import>


		<script type="text/javascript">
		
		
		</script>

</body>
</html>