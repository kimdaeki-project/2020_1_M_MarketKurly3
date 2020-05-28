<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" type="text/css" href="../resources/css/find.css">
    <c:import url="../template/boot.jsp"></c:import>
</head>
<body>

	<c:import url="../template/header.jsp"></c:import>
		
	<form action="./memberFind_Pw_EmailInjeung" method="post">
		<section class="login">
			<div class="section_login">
				<h3 class="tit_login"><strong>비밀번호 찾기</strong></h3>
				<div class="write_form">
					
						<span style="font-size: small; font-weight: bold;">이메일주소 인증번호</span><input type="text" name="emailNum" placeholder="전송된 인증번호를 입력해주세요" value="" id="emailNum">						
						<input type="hidden" name="emailInjeung" value="${dice}" id="emailInjeung">
						<div>인증번호를 못 받았다면? <img alt="" src="../resources/images/injeung.JPG"></div>
					<button type="submit" style="margin-top: 20px;" id="ddd"><span>확인</span></button>
				</div>
			</div>
		</section>
	</form>
		
		<c:import url="../template/footer.jsp"></c:import>


		<script type="text/javascript">
			$("#ddd").click(function(e) {
				if($("#emailInjeung").val()==$("#emailNum").val()){
					alert("이메일 인증 성공");
				}else{
					alert("인증번호를 정확히 입력해 주세요.");
					e.preventDefault();
				}
			});
		
		</script>

</body>
</html>